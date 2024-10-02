# Use an official Ubuntu image as the base
FROM ubuntu:20.04

# Set the non-interactive mode for apt to avoid prompts
ARG DEBIAN_FRONTEND=noninteractive

# Install updates and necessary packages
RUN apt-get update && \
    apt-get install -y git curl && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/Educative-Content/aws-compute-services-zero-to-hero-cl-frontend-app.git /app

# Change directory into the cloned repository
WORKDIR /app/aws-compute-services-zero-to-hero-cl-frontend-app

# Install Node.js dependencies
RUN npm install

# Expose the port that the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
