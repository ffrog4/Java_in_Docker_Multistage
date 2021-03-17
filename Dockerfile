# перший етап - building з сирців HelloWorld.class
# тут потрібен базовий образ Alpine + JDK
FROM openjdk:8u212-jdk-alpine
WORKDIR /build
ADD HelloWorld.java /build
RUN ["javac", "HelloWorld.java"]

# другий етап - запуск скомпільованого HelloWorld.class
# достатньо базового образу Alpine + OpenJDK JRE
#FROM openjdk:8-jre-alpine
FROM openjdk:8u212-jre-alpine
WORKDIR /app
# копіюємо отриманий на першому етапі HelloWorld.class
COPY --from=0 /build/HelloWorld.class /app
ENTRYPOINT ["java", "HelloWorld"]
