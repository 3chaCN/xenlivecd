# syntax=docker/dockerfile:1
FROM debian:12
COPY xenlivecd /
ENTRYPOINT ["/bin/bash"]

