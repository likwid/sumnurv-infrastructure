FROM gliderlabs/alpine:3.2

RUN apk-install \
        python3 \
        python3-dev \
        build-base \
    && pip3 install virtualenv \
    && rm -rf /var/cache/apk/*

WORKDIR /app
ONBUILD COPY . /app
ONBUILD RUN virtualenv /env && /env/bin/pip install -r /app/requirements.txt

EXPOSE 8080
CMD ["/env/bin/python", "main.py"]
