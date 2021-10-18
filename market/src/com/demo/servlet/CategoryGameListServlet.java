package com.demo.servlet;
import com.demo.bean.GameClass;
import com.demo.dao.GameClassDAo;
import com.demo.service.ProductService;
import com.google.gson.Gson;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;



/**
 * @ClassName CategoryGameListServlet
 * @Author 12575
 * @Date 2021/1/8 12:11
 * @Version 1.0
 **/

public class CategoryGameListServlet  extends HttpServlet  {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductService service = new ProductService();

        List<GameClass> categoryGameList = service.findAllGameCategory();
        PrintWriter out = response.getWriter();
        Gson gsonGame = new Gson();
        String categoryListJson = gsonGame.toJson(categoryGameList);
        out.print(categoryListJson);
        out.flush();
        out.close();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
