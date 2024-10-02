# Use an official Amazon Linux 2 image as the base
FROM amazonlinux:2

# Install updates and necessary packages
RUN yum -y update && \
    yum -y install git && \
    yum install -y https://rpm.nodesource.com/pub_16.x/nodistro/repo/nodesource-release-nodistro-1.noarch.rpm && \
    yum install -y nodejs --setopt=nodesource-nodejs.module_hotfixes=1

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
