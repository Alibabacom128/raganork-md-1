# Use a stable Node.js base image
FROM node:18-alpine 

# Set the working directory inside the container
WORKDIR /app

# Clone the repository (if private, add authentication)
RUN apk add --no-cache git && \
    git clone --depth=1 https://github.com/souravkl11/raganork-md.git . && \
    rm -rf .git

# Set timezone
ENV TZ=Asia/Kolkata

# Install dependencies
RUN npm install --production

# Expose port if required (adjust as needed)
EXPOSE 3000 

# Start the application
CMD ["node", "index.js"]
