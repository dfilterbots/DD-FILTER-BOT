# Use a lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy all project files into the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Optional: Unbuffered output for better logging in Render
ENV PYTHONUNBUFFERED=1

# Start the bot
CMD ["python3", "-u", "bot.py"]