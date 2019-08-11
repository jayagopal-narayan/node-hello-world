# Use a Node JS Base Image.
FROM node:10.15.1-alpine

# Set Maintainer.
LABEL maintainer "Jayagopal Narayanaswamy"

RUN ls && pwd

# Prepare Image.
RUN mkdir /app
WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
