FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies: git & ffmpeg
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Optional: log everything immediately
ENV PYTHONUNBUFFERED=1

# Start the bot
CMD ["python3", "-u", "bot.py"]