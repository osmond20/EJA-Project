<%-- 
    Document   : registrationFailed
    Created on : 24 Aug 2026, 15:23:47
    Author     : osmon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Failed Page</title>
        <style>
                                
            :root{
               --body-font: "Segoe UI", sans-serif;
            }
            
            /* CSS reset*/
            *, *::before, *::after{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }
            
            body{
                display:flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                width: 100%;
                font-family: var(--body-font);
            }
            
            div{
                height: calc(200 / 16 * 1rem);
                width: calc(325 / 16 * 1rem);
                border: 1px solid gray;
                border-radius: calc(5 / 16 * 1rem);
                padding: calc(20 / 16 * 1rem);
                display:flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                gap: 16px;
                background-color: white;
                font-family: var(--body-font);
            }
            
            h1{
                text-align: center;
                font-size: calc(25 / 16 * 1rem);
            }
            

            a{
                text-decoration: none;
                color: black;
                font-size: 12px;
            }
            
            a:hover{
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div>
            <h1>Registration Failed</h1>
            <a href="RegistrationPage.jsp">Retry</a>
        </div>
    </body>
</html>
