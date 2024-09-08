FROM python:3.12.3
 
COPY analytics/ /app
WORKDIR /app

RUN apt update -y && apt install -y build-essential libpq-dev
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt

ENV DB_USERNAME=nhanntt55
ENV DB_PASSWORD=mypassword
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5433
ENV DB_NAME=mydatabase

EXPOSE 5153
 
CMD ["python", "app.py"]
