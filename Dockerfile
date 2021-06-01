# Build stage
# ----------------------------
FROM node:14.17-alpine3.13 as build

# Copy the app code across
COPY . /app
WORKDIR /app

# Set NODE_ENV so we don't get dev packages, etc
ENV NODE_ENV production

# Install packages in the image
RUN yarn install

# Build keystone
RUN yarn build

# Run stage
# ----------------------------
FROM node:14.17-alpine3.13

# Copy everything across from the build image
COPY --from=build /app /

# Start app in prod mode
CMD ["yarn", "start"]
