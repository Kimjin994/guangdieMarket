package com.demo.dao;

/**
 * @ClassName ClassDAo
 * @Author 12575
 * @Date 2021/1/4 13:32
 * @Version 1.0
 **/
import com.demo.bean.MovieClass;
import com.demo.dao.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.demo.utils.JdbcUtils;

import javax.sound.sampled.Line;

public class MovieClassDAo {
    public ArrayList<MovieClass> getMovieClssInfos(){
        // User u= null;
        MovieClass movieClass = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<MovieClass> movieClasses = new ArrayList<>();
        //ArrayList result = new ArrayList();
        // ArrayList<Info> info = new ArrayList<>();
        try{
            connection = JdbcUtils.getconn();

            String sql = "select classid,classname from mytbl_movieclass;";
            preparedStatement = (PreparedStatement)connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                movieClass = new MovieClass();
                movieClass.setClassid(resultSet.getInt(1));
                movieClass.setClassname(resultSet.getString("classname"));
                movieClasses.add(movieClass);
                // System.out.println("读取成功");
            }
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("sql语句有误，数据库报错");
            return null;
        }
        return movieClasses;
    }

}
