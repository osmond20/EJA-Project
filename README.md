# ITEJA3-33 Project

## Scenario

City Church wishes to implement a real-time notification system. Church leaders can publish announcements to members regarding upcoming services, events, and ministry activities.


## System Components

- **Servlets**  
  Manage user registration, authentication, and account management.

- **WebSockets**  
  Support real-time notifications.

- **Messaging**  
  - Messages stored temporarily in memory for application use.  
  - **JMS** provides reliable delivery and persistence within the messaging system.


## Storage Approach

For simplicity, both user profiles and messages will be stored temporarily in memory rather than in a database.

### Source
Netshisumbewa, T 

---

## Backend

### User Registration Servlet
- Accept username and password submitted from an HTML form.
- Validate the input data (e.g., ensure fields are not empty, check for duplicate usernames and user roles).
- Store the user credentials in an in-memory data structure (e.g., a HashMap or similar collection).
- Prevent registration if the username already exists.
- Return an appropriate success or error response to the user.

### Login Servlet
- Accept username and password submitted from an HTML form.
- Validate the input data (e.g., ensure fields are not empty, check for duplicate usernames and user roles).
- On successful login, create an HTTP Session and store the authenticated user.
- Return an appropriate success or error response to the user.

### Websocket Endpoint for Messaging
- Implement `@ServerEndpoint`, `onOpen()`, `onClose()`, and `broadcastMessage()`.

### JMS Configuration & Integration with WebSockets
Define the Java Message Service (JMS) configuration required for the church platform to support reliable message persistence.  
Your answer should include:
- A JMS Connection Factory used to establish connections to the messaging provider.  
- A JMS Destination (either a Queue or Topic) where notifications will be stored.

- **WebSocket Integration**: Demonstrate how a notification received from JMS is broadcast to connected WebSocket clients.

### Class
- Create a simple `User` class to hold user details.

## Frontend

### Login Page (`login.jsp`)
- A simple form for user login.

### Registration Page (`registration.jsp`)
- A simple form for user registration.

### Home Page (`home.jsp`)
- The home page where users can view notifications.

### Notification Page (`notification.jsp`)
- Implement role-based access control to ensure only Church Leaders can access `notification.jsp`.
