# Decide which base image to use
# Ensure to use the official image
FROM nginx:latest
# FROM node

# Set the working directory
# WORKDIR /usr/src/app

# Copy the application files to the container
# COPY app /usr/src/app
COPY index.html /usr/share/nginx/html/

# Run npm install to install dependencies
# RUN npm install

# Label it with your name
LABEL MAINTAINER=SHALEKA@SPARTA

# Expose the required ports
EXPOSE 80
# EXPOSE 3000

# Launch the app
CMD ["nginx", "-g", "daemon off;"]
# CMD ["node", "app.js"]




