package com.demo.dao;

import com.demo.bean.Movie;
import com.demo.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @ClassName MovieDAo
 * @Author 12575
 * @Date 2021/1/4 14:49
 * @Version 1.0
 **/
public class MovieDAo {
    public ArrayList<Movie> getMovie(){
        Movie movie =null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<Movie> movies = new ArrayList<>();
        try{
            connection = JdbcUtils.getconn();
            String sql="select movieid,heading,hiabao,classid from mytbl_movie";
            preparedStatement=(PreparedStatement)connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                movie = new Movie();
                movie.setMovieId(resultSet.getInt(1));
                movie.setHeading(resultSet.getString(2));
                movie.setHaibao(resultSet.getString(3));
                movie.setClassid(resultSet.getInt(4));
                movies.add(movie);
            }
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("sql语句有误，数据库报错");
            return null;
        }
        return movies;
    }

    public Movie finMovieById(int id){
        Movie movie =null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try{
            connection = JdbcUtils.getconn();
            String sql="select heading,hiabao,classid,title,content,country,director from mytbl_movie where movieid=?";

            preparedStatement=(PreparedStatement)connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            resultSet = preparedStatement.executeQuery();

if(resultSet.next()){
    movie = new Movie();
    movie.setHeading(resultSet.getString(1));
    movie.setHaibao(resultSet.getString(2));
    movie.setClassid(resultSet.getInt(3));
    movie.setTitle(resultSet.getString(4));
    movie.setContent(resultSet.getString(5));
    movie.setCountry(resultSet.getString(6));
    movie.setDirector(resultSet.getString(7));
}


        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("sql语句有误，数据库报错");
            return null;
        }
        return movie;
    }
}