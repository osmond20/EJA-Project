<%-- 
    Document   : 403
    Created on : 28 Aug 2026, 10:04:45
    Author     : osmon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>403 Error</title>
        <style>
                 :root{
               --body-font: "Segoe UI", sans-serif;
            }
            
            *,*::before, *::after{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }
            
            body{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                width: 95%;
                font-family: var(--body-font);
            }
            
            div{
                height: 200px;
                width: 400px;
                display: flex;
                flex-direction: column;
                padding:20px;
                gap:20px;
                border: 1px solid gray;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <div>
            <h1>403</h1>
            <h2>Forbidden</h2>
            <p>You are not authorized to view this page :(</p>
        </div>
    </body>
</html>
