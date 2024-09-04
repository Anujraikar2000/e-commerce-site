# Stage 1: Build React
FROM node : 18—a1pine as
WORKDIR /app
# Install dependencies
COPY package.json package—lock.json . /
RUN yarn install
# Copy source files and build the app
COPY . .
RUN yarn build

# Stage 2: Serve the app with Nginx
FROM nginx : alpine
# Copy the build output to Nginx HTML directory
COPY -—from=build /app/build /usr/share/nginx/html
# Expose port 80
EXPOSE 80
# Start Nginx
CMD [ "nginx", "-g", "daemon off;"J
