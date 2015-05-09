# What is Java?

![logo](https://raw.githubusercontent.com/1science/docker-java/latest/logo.png)

Java is a concurrent, class-based, object-oriented language specifically designed to have as few implementation dependencies as possible. 
It is intended to allow application developers to "write once, run anywhere", meaning that code that runs on one platform does not need to be recompiled to run on another.

Java is a registered trademark of Oracle and/or its affiliates.

> [wikipedia.org/wiki/Java_(programming_language)](http://en.wikipedia.org/wiki/Java_%28programming_language%29)

This image is based on [Alpine Linux](https://github.com/1science/docker-alpine) and all the tools related to Java FX have been removed in order to reduce the image size.

The image size is approximately 164 MB.

# Included Display packages

The following packages have been integrated:

- curl
- wget
- ca-certificates
- bash
- tree
- glibc (thanks to the work of [gliderlabs](https://github.com/gliderlabs/docker-alpine/issues/11) )

# Supported tags

-	[`oracle-jre-8`, `latest`](https://github.com/1science/docker-java/tree/oracle-jre-8)
-	[`oracle-jdk-8`](https://github.com/1science/docker-java/tree/oracle-jdk-8)
-	[`oracle-jre-7`](https://github.com/1science/docker-java/tree/oracle-jre-7)
-	[`oracle-jdk-7`](https://github.com/1science/docker-java/tree/oracle-jdk-7)

# Usage

The most straightforward way to use this image is to use a Java container as both the build and runtime environment. 
In your `Dockerfile`, writing something along the lines of the following will compile and run your project:

```dockerfile
FROM 1science/java:oracle-jre-7
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac Main.java
CMD ["java", "Main"]
```

You can then run and build the Docker image:

```
docker build -t my-java-app .
docker run -it --rm --name my-running-app my-java-app
```

# License

All the code contained in this repository, unless explicitly stated, is
licensed under ISC license.

A copy of the license can be found inside the [LICENSE](LICENSE) file.