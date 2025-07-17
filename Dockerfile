# Don't Remove Credit @VJ_Botz
# Subscribe YouTube Channel For Amazing Bot @Tech_VJ
# Ask Doubt on telegram @KingVJ01

FROM python:3.10.8-slim-bookworm

Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

Install required system packages
RUN apt update && apt upgrade -y && apt install -y git

Copy requirements
COPY requirements.txt /requirements.txt

Install Python packages
RUN pip install --no-cache-dir -r /requirements.txt

Copy app files
COPY . /app
WORKDIR /app

Start command (update with your actual start command if needed)
CMD ["python", "bot.py"]