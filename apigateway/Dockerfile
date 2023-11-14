FROM eclipse-temurin:11-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} apigateway.jar
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /apigateway.jar ${0} ${@}"]