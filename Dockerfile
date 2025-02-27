# Use the official Node.js LTS image
FROM node:lts

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port the application runs on (if applicable)
# EXPOSE 3000

# Define the command to run the application
CMD ["node", "index.js"]
