# Define la URL base
$baseUrl = "https://start.spring.io/starter.zip"

# Define los parámetros como un diccionario (hashtable)
$params = @{
    dependencies = "web"
    baseDir = "hola-mundo-spring-boot"
    packageName = "com.example.holamundo"
    name = "hola-mundo-spring-boot"
    javaVersion = "21"
}

# Construye la cadena de consulta (query string) con los parámetros
$queryStringArray = $params.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" }
$queryString = $queryStringArray -join '&'

# Forma correctamente la URL completa uniendo la URL base y la cadena de consulta
$url = $baseUrl + "?" + $queryString

# Imprime la URL para verificar su formato
Write-Output "URL generada: $url"

# Verifica que la URL esté bien formada antes de realizar la solicitud
if ($url -match "^https?://.+") {
    # Descarga el archivo ZIP
    $outputFile = "hola-mundo-spring-boot.zip"
    Invoke-WebRequest -Uri $url -OutFile $outputFile
} else {
    Write-Error "La URL generada no es válida: $url"
}

# Descomprime el archivo ZIP
Expand-Archive -Path $outputFile -DestinationPath .

#Set-Location -Path "hola-mundo-spring-boot"

## Actualizar dependencias
# mvn clean install
## Construir el Proyecto
# mvn clean package
## Ejecutar la Aplicación
# mvn spring-boot:run