package com.demo.servlet;
import com.demo.bean.GameClass;
import com.demo.bean.MovieClass;
import com.demo.service.ProductService;
import com.google.gson.Gson;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 * @ClassName CategoryListServlet
 * @Author 12575
 * @Date 2021/1/6 9:08
 * @Version 1.0
 **/
public class CategoryMovieListServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        ProductService service = new ProductService();
       // ArrayList<MovieClass> movieClasses = new MovieClassDAo().getMovieClssInfos();
        List<MovieClass> categoryList = service.findAllMovieCategory();
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        String categoryListJson = gson.toJson(categoryList);
        out.print(categoryListJson);
        out.flush();
        out.close();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
