FROM maven:3.6.3-openjdk-8

COPY ./project /app
COPY ./entry-point.sh /app/entry-point.sh
RUN chmod +x /app/entry-point.sh
WORKDIR /app

RUN mvn verify
RUN apt update && apt install -y telnet

ENTRYPOINT ["/app/entry-point.sh"]
