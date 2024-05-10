FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 5000
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]

# # Use an official Node.js runtime as the base image
# FROM node:14

# # Set the working directory in the Docker image
# WORKDIR /usr/src/app

# # Copy package.json and package-lock.json to the Docker image
# COPY package*.json ./

# # Install project dependencies
# RUN npm install

# # Copy the rest of the project to the Docker image
# COPY . .

# # Make the server's port available to the outside world
# EXPOSE 5000

# # Start the server
# CMD [ "npm", "start" ]