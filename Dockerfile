FROM python:3.11

# Install OS packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    tzdata \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up app directory
WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

# Optional debug
RUN echo "App folder:" && pwd && echo "Files:" && ls -al

#EXPOSE 3000
#EXPOSE 8000
EXPOSE 8080
ENV PORT=8080
CMD ["reflex", "run", "--env", "prod", "--backend-port", "8080"]