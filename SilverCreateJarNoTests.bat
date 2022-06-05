echo off
pause
mvn package -DskipTests
pause
xcopy ".\target\vom-0.0.1-SNAPSHOT.jar" ".\Application\vom-0.0.1-SNAPSHOT.jar"