FROM python:3.11

# Install CA certs and update timezone
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    tzdata \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

RUN ls -al /app
RUN ls -al /app/ToDoList

#EXPOSE 3000
#EXPOSE 8000
WORKDIR /app/ToDoList
EXPOSE 8080
ENV PORT=8080

CMD ["reflex", "run", "--env", "prod", "8080"]
