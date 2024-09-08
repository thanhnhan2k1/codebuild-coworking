FROM python:3.10-slim-buster
 
COPY analytics/ /app
WORKDIR /app

RUN apt update -y && apt install -y build-essential libpq-dev
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt
 
EXPOSE 5153
 
CMD ["python", "app.py"]
