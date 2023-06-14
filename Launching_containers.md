# Docker

First make sure you have the file you want to run saved in the directory you're working in as ```index.html``` the reason for this is because when it is run, the system will look for the original index.html file and replace it with this one.

Next you want to run an nginx server with the command ``` docker run -d -p 80:80```

Then copy your file over using ```docker cp C:/Users/shale/tech230_visualisation/tech230_docker/```
(I had problems running this command on Git bash so I used a combination of git bash and powershell)

Next create a Dockerfile ```nano Dockerfile``` or create one on VScode and add the following to the file:

```
# decide which base image to use

# enusre to use offcial image
FROM nginx:latest

# label it with your name
LABEL MAINTAINER=SHALEKA@SPARTA

# copy data index.html(htm)
COPY index.html /usr/share/nginx/html/

# required port exposed
EXPOSE 80

# launch the app
CMD ["nginx", "-g", "daemon off;"]
```

Save and exit
this will also copy the file

Next you want to build the image using the command: ```docker build -t shaleka-profile .``` -t will name the image

Then  want to run the image ```docker run -d -p 80:80 shaleka-profile```

Type ```localhost``` in your webserver and the html file (index.html) contents should be showing on the webpage.

# Launch the app

The next step is pretty simple, to launch the app, here are the changes to the docker file:

```
# Decide which base image to use
# Ensure to use the official image
# FROM nginx:latest
FROM node

# Set the working directory
WORKDIR /usr/src/app

# Copy the application files to the container
COPY app /usr/src/app

# Run npm install to install dependencies
RUN npm install

# Label it with your name
LABEL MAINTAINER=SHALEKA@SPARTA

# Expose the required ports
# EXPOSE 80
EXPOSE 3000

# Launch the app
# CMD ["nginx", "-g", "daemon off;"]
CMD ["node", "app.js"]
```

```docker run -d -p 3000:3000 shaleka-app```

This will launch the app on localhost:3000

Once the code works save and push it to your dockerhub repo. first create your repo on docker hub.

Then tag your work to the repo:

```docker tag shaleka-app:latest shaleka-app:v1```
```docker tag shaleka-app:v1 shaleka/tech230-sparta-app:v1```

Then push

```docker push shaleka/tech230-sparta-app:v1```

Check docker hub to see if it worked

To stop your container from running use:

```docker ps``` to get the container id, then:

```docker rm <container_id> -f ```

# Launching the Database

First pull the mongo db image onto your local machine using:

```docker pull mongo``` this will pull the latest mongo db version or ``` docker run -d -p 27017:27017 mongo``` if you are having an issue try a different version I did was ```docker run -d -p 27017:27017 mongo:4.2.24-bionic```

Then to test it go to ```localhost:27017``` in the web browser and you should see:

![Alt text](pics/localhost%20mongo.png)

Next SSH into the mongo image:

```docker exec -it <container_image> sh```

```apt update```

```apt upgrade```

```apt install sudo```

```sudo apt install nano```

Now we want to chnage the bind ip in the config files, so ```ls``` to find the etc directory and cd into it. ```ls``` again to find the config file and then ```sudo nano mongod.conf.orig``` andh chande the bind ip form ```127.0.0.1``` to ```0.0.0.0```

save and exit

