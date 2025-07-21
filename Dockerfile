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

# Build the Reflex static site (no --prod flag)
RUN reflex export

# Expose Cloud Run port
ENV PORT=8080
EXPOSE 8080

# Serve static site
CMD ["python", "-m", "http.server", "8080", "--directory", ".web"]