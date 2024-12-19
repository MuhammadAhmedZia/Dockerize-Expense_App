# Dockerize-Expense_App
This is fullstack expense tracking app based on ejs, tailwand,css, javascript, nodjs, express js and mongodb.
In this app we can add our Income and expense and also re-edit our expense and delete expense.
This Expense app amazing because I will buld fully authentication, authorization and token management.
Unauthorized person cannot see your dashboard and your transaction.
Below we will describe the step to run this app

If you run this app on your locally docker demon then follow this steps

Step#1: Clone this app https://github.com/MuhammadAhmedZia/Dockerize-Expense_App.git
step#2: After clone this app open your docker desktop(Demon)
step#3: RUN this command docker-compose up --build
step#4: Check your container usinng this command docker ps

If you want to run this app after pulling  docker hub then firstly you push this image on dockerhub 
follow these steps 

step#1: Create your account on dockerhub and create repository
step#2: tag your image following this command  "docker tag expense-app your-docker-username/expense-app:latest"
step#3: login to docker Hub to this command "docker login"
step#4: Push the Image to Docker Hub to this command "docker push your-docker-username/expense-app:latest"
step#5: Verify on Docker Hub

After push your docker image to pull your image and follow these commands

step#1: pull you docker image on Docker Hub following command "docker pull your-docker-username/expense-app:latest"
step#2 After pulling the docker image create a new folder
step#3 Inside folder create .env file and write this bellow code
  MONGO_URL = "mongodb://mongo:27017/expenso"
  PORT = 4000
  JWT_Secret = 'your_jwt_secret_key'
Step#4  create docker-compose.yml file and write below code
  version: '3.8'
services:
  app:
    build: .
    container_name: expensooo
    ports:
      - "5000:4000"
    depends_on:
      - mongo
    networks:
      - app-network
    environment:
      - ENV MONGO_URL="mongodb://mongo:27017/expenso"
      - ENV JWT_Secret='your_jwt_secret_key'
    image: ahmedzia786/expenso
  mongo:
    image: mongo
    container_name: mongooseee
    ports:
      - "27017:27017"
    networks:
      - app-network
networks:
  app-network:
    driver: bridge
  Step#5: open your code editer terminal and write this command docker-compose up
  

