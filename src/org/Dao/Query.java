package org.Dao;

import java.sql.*;

public class Query {
    String drv = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/lab2?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    String usr = "root";
    String pwd = "949462395";
    Connection connect;
    Statement stm;

    public boolean getConnect() {
        try {
            Class.forName(drv).newInstance();
            connect = DriverManager.getConnection(url, usr, pwd);
            stm = connect.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean newUserRegister(String id, String password) {
        /*
         * 传入用户的id，password和grade
         * 如果没有重复id，则注册成功
         * 返回true时表示注册成功，false表示用户名已存在
         */
        boolean existance = false;
        if (!getConnect())return false;
        String sql = "select * from userinfo where username='" + id + "'";
        try {

            rs.close();
            stm.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return existance;
    }
}
