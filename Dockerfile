FROM --platform=linux/amd64 public.ecr.aws/docker/library/python:3.10-slim-buster
 
COPY analytics/ /app
WORKDIR /app

COPY ./app/requirements.txt requirements.txt

RUN apt update && apt-get install -y build-essential libpq-dev
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt
 
EXPOSE 5153
 
CMD ["python", "app.py"]
