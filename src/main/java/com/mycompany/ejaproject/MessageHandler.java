/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/ServletListener.java to edit this template
 */
package com.mycompany.ejaproject;

import javax.ejb.MessageDriven;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;
/**
 * Web application life cycle listener.
 *
 * @author osmon
 */
@MessageDriven(mappedName = "jms/ChurchNotificationQueue")
public class MessageHandler implements MessageListener {

    @Override
    public void onMessage(Message msg) {
        try{
           if(msg instanceof TextMessage){
               TextMessage textMessage = (TextMessage) msg;
               String notification = textMessage.getText();
               System.out.println("Notification received - " + notification);
               
               Socket.broadcast(notification);
           }
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
