# Jdbc-based login system

keyword:`JDBC`,`MySQL`,`servlet`,`JAVA`

The system realizes the functions of login, password retrieval and registration, and completes the operation of adding, deleting, modifying and checking the database data through JDBC.

## login

![](https://raw.githubusercontent.com/pqqqYa/Jdbc-based-login-system/main/showimg/login.png)

## register

![](https://raw.githubusercontent.com/pqqqYa/Jdbc-based-login-system/main/showimg/register.png)

## retrieve

![](https://raw.githubusercontent.com/pqqqYa/Jdbc-based-login-system/main/showimg/forget.png)

## home

![](https://raw.githubusercontent.com/pqqqYa/Jdbc-based-login-system/main/showimg/home.png)

## File structure


~~~
│  .gitignore
│  servlet.iml
│
├─.idea
│  │  .gitignore
│  │  encodings.xml
│  │  material_theme_project_new.xml
│  │  misc.xml
│  │  modules.xml
│  │  uiDesigner.xml
│  │  webContexts.xml
│  │  workspace.xml
│  │
│  ├─artifacts
│  │      servlet_S2024LJ.xml
│  │
│  └─libraries
│          lib.xml
│
├─src
│  └─com
│      └─cn
│          └─shixun
│              ├─pojo
│              │      Result.java
│              │      User.java
│              │
│              ├─servlet
│              │      ForgetServlet.java
│              │      HomeServlet.java
│              │      LoginServlet.java
│              │      RegisterServlet.java
│              │
│              └─util
│                      JdbcUtil.java
│
└─web
    │  index.jsp
    │
    ├─img
    │      background_forget.jpg
    │      background_home.jpg
    │      background_login.jpg
    │      background_register.jpg
    │      favicon.ico
    │      logoglobal.png
    │      word.png
    │
    ├─js
    │      jquery-3.5.0.js
    │
    ├─view
    │      forget.jsp
    │      home.jsp
    │      register.jsp
    │
    └─WEB-INF
        │  web.xml
        │
        └─lib
                jackson-annotations-2.11.1.jar
                jackson-core-2.12.5.jar
                jackson-databind-2.11.1.jar
                jasper.jar
                jstl-1.2.jar
                mysql-connector-j-8.4.0.jar
~~~
