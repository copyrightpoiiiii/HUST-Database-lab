package org.Dao;

import java.sql.*;

public class Write {
    String drv = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/lab2?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    String usr = "write";
    String pwd = "write";
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

    public int SignIn(String id, String password, String phone) {
        /*
         * 传入用户的id，password和grade
         * 如果没有重复id，则注册成功
         * 返回true时表示注册成功，false表示用户名已存在
         */
        int existance = 0;
        if (!getConnect())return -2;
        try {
            CallableStatement cstmt = connect.prepareCall("{call findUser(?)}");
            cstmt.setString(1,id);
            ResultSet rs = cstmt.executeQuery();
            //ResultSetMetaData rsmd = rs.getMetaData();
            //int numColumns=rsmd.getColumnCount();
            if(!rs.next()){
                cstmt=connect.prepareCall("{call signIn(?,?,?)}");
                cstmt.setString(1,id);
                cstmt.setString(2,password);
                cstmt.setString(3,phone);
                cstmt.executeQuery();
                existance=1;
            }
            rs.close();
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
            existance = -3;
        }
        return existance;
    }
}

