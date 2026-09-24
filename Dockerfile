FROM node:22-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --ignore-scripts
COPY . .
RUN npm run build:dev

FROM node:22-alpine AS runtime
WORKDIR /app
ENV NODE_ENV=production
COPY --from=build /app/.output ./.output
COPY --from=build /app/package.json ./package.json
EXPOSE 3000
CMD ["node", ".output/server/index.mjs"]
