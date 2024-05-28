# syntax=docker/dockerfile:1-labs
FROM debian:12
COPY build.sh /
ENTRYPOINT ["/bin/bash", "-c", "/build.sh"]

RUN --mount=type=bind,target=/mnt

