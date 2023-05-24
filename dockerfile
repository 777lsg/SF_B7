FROM python:3.8 as first


RUN pip install Flask psycopg2 configparser

FROM python:3.8-slim

RUN apt-get update && apt-get install -y libpq-dev
WORKDIR /srv/app/

COPY --from=first /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
COPY web.py .
COPY web.conf ./conf/

CMD ["python", "web.py"]
