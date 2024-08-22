# Usar una imagen base oficial de OpenJDK
FROM openjdk:24-slim

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo JAR de la aplicacion
COPY target/*.jar app.jar

# Exponer el puerto de la aplicacion
EXPOSE 8080

# Comando para ejecutar la aplicacion
ENTRYPOINT ["java", "-jar", "app.jar"]