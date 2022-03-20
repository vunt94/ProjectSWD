/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Categorie;
import model.Product;

/**
 *
 * @author HuyenPT
 */
public class SearchController extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//set tiếng việt cho request -> search tiếng việt
        //get keyword from search box
        String keyword = request.getParameter("keyword");

        int pageIndex = 1;
        int pageSize = 6;

        String rawPageIndex = request.getParameter("pageIndex");
        if (rawPageIndex != null) {
            pageIndex = Integer.parseInt(rawPageIndex);
        }

        //total page/ each page has pageSize items
        int totalPage = new ProductDAO().countPageForSearch(pageSize, keyword);

        //call getAllPagging to get listProduct in this page
        List<Product> listP = new ProductDAO().getProductByName(keyword, pageIndex, pageSize);

        //call getAll in categoryDAO to get all category item
        List<Categorie> listC = new CategoryDAO().getAll();

        //call getLastProduct to get lastest product in list to display as new product
        Product last = new ProductDAO().getLastProduct();

        //set attribute and forward to home.jsp
        request.setAttribute("keyword", keyword);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("last", last);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
