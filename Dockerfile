FROM node:alpine
# Set the working directory
WORKDIR /app
# Copy the package.json and package-lock.json files
COPY package*.json ./
# Install the dependencies
RUN npm install
# Copy the app files
COPY . .
# Expose the port
EXPOSE 3000

RUN mkdir -p /mnt/c/Windows/System32/WindowsPowerShell/v1.0 && touch $_/powershell.exe && chmod +x $_
# Run the app
CMD ["npm", "start"]
