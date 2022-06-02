echo off
ipconfig | findstr /R /C:"IPv4 Address.*:"
echo Port : 8080
echo.
echo ----------------------------------------------------------------
echo 	        Sayan Dasgupta Creation
echo ----------------------------------------------------------------
echo.
echo.
java -jar target/vom-0.0.1-SNAPSHOT.jar
pause