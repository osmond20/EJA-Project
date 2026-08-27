<%-- 
    Document   : LoginPage
    Created on : 24 Aug 2026, 15:21:21
    Author     : osmon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type"  :root{
               --body-font: "Arial", sans-serif;
            }content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            :root{
                --body-font: "Segoe UI", sans-serif;
            }
           
            
            /* CSS reset*/
            *,*::before, *::after{
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
                height: calc(350 / 16 * 1rem);
                width: calc(305 / 16 * 1rem);
                border: 1px solid gray;
                border-radius: calc(10 / 16 * 1rem);
                padding: calc(30 / 16 * 1rem);
                display:flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
            }
            
            form{
                height: 70%;
                width: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items:  center;
                gap: 10px;
            }
    
            
            h1{
                text-align: center;
                font-size: calc(25 / 16 * 1rem);
            }
            
            label{
                font-size: 12px;
                display:flex;
                align-self: start;
            }
            
            input{
                height: 45px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid gray;
                font-family: var(--body-font);
                font-size: calc(14 / 16 * 1rem);
                padding-left: calc(10 / 16 * 1rem);
                padding-right: calc(10 / 16 * 1rem)
            }
            
            button{
                height:40px;
                width: 100%;
                border-radius: 10px;
                border:1px solid black;
                background-color: white;
                color:black;
                font-family: var(--body-font);
                transition: background-color 0.3s ease;
            }
            
            button:hover{
                background-color: black;
                color: white;
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
            <h1>Login Page</h1>
             <form action="LoginServlet" method="post">
                    <label>Username</label>
                    <input type="text" placeholder="Enter your username" name="un">
                    
                    <label>Password</label>
                    <input type="password" placeholder="Enter your password" name="pw">
                    
                    <button type="submit">Submit</button>
            </form>
            
            <a href="RegistrationPage.jsp">If you don't have an account? Register here</a>
        </div>
    </body>
</html>
