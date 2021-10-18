package com.demo.dao;

import com.demo.bean.*;
import com.demo.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @ClassName GameDAo
 * @Author 12575
 * @Date 2021/1/4 16:06
 * @Version 1.0
 **/
public class GameClassDAo {
    public ArrayList<GameClass> getGame(){
        GameClass gameClass =null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<GameClass> gameClasses = new ArrayList<>();
        try{
            connection = JdbcUtils.getconn();
            String sql="select classid,classname from mytbl_gameclass ";
            preparedStatement=(PreparedStatement)connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                gameClass = new GameClass();
                gameClass.setGameClassId(resultSet.getInt(1));
                gameClass.setGameClassName(resultSet.getString(2));
                gameClasses.add(gameClass);
            }
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("sql语句有误，数据库报错");
            return null;
        }
        return gameClasses;
    }

}
