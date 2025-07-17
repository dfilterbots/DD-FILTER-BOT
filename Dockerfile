# Use a modern, stable Python image (Debian bookworm base)
FROM python:3.10-slim-bookworm

# Set working directory inside the container
WORKDIR /app

# Install system dependencies (if needed)
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy project files into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your project files
COPY . .

# Command to run your bot (adjust this as per your main script)
CMD ["python", "Script.py"]