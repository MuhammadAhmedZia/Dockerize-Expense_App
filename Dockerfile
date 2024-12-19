# Use a lightweight Node.js base image
FROM node:alpine

RUN npm install -g nodemon
# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app's source code
COPY . .

ENV MONGO_URL="mongodb://mongo:27017/expenso"
ENV JWT_Secret='your_jwt_secret_key'
ENV PORT=4000 
# Expose the app's port
EXPOSE 4000

# Start the application
CMD ["npm", "start"]
