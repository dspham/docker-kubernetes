### Build phase
# Use node:alpine
# Copy the package.json file
# Install dependencies
# Run 'npm run build'

# /app/build <---- all the stuff
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


### Run phase
# Use nginx
# Copy over the result of 'npm run build'
# Start nginx

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html