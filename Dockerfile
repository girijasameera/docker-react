FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#does nothing automatically, but EBS looks for expose instruction, so no need for -p
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html