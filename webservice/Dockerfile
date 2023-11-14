FROM eclipse-temurin:11-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} book-service.jar
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /book-service.jar ${0} ${@}"]