FROM eclipse-temurin:11-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
ENV emailuser=haminhan234@gmail.com
ENV emailpass='grod pkgo frgs cble'
COPY ${JAR_FILE} email-service.jar
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /email-service.jar ${0} ${@}"]