FROM python:3.11

RUN pip install poetry && useradd -ms /bin/bash resume && \
  poetry config virtualenvs.create false

WORKDIR /resume

ENV PYTHONPATH=/resume

COPY pyproject.toml poetry.lock ./

RUN poetry install --no-root

COPY . .

RUN chown -R resume:resume /resume

USER resume

ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "2055"]
