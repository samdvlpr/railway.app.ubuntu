FROM ubuntu:latest

COPY --chmod=755 start.sh ./

ENTRYPOINT ["/bin/sh"]

EXPOSE 22

CMD ["start.sh"]
