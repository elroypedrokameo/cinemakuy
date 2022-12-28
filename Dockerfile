FROM node:16.14.0 as builder

WORKDIR /app

COPY . .

RUN npm install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false

RUN npm run build

RUN rm -rf node_modules && \
  NODE_ENV=production npm install \
  --prefer-offline \
  --pure-lockfile \
  --non-interactive \
  --production=true

FROM node:16.14.0

WORKDIR /app

COPY --from=builder /app  .

ENV HOST 0.0.0.0
ENV PORT 8080

CMD [ "npm", "start" ]