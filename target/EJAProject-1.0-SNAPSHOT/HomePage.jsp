<%-- 
    Document   : HomePage
    Created on : 24 Aug 2026, 15:25:32
    Author     : osmon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
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
            
            .container{
                width: 500px;
                height: 450px;
                border:1px solid darkgrey;
                padding: 30px;
                display:flex;
                flex-direction: column;
                align-items:center;
                gap: 20px;
                border-radius: 5px;
            }
            
            #notification-box{
                height: 300px;
                width: 425px;
                border: 1px solid grey;
                border-radius: 5px;
                padding:20px;
            }            
            
            a{
                text-decoration: none;
                color: black;
                font-size: 16px;
            }
            
            a:hover{
                text-decoration: underline;
            }
            
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Church updates</h1>
            <div id="notification-box"></div>
            <!-- Implementing role based functionality using Java Server Pages Tag Library
                if the user is a viewer, the link is not added to the HTML
                and if the user is a chatter, the link is added to the HTML
            -->
            <c:choose>
                <c:when test="${sessionScope.currentSessionUser.getRole() == 'VIEWER'}">
                </c:when>
                <c:otherwise>
                    <a href="Notification.jsp" class="button">Make an announcement</a>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
     <script defer>
            let websocket = new WebSocket("ws://localhost:8080/EJAProject/socketwebserver");
                websocket.onopen = function(){
                    console.log("Connected to WebSocket")
                };
            
                websocket.onmessage = function(event) {
                    let mR = event.data;
                    let notificationBox = document.getElementById("notification-box");
                    // Create the message row
                    let newParagraph = document.createElement("p");
                    newParagraph.className = "alert-item";
                    newParagraph.innerText = mR;
                    // INSERT BEFORE adds it to the absolute TOP of the box
                    notificationBox.insertBefore(newParagraph, notificationBox.firstChild);
                };
                
                websocket.onclose = function(){
                    console.log("WebSocket connection closed.");
                };
    </script>
</html>
