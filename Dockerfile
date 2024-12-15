FROM python:3.12

WORKDIR /app
COPY . /app

RUN useradd -UMd "/app" dragon
RUN chown -R dragon:dragon "/app"
USER dragon

ENV PYTHONUNBUFFERED=true
RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["/app/.local/bin/fastapi", "run"]
