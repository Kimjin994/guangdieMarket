package com.demo.utils;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
/**
 * @ClassName jdbcUtils
 * @Author 12575
 * @Date 2021/1/4 13:29
 * @Version 1.0
 **/
public class JdbcUtils {
    //the info of database initial
    private static String url=null;
    private static String user=null;
    private static String password =null;
    private static String dv=null;

    static {
        Properties prop= new Properties();
        InputStream in =JdbcUtils.class.getResourceAsStream("/a.properties");

        try {
            prop.load(in);
            url = prop.getProperty("url");
            user=prop.getProperty("user");
            password=prop.getProperty("password");
            dv=prop.getProperty("driver");
            Class.forName(dv);//�����ܷ�õ�������ݣ�������������ClasaNotFound�ͻ��׳�һ���쳣
        } catch (IOException e){
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    public static Connection getconn() throws SQLException{
        Connection connection = DriverManager.getConnection(url,user,password);
        return connection;
    }
    public  static void close(Statement statement, Connection connection){
        if(statement != null){
            try{
                statement.close();
            } catch (SQLException e){
                e.printStackTrace();
            }
        }
        if(connection !=null){
            try{
                connection.close();
            } catch (SQLException e){
                e.printStackTrace();
            }
        }
    }


    public static void close(PreparedStatement prepareStatement, Connection connection,ResultSet result){
        if(prepareStatement !=null){
            try{
                prepareStatement.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        if(connection !=null){
            try{
                connection.close();
            } catch (SQLException e){
                e.printStackTrace();
            }
        }
        if(result !=null){
            try{
                result.close();
            } catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
}
