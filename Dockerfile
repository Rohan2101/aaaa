FROM python:3

ENV PYTHONBUFFERED True

ENV APP_HOME /app
WORkDIR $APP_HOME
COPY . ./

RUN pip install -r requirements.txt
RUN pip install gunicorn

RUN apt-get update -qqy && apt-get install -qqy \
    tesseract-ocr \
    libtesseract-dev

CMD exec gunicotn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app