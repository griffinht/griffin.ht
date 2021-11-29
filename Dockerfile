FROM node as build

# see .dockerignore
COPY . .
RUN make

FROM scratch

COPY --from=build /build /html