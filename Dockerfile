# Step 1: Use an official Node runtime as a parent image
FROM node:18 AS build

# Step 2: Set the working directory in the container
WORKDIR /stuchbery_finn_site

# Step 3: Copy package.json and package-lock.json into the container
COPY package*.json ./

# Step 4: Install the app dependencies inside the container
RUN npm install

# Step 5: Copy the rest of your application’s code into the container
COPY . .

# Step 6: Build the React app for production
RUN npm run build

# Step 7: Use an official Nginx image to serve the build
FROM nginx:alpine

# Step 8: Copy the build files from the previous stage to Nginx’s html directory
COPY --from=build /stuchbery_finn_site/build /usr/share/nginx/html

# Step 9: Expose port 80 to access the app
EXPOSE 80

# Step 10: Start Nginx server
CMD ["nginx", "-g", "daemon off;"]