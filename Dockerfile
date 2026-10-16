# syntax=docker/dockerfile:1

FROM node:22-alpine AS n
WORKDIR /app
COPY package.json package-lock.json .npmrc ./

RUN npm ci --ignore-scripts


FROM n AS dev
ENV NODE_ENV=development
COPY . .

RUN npx svelte-kit sync
EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173"]


FROM n AS build
COPY . .
RUN npx svelte-kit sync && npm run build


FROM node:22-alpine AS prod
ENV NODE_ENV=production \
    HOST=0.0.0.0 \
    PORT=3000
WORKDIR /app


COPY --from=build --chown=node:node /app/build ./build
COPY --from=build --chown=node:node /app/package.json ./package.json
USER node
EXPOSE 3000
CMD ["node", "build"]
