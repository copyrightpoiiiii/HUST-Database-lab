package org.Dao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        if (!getConnect()) return -2;
        try {
            CallableStatement cstmt = connect.prepareCall("{call logIn(?,?)}");
            cstmt.setString(1, id);
            cstmt.setString(2, password);
            ResultSet rs = cstmt.executeQuery();
            //ResultSetMetaData rsmd = rs.getMetaData();
            //int numColumns=rsmd.getColumnCount();
            if (rs.next()) {
                userType = rs.getInt(1);
            }
            rs.close();
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
            userType = -3;
        }
        return userType;
    }

    public ArrayList<JSONObject>  queryCar(int takeNum,int carType,int priceBegin,int priceEnd,String cityName){
        if (!getConnect())return new ArrayList<JSONObject>();
        ArrayList<JSONObject> array = new ArrayList<JSONObject>();
        try {
            CallableStatement cstmt = connect.prepareCall("{call queryCar(?,?,?,?,?)}");
            cstmt.setInt(1,takeNum);
            cstmt.setInt(2,carType);
            cstmt.setInt(3,priceBegin);
            cstmt.setInt(4,priceEnd);
            cstmt.setString(5,cityName);
            ResultSet rs = cstmt.executeQuery();
            while(rs.next()){
                JSONObject bean = new JSONObject();
                bean.put("takeNum",rs.getInt("takeNum"));
                bean.put("carType",rs.getInt("type"));
                bean.put("price",rs.getInt("price"));
                bean.put("useDis",rs.getInt("useDis"));
                bean.put("useTime",rs.getInt("useTime"));
                bean.put("id",rs.getInt("id"));
                bean.put("city",rs.getString("city"));
                array.add(bean);
            }
            rs.close();
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return array;
    }

    public ArrayList<Integer>  queryInfo(String username){
        if (!getConnect())return new ArrayList<Integer>();
        ArrayList<Integer> array = new ArrayList<Integer>();
        try {
            CallableStatement cstmt = connect.prepareCall("{call queryUserInfo(?)}");
            cstmt.setString(1,username);
            ResultSet rs = cstmt.executeQuery();
            while(rs.next()){
                array.add(rs.getInt("credit"));
                array.add(rs.getInt("balance"));
                array.add(rs.getInt("vipLevel"));
            }
            rs.close();
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return array;
    }

    public ArrayList<String>  queryUserApply(String username){
        if (!getConnect())return new ArrayList<String>();
        ArrayList<String> array = new ArrayList<String>();
        try {
            CallableStatement cstmt = connect.prepareCall("{call queryUserApply(?)}");
            cstmt.setString(1,username);
            ResultSet rs = cstmt.executeQuery();
            while(rs.next()){
                array.add(rs.getInt("id")+"");
                array.add(rs.getInt("carID")+"");
                array.add(rs.getDate("brrowTime").toString());
                Date dat = rs.getDate("receTime");
                if(dat != null)
                    array.add(rs.getDate("receTime").toString());
                else array.add("尚未归还");
                Integer sta = rs.getInt("state");
                if(sta == 1)
                    array.add("待审核");
                else if (sta == 2)
                    array.add("申请被拒绝");
                else if (sta == 3)
                    array.add("申请已通过");
                else if (sta == 4)
                    array.add("事故处理");
                else if (sta == 5)
                    array.add("事务结束");
            }
            rs.close();
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return array;
    }

    public ArrayList<JSONObject>  queryApply(){
        if (!getConnect())return new ArrayList<JSONObject>();
        ArrayList<JSONObject> array = new ArrayList<JSONObject>();
        try {
            CallableStatement cstmt = connect.prepareCall("{call queryApply()}");
            ResultSet rs = cstmt.executeQuery();
            while(rs.next()){
                JSONObject bean = new JSONObject();
                bean.put("id",rs.getInt("applyRecord.id"));
                bean.put("username",rs.getString("username"));
                bean.put("credit",rs.getInt("credit"));
                bean.put("phone",rs.getString("phone"));
                bean.put("ssCity",rs.getString("ssCity"));
                Integer sta = rs.getInt("state");
                if(sta == 1)
                    bean.put("state","待审核");
                else if (sta == 3)
                    bean.put("state","待归还");
                else if (sta == 4)
                    bean.put("state","事故处理");
                array.add(bean);
            }
            rs.close();
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return array;
    }

    public ArrayList<JSONObject>  queryCarInfo(){
        if (!getConnect())return new ArrayList<JSONObject>();
        ArrayList<JSONObject> array = new ArrayList<JSONObject>();
        try {
            CallableStatement cstmt = connect.prepareCall("{call queryCarState()}");
            ResultSet rs = cstmt.executeQuery();
            while(rs.next()){
                JSONObject bean = new JSONObject();
                bean.put("id",rs.getInt("id"));
                bean.put("state",rs.getInt("useState"));
                bean.put("useTime",rs.getInt("useTime"));
                bean.put("useDis",rs.getInt("useDis"));
                bean.put("upkeepDate",rs.getDate("upkeepDate"));
                bean.put("City",rs.getString("City"));
                array.add(bean);
            }
            rs.close();
            cstmt.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return array;
    }


}
