package com.notes.project.dao;

import com.notes.project.entities.User;
import java.sql.*;

public class UserDao {
    
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveUser(User user){
        
        boolean f = false;
        
        try {
            
            String query = "insert into user(name,email,password) values(?,?,?)";
            
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            
            pstmt.executeUpdate();
            
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    //get user by username and userpassword
    
    public User getUserByEmailAndPassword(String email, String password){
        User user = null;
        
        try {
            
            String query = "select * from user where email=? and password=?";
            
            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, email);
            psmt.setString(2, password);
            
            ResultSet set = psmt.executeQuery();
            
            if(set.next()){
                user = new User();
                
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    //Update Data
    
    public boolean updateUser(User user){
        boolean f = false;
        
        try {
            
            String query = "update user set name=?, email=?, password=? where id=?";
            
            PreparedStatement psmt = con.prepareStatement(query);

            psmt.setString(1, user.getName());
            psmt.setString(2, user.getEmail());
            psmt.setString(3, user.getPassword());
            psmt.setInt(4, user.getId());
            
            psmt.executeUpdate();
            
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
}
