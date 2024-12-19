# Dockerize-Expense_App
This is a full-stack Expense Tracker Application built using Node.js, Express.js, MongoDB, and EJS (Embedded JavaScript) as the templating engine. The application uses JWT (JSON Web Token) for user authentication and supports Docker for containerization.

Features
1. User Authentication
    Login and Logout functionality using JWT.
    Session auto-extension with every user action.
    Automatic logout upon token expiration.
2. Expense Management
    Add, update, and delete expenses.
    View expense history.
3. Environment Configuration
    Secure environment variables for database connection and JWT secrets.
4. Dockerized Application
    Easily deployable via Docker.
    Includes MongoDB as a service in the Docker setup.
Prerequisites
  Before running the application, ensure you have the following installed:
  Node.js (v16 or later)
  MongoDB
  Docker
  Git
Installation and Setup
1. Clone the Repository
    $ git clone https://github.com/MuhammadAhmedZia/Dockerize-Expense_App.git
    $ cd Dockerize-Expense-App
2. Set Up Environment Variables
   Create a .env file in the root directory and configure the following variables:
     PORT=4000
     MONGO_URL=mongodb://mongo:27017/expenso
     JWT_SECRET=your_jwt_secret_key
3. Install Dependencies
    $ npm install
4. Run the Application Locally
    To start the app locally:
    If you run this app on your locally docker demon then follow this steps
    Access the app at http://localhost:4000.

Docker Deployment
  1. Build the Docker Image
    $ docker build -t expense-app .
  2. Push the image to Docker Hub
     docker push <your-dockerhub-username>/expense-app:latest
  3. Pull and Run the Docker Container
      Pull the image from your docker Hub repository
       docker pull <your-dockerhub-username>/expense-app:latest
  4.   After pull create a folder expense-tracker-app
  5.   Create a docker-compose.yml file and paste it below doce
        Ensure you have a docker-compose.yml file configured:
          version: '3.8'
          services:
            app:
              build: .
              container_name: expenso
              ports:
                - "4000:4000"
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
              container_name: mongodb
              ports:
                - "27017:27017"
              networks:
                - app-network
          networks:
            app-network:
              driver: bridge
2. Set Up Environment Variables
     Create a .env file in the root directory and configure the following variables:
     PORT=4000
     MONGO_URL=mongodb://mongo:27017/expenso
     JWT_SECRET=your_jwt_secret_key

Run the following command to start the application:
  $ docker-compose up -d // run the containers
  $ docker-compose down // stop the containers
  Access the app at http://localhost:4000.
  
Important Note:
1. You run this image locally without pushing image on docker hub
2. Ensure that you config .env and docker-compose.yml file
3. If you run this image after pulling from docker hub then firstly config the .env and docker-compose.yml file in same directory then you run this image smootly
    

