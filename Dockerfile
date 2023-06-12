# Use the official Node.js 16 image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the application code to the container
COPY . .

# Build the application
RUN npm run build

# Expose the desired port (change if necessary)
EXPOSE 3000

# Set the command to run the application
CMD ["npm", "start"]
