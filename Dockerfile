FROM python:3.11

# Install OS dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy dependencies and install
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the entire app
COPY . .

# Export static assets
RUN reflex export --env prod

# Expose port for Cloud Run
ENV PORT=8080
EXPOSE 8080

# Start the Reflex app server
CMD ["reflex", "run", "--env", "prod"]