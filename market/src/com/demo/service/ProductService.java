package com.demo.service;

import com.demo.bean.GameClass;
import com.demo.bean.Movie;
import com.demo.bean.MovieClass;
import com.demo.dao.GameClassDAo;
import com.demo.dao.MovieClassDAo;
import com.demo.dao.MovieDAo;

import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName ProductService
 * @Author 12575
 * @Date 2021/1/6 9:12
 * @Version 1.0
 **/

public class ProductService {

    public List<MovieClass> findAllMovieCategory() {
        MovieClassDAo dao = new MovieClassDAo();
        List<MovieClass> categoryList = null;
        categoryList = dao.getMovieClssInfos();
        return categoryList;

    }

    public  List<GameClass> findAllGameCategory(){
        GameClassDAo daoGame= new GameClassDAo();
        List<GameClass> gameClassList = null;
        gameClassList = daoGame.getGame();
        return gameClassList;
    }
    public List<Movie> FindAllMovie(){
        MovieDAo movieDAo = new MovieDAo();
        List<Movie> movies = null;
        movies = movieDAo.getMovie();
        return movies;
    }
}