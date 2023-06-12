# Use the official Node.js 16 image as the base image
FROM node:16 as builder

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


# Use a lightweight Node.js image for the production environment
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the build output from the builder stage to the production image
COPY --from=builder /app/build ./build

# Install serve to run the production build
RUN npm install -g serve

# Expose the desired port (change if necessary)
EXPOSE 3000

# Set the command to serve the production build
CMD ["serve", "-s", "build"]
