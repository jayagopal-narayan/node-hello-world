# Use a Node JS Base Image.
FROM node:10.15.1-alpine

# Set Maintainer.
#LABEL maintainer "Jayagopal Narayanaswamy"

# Prepare Image.
#RUN mkdir /app
#WORKDIR /app

#COPY . .

#RUN ls -all && pwd

#RUN npm install

#RUN ls -all && pwd

#EXPOSE 3000

#CMD ["npm", "start"]

#From node:8
# Create app directory

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 4000

CMD [ "npm", "start" ]
