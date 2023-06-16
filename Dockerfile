# Decide which base image to use
# Ensure to use the official image
<<<<<<< HEAD
FROM nginx:latest
# FROM node

# Set the working directory
# WORKDIR /usr/src/app

# Copy the application files to the container
# COPY app /usr/src/app
COPY index.html /usr/share/nginx/html/

# Run npm install to install dependencies
# RUN npm install
=======
# FROM nginx:latest
FROM node

# Set the working directory
WORKDIR /usr/src/app

# Copy the application files to the container
COPY app /usr/src/app

# Run npm install to install dependencies
RUN npm install
>>>>>>> 420f7b41bad5e27d5ebe1529016ef05da62c4444

# Label it with your name
LABEL MAINTAINER=SHALEKA@SPARTA

# Expose the required ports
<<<<<<< HEAD
EXPOSE 80
# EXPOSE 3000

# Launch the app
CMD ["nginx", "-g", "daemon off;"]
# CMD ["node", "app.js"]
=======
# EXPOSE 80
EXPOSE 3000

# Launch the app
# CMD ["nginx", "-g", "daemon off;"]
CMD ["node", "app.js"]
>>>>>>> 420f7b41bad5e27d5ebe1529016ef05da62c4444




