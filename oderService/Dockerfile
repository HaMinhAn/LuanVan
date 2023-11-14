FROM eclipse-temurin:11-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} order-service.jar
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /order-service.jar ${0} ${@}"]