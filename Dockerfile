# Base image
FROM node:19

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app files
COPY . .

# Expose the port your app listens on (assuming it's 3000)
EXPOSE 3000

# Start the app with the 'npm start' command
CMD [ "npm", "start" ]
