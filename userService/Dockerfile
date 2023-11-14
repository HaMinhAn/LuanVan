FROM eclipse-temurin:11-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} user-service.jar
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /user-service.jar ${0} ${@}"]