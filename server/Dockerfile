FROM eclipse-temurin:11-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} server.jar
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /server.jar ${0} ${@}"]