FROM python:3.12.7-slim-bookworm@sha256:60d9996b6a8a3689d36db740b49f4327be3be09a21122bd02fb8895abb38b50d

# Author-only dependency publication. This context contains no task payload,
# reference implementation, fixture, fitted state or calibration evidence.
RUN apt-get -o Acquire::Retries=5 update \
    && apt-get -o Acquire::Retries=5 install -y --no-install-recommends bash curl ripgrep time \
    && rm -rf /var/lib/apt/lists/*
RUN /usr/local/bin/python3 -m pip install --no-cache-dir --retries 5 \
    numpy==2.1.3 scipy==1.14.1 pandas==2.2.3 matplotlib==3.9.2
ENV OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 \
    NUMEXPR_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 PYTHONDONTWRITEBYTECODE=1
WORKDIR /app
