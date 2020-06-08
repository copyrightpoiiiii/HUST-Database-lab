package org.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserLogin {
    String drv = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/children_study?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    String usr = "root";
    String pwd = "949462395";

    public boolean Login(String id, String password) {
        /*
         * 传入用户名以及密码
         * 传出是否匹配
         * true表示匹配成功
         */
        boolean existance = false;
        String sql = "select * from userinfo where username='" + id + "' and password='" + password + "';";
        try {
            Class.forName(drv);
            Connection connect = DriverManager.getConnection(url, usr, pwd);
            Statement stm = connect.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            if (rs.next()) {
                existance = true;
            }
            rs.close();
            stm.close();
            connect.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return existance;
    }
}