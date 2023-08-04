# Use alpine as the base image to keep image size smaller
FROM alpine:latest

# Install all required packages in one RUN instruction not to add extra layers to the image
RUN apk add python3 ; python3 -m ensurepip ; pip3 install --upgrade pip ; pip3 install fastapi "uvicorn[standard]"

# Put COPY instruction after RUN instruction for better caching
# Copy the application code into the image
COPY ./app /app

# Set the working directory as /app to run application code in CMD instruction
WORKDIR /app

# Serve the app via Uvicorn ASGI web server 
CMD [ "sh", "-c", "uvicorn app:app --host 0.0.0.0" ]
