plugins {
    `kotlin-dsl`
    id("org.flywaydb.flyway") version "6.4.2"
}

repositories {
    jcenter()
}

dependencies {
    runtimeOnly("com.microsoft.sqlserver:mssql-jdbc:8.2.2.jre8")
}