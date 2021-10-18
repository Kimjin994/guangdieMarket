package com.demo.servlet;

import com.demo.bean.Movie;
import com.demo.service.ProductService;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @ClassName MovieListServlet
 * @Author 12575
 * @Date 2021/1/13 16:34
 * @Version 1.0
 **/
public class MovieListServlet extends HttpServlet {
 public void doGet(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException{
     response.setContentType("text/html;charset=UTF-8");
     ProductService service = new ProductService();
     List<Movie> movieList = service.FindAllMovie();
     PrintWriter out = response.getWriter();
     Gson gson = new Gson();
     String movieListJson = gson.toJson(movieList);
     out.print(movieListJson);
     out.flush();
     out.close();
 }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
