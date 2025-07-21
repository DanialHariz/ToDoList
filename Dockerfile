FROM python:3.11

# Install OS dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Copy dependencies
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . .

# Build the static web version of the app
RUN reflex export --prod

# Expose Cloud Run port
ENV PORT=8080
EXPOSE 8080

# Start server to serve the exported static files
CMD ["python", "-m", "http.server", "8080", "--directory", ".web"]