# Use an official Node.js runtime as a parent image
ARG NODE_VERSION=22.13.1
FROM node:${NODE_VERSION}-alpine

# Set working directory
WORKDIR /usr/src/app

# Use production node environment by default
ENV NODE_ENV=production

# Copy package.json and package-lock.json first to leverage Docker caching
COPY package.json package-lock.json ./

# Install dependencies (ensure all modules are installed)
RUN npm install --omit=dev && npm list

# Copy the rest of the application files
COPY . .

# Run the application as a non-root user for security
USER node

# Expose the port
EXPOSE 5389

# Define the startup command
ENTRYPOINT ["node", "index.js"]
