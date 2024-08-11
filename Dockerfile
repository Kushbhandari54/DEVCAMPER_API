FROM node:22.3-alpine3.19

WORKDIR /server

COPY package.json .  

#Here the (.) means the current directory it is same as /app Here package.json file will be copied to /app directory

RUN npm install


#Why we are copying the whole directory to app directory and whats the purpose of copying package.json separately?

#Its beacuse Docker image works in layers, It means FROM is a layer and WORKDIR is a layer and RUN is a layer,
# And all the layer is cached, so that if COPY package.json is not changed then it will skip this layer , same for RUN command

# But in last copy which copy all the files of the directory becuse we migt need to change anything in the application .

#The summary is , copying twice will give optimization When it will see there is no change in package.json then it will not copy it and comes to RUN and same for RUN and it will then come to other files and only copy other files.


#---------------------      docker ignore -------------------

#Here copy will copy all the files we have in . directory but we dont need the node_modules , same way there might be lots of files and folder we don't need. So That we can use docker ignore file which will help us to ignore the unneccessary files.

COPY . ./

#Its the port number where the server will run

ENV PORT 5000
EXPOSE $PORT


#Entry Point for the container
CMD ["npm", "run", "dev"]

# In the context of the dev script in your package.json file, the command nodemon -L app.js will start nodemon in legacy watching mode, watching for changes to the app.js file and restarting the application when changes are detected.

#CMD [ "nodemon", "app"]


# i think this might work for global nodemon CMD [ "nodemon", "app.js"]



#NOTE: docker run -v pathtofolderlocation:pathtofolercontainer -d --name node-app -p 3000:3000  node-app-image

#docker run -v D:\BackendDevelopment\NodeDocker:/app -d --name node-app -p 5000:5000  node-app-image