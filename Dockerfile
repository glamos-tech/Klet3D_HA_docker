FROM alpine:latest AS builder

RUN apk add --no-cache git ca-certificates

RUN rm -rf /app
ADD "https://api.github.com/repos/glamos-tech/Klet3D_HA_addon/commits?per_page=1" latest_commit
RUN git clone https://github.com/glamos-tech/Klet3D_HA_addon.git /app

FROM nginx:alpine

ARG FLOORPLAN_ID
ARG LICENSE_KEY
ARG TOKEN
ARG HA_URL

COPY --from=builder /app/glamos/static /build/static
COPY --from=builder /app/glamos/index.html /build
COPY --from=builder /app/glamos/ingress.conf /etc/nginx/conf.d/

RUN rm -rf ./build/env-config.js
RUN touch ./build/env-config.js
RUN echo "window._env_ = { floorplanID: '${FLOORPLAN_ID}', licenseKey: '${LICENSE_KEY}', token: '${TOKEN}', homeAssistantURL: '${HA_URL}' }" >> ./build/env-config.js

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

