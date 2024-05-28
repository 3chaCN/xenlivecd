# syntax=docker/dockerfile:1-labs
FROM debian:12
COPY build.sh /
CMD ["/bin/bash", "-c", "/build.sh"]

