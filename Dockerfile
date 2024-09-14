# Step 1: Use an official Node.js runtime as a parent image
FROM node:18 AS build


# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code to the working directory
COPY . .

# Step 6: Build the React application
RUN npm run build

# Step 7: Use an official Nginx image to serve the React application
FROM nginx:alpine

# Step 8: Copy the build output from the previous stage to Nginx's public directory
COPY --from=build /app/build /usr/share/nginx/html

# Step 9: Expose port 7775 to allow external access to the application
EXPOSE 7775

# Step 10: Start Nginx
CMD ["nginx", "-g", "daemon off;"]