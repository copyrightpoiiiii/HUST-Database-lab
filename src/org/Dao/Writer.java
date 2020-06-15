package org.Dao;

import java.sql.*;

public class Writer {
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
                existance = 1;
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

    public int book (int id,String name) {
        /*
         * 传入用户的id，password和grade
         * 如果没有重复id，则注册成功
         * 返回true时表示注册成功，false表示用户名已存在
         */
        int existance = 0;
        if (!getConnect())return -2;
        try {
            CallableStatement cstmt = connect.prepareCall("{call bookCar(?,?,?)}");
            cstmt.setInt(1,id);
            cstmt.setString(2,name);
            cstmt.registerOutParameter(3,Types.INTEGER);
            cstmt.executeQuery();
            //ResultSetMetaData rsmd = rs.getMetaData();
            //int numColumns=rsmd.getColumnCount();
            existance=cstmt.getInt(3);
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
            existance = -3;
        }
        return existance;
    }

    public int addfund (String username) {
        /*
         * 传入用户的id，password和grade
         * 如果没有重复id，则注册成功
         * 返回true时表示注册成功，false表示用户名已存在
         */
        int existance = 0;
        if (!getConnect())return -2;
        try {
            CallableStatement cstmt = connect.prepareCall("{call changeBalance(?,?)}");
            cstmt.setString(1,username);
            cstmt.setInt(2,100);
            cstmt.executeQuery();
            existance=1;
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
            existance = -3;
        }
        return existance;
    }

    public int changeState (Integer id,Integer sta,Integer userid) {
        /*
         * 传入用户的id，password和grade
         * 如果没有重复id，则注册成功
         * 返回true时表示注册成功，false表示用户名已存在
         */
        int existance = 0;
        if (!getConnect())return -2;
        try {
            CallableStatement cstmt = connect.prepareCall("{call submitApply(?,?,?)}");
            cstmt.setInt(1,id);
            cstmt.setInt(2,sta);
            cstmt.setInt(3,userid);
            cstmt.executeQuery();
            existance=1;
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
            existance = -3;
        }
        return existance;
    }

    public int changeCarState (Integer id,Integer sta) {
        /*
         * 传入用户的id，password和grade
         * 如果没有重复id，则注册成功
         * 返回true时表示注册成功，false表示用户名已存在
         */
        int existance = 0;
        if (!getConnect())return -2;
        try {
            CallableStatement cstmt = connect.prepareCall("{call changeCarState(?,?)}");
            cstmt.setInt(1,id);
            cstmt.setInt(2,sta);
            cstmt.executeQuery();
            existance=1;
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
            existance = -3;
        }
        return existance;
    }

    public int crashWrite (Integer id,Integer Ctype,Integer money) {
        /*
         * 传入用户的id，password和grade
         * 如果没有重复id，则注册成功
         * 返回true时表示注册成功，false表示用户名已存在
         */
        int existance = 0;
        if (!getConnect())return -2;
        try {
            CallableStatement cstmt = connect.prepareCall("{call crashServe(?,?,?)}");
            cstmt.setInt(1,id);
            cstmt.setInt(2,Ctype);
            cstmt.setInt(3,money);
            cstmt.executeQuery();
            existance=1;
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
            existance = -3;
        }
        return existance;
    }

    public int keepWrite (Integer id,Integer money) {
        /*
         * 传入用户的id，password和grade
         * 如果没有重复id，则注册成功
         * 返回true时表示注册成功，false表示用户名已存在
         */
        int existance = 0;
        if (!getConnect())return -2;
        try {
            CallableStatement cstmt = connect.prepareCall("{call insertKeep(?,?)}");
            cstmt.setInt(1,id);
            cstmt.setInt(2,money);
            cstmt.executeQuery();
            existance=1;
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
            existance = -3;
        }
        return existance;
    }
}

