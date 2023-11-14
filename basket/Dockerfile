FROM eclipse-temurin:11-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} basket-service.jar
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /basket-service.jar ${0} ${@}"]