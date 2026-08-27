/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ejaproject;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.*;
/**
 *
 * @author osmon
 */
public class UserManager {
    // Concurrent HashMap for storing users
    private static ConcurrentHashMap<String, User> users = new ConcurrentHashMap<>();
    
    
    // loads into memory and is executed once
    static{
        User adminUser1 = new User();
        User adminUser2 = new User();
        
        adminUser1.setName("Nkosikhona");
        adminUser1.setUsername("Nkosikhona123");
        adminUser2.setName("Ezekiel");
        adminUser2.setUsername("prophetEzzy");
        
        try{
            adminUser1.setPassword(adminUser1.encryptString("lOve1234"));
            adminUser2.setPassword(adminUser2.encryptString("jEsu7893"));
        }
        catch(NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        adminUser1.setRole("CHATTER"); 
        adminUser2.setRole("CHATTER");
        
        
        users.put(adminUser1.getUsername(), adminUser1);
        users.put(adminUser2.getUsername(), adminUser2);
    }
    
    // login
    public static User login(User user) throws NoSuchAlgorithmException{
        String username = user.getUsername();
        String password = user.encryptString(user.getPassword());
        
        // getting user from HashMap
        User storedUser = users.get(username);
        
        if(storedUser != null && password.equals(storedUser.getPassword())){
          user.setName(storedUser.getName());
          user.setValid(true);
          user.setRole(storedUser.getRole());
          System.out.println("Login successful.");
        }
        else{
            user.setValid(false);
            System.out.println("Login unsuccessful, username or password is incorrect.");
        }
        
        return user;
    }
    
    // registration
    public static boolean register(User user) throws NoSuchAlgorithmException{
        String username = user.getUsername();
        
        // Encrypting password
        String password = user.encryptString(user.getPassword());
        user.setPassword(password);
        user.setRole("VIEWER");
        
        if(users.containsKey(username)){
            System.out.println("User already exists.");
            return false;
        }
        
        users.putIfAbsent(username, user);
        System.out.println("Registeration successful.");
        
        return true;  
    } 
}
