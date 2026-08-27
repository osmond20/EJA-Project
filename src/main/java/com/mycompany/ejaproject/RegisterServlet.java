/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ejaproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author osmon
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean registered = false;
        
        String name = request.getParameter("name");
        String username = request.getParameter("un");
        String password = request.getParameter("pw");
        
        User user = new User();
        user.setName(name);
        user.setUsername(username);
        user.setPassword(password);
        user.setRole("VIEWER");
        
        try{
           registered = UserManager.register(user);
        }
        catch(NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        
         if(registered){
             HttpSession session = request.getSession();
             
             session.setAttribute("currentSessionUser", user);
             
             response.sendRedirect("HomePage.jsp");
        }else{
             response.sendRedirect("registrationFailed.jsp");
         }
       
    }

}
