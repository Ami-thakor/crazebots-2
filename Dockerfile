FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

EXPOSE 9002

CMD ["gunicorn", "crazebots.wsgi:application", "--bind", "0.0.0.0:9002"]