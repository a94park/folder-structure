FROM python:3.12

# These are for configuring Python in a Docker environment.
# You can freely just copy and paste them
ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PYTHONDONTWRITEBYTECODE=1 \
    # pip:
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_DEFAULT_TIMEOUT=100 \
    PIP_ROOT_USER_ACTION=ignore

WORKDIR /code

COPY ./ /code/

RUN pip install --no-cache-dir --upgrade . &&\
    rm -rf pyproject.toml src

CMD ["python", "-m", "app"]
