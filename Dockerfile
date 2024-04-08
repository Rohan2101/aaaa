FROM python:3

ENV PYTHONBUFFERED True

ENV APP_HOME /app
WORkDIR $APP_HOME
COPY . ./

RUN pip install -r requirements.txt
RUN pip install gunicorn

CMD exec gunicotn --bind :5000 --workers 1 --threads 8 --timeout 0 app:app