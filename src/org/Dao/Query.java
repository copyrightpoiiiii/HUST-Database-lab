package org.Dao;

import java.sql.*;

public class Query {
    String drv = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/lab2?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    String usr = "query";
    String pwd = "query";
    Connection connect;

    public boolean getConnect() {
        try {
            Class.forName(drv).newInstance();
            connect = DriverManager.getConnection(url, usr, pwd);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public int LogIn(String id, String password) {
        /*
         * 传入用户的id，password和grade
         * 如果没有重复id，则注册成功
         * 返回true时表示注册成功，false表示用户名已存在
         */
        int userType = -1;
        if (!getConnect())return -2;
        try {
            CallableStatement cstmt = connect.prepareCall("{call logIn()}");
            ResultSet rs = cstmt.executeQuery();
            //ResultSetMetaData rsmd = rs.getMetaData();
            //int numColumns=rsmd.getColumnCount();
            while(rs.next()){
                userType = rs.getInt(1);
            }
            rs.close();
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userType;
    }
}
