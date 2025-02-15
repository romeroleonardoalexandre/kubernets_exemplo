FROM gcr.io/google_appengine/python

RUN apt-get update && \
    apt-get install -y python3 python-pip && \
    apt-get clean && \
    rm /var/lib/apt/lists/*_*

ADD . /app
WORKDIR /app

RUN pip install -r requirements.txt
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:app"]