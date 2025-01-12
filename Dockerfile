# Stage 1: Build the dist folder using Node.js
FROM node:alpine AS builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the project
RUN npm run build

# Stage 2: Use nginx to serve the built files
FROM nginx:alpine AS runtime

# Copy the built files from the previous stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
