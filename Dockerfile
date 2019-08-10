# Use a Node JS Base Image.
FROM node:10.15.1-alpine

# Set Maintainer.
LABEL maintainer "Jayagopal Narayanaswamy"

# Prepare Image.
RUN mkdir /app
WORKDIR /app

COPY . .

RUN npm install

CMD ["npm", "start"]
