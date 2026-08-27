/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ejaproject;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.*;
import javax.websocket.server.*;
import javax.websocket.*;

/**
 *
 * @author osmon
 */
// defines the name of the server endpoint
@ServerEndpoint("/socketwebserver")
public class Socket {

    private static int counter = 0;
    private static final Set<Session> sessions = new CopyOnWriteArraySet<>();
    private static ConcurrentHashMap<Integer, String> msgHistory = new ConcurrentHashMap<>();
    
    @OnOpen
    public void OnOpen(Session session) throws IOException{
        sessions.add(session);
        System.out.println("Session opened: " + session.getId());
        for(Map.Entry<Integer, String> notification : msgHistory.entrySet()){
            session.getBasicRemote().sendText(notification.getValue());
        }
    }
    
    public static void broadcast(String message) throws IOException{
        msgHistory.put(counter++, message);
        for(Session s : sessions){
            if(s.isOpen()){
                s.getBasicRemote().sendText(message);
            }
        }
    }
    
    @OnClose
    public void OnClose(Session session){
        sessions.remove(session);
        System.out.println("Session removed: " + session.getId());
    }
    
}
