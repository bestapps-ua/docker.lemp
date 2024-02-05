docker build . --tag "YOURTAGNAME"
docker run -it -p YOURPORT:80 -v YOURPROJECTFILESPATH:/var/www/html --name "YOURNAME" YOURTAGNAME:latest

example
```
    docker build . --tag "my"
    docker run -it -p 555:80 -v G:/Projects/Docker/nvvetal/src/www:/var/www/html --name "hello" my:latest
