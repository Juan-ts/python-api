# base python image for custom image
FROM python:3.12-alpine

# create working directory and install pip dependencies
WORKDIR /dt-test-fastapi
COPY . /dt-test-fastapi

RUN \
  apk add --no-cache --virtual .build-deps gcc musl-dev && \
  python3 -m pip install -r requirements.txt --no-cache-dir --upgrade && \
  apk --purge del .build-deps

# Expose port 443 for HTTPS
EXPOSE 8000

# run the uvicorn server  
CMD [ "uvicorn", "main:app" , "--host", "0.0.0.0", "--port", "8000" ]