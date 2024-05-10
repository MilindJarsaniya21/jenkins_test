# Use an official Node.js runtime as the base image
FROM node:14 as build-stage

# Set the working directory in the Docker image
WORKDIR /app

# Copy package.json and package-lock.json to the Docker image
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the project to the Docker image
COPY . .

# Build the app
RUN npm run build

# Production stage
FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]