<%-- 
    Document   : Notification
    Created on : 25 Aug 2026, 15:07:53
    Author     : osmon
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.jms.ConnectionFactory"%>
<%@page import="javax.jms.Queue"%> 
<%@page import="javax.jms.JMSContext"%> 
<c:if test="${sessionScope.currentSessionUser.role != 'CHATTER'}">
    <c:redirect url="/403.jsp"/>
</c:if>
<% 
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String notification = request.getParameter("notification");
    if (notification != null && !notification.trim().isEmpty()) {
            InitialContext context = new InitialContext();
            ConnectionFactory factory = (ConnectionFactory) context.lookup( 
           "ChurchNotificationFactory" ); 
            Queue queue = (Queue) context.lookup( "jms/ChurchNotificationQueue" );
            JMSContext jmsContext = factory.createContext();
            jmsContext .createProducer().send(queue, notification); 
            out.println("<p>Notification sent successfully.</p>" ); 
        } 
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification Page</title>
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
            
            .notification-container{
                margin-top:20px;
                height:400px;
                width: 400px;
                padding: 20px;
                border: 1px solid gray;
                display:flex;
                flex-direction: column;
                align-items: center;
                gap:20px;
                border-radius: 5px;
                background-color:white;
            }
            
            form{
                display:flex;
                flex-direction: column;
                align-items: start;
                gap: 10px;
            }
            
            textarea{
                height: 100px;
                width: 350px;
                border-radius: 10px;
                border: 1px solid gray;
                padding: 15px;
                font-family:var(--body-font);
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
                font-size: 14px;
            }
            
            a:hover{
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="notification-container">
            <h2>Church Notification System</h2> 
            <form method="post"> 
                <label>Notification:</label> 
                <textarea name="notification" placeholder="Enter a message"></textarea>           
                <button type="submit">Send Notification</button>
            </form> 
            <a href="HomePage.jsp" class="button">View Notifications</a>
        </div>
    </body>
</html>


