/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
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
public class HomeController extends HttpServlet {

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

        int pageIndex = 1;
        int pageSize = 6;

        String rawPageIndex = request.getParameter("pageIndex");
        
        //'pageIndex' is null means: user does not click to another page -> auto go to first page
        if (rawPageIndex != null) {
            pageIndex = Integer.parseInt(rawPageIndex);
        }

        ProductDAO productDAO = new ProductDAO();

        //total page/ each page has pageSize items
        int totalPage = productDAO.countPage(pageSize);

        //get list of products available for page at pageIndex
        List<Product> listP = productDAO.getAllProductPagging(pageIndex, pageSize);
        request.setAttribute("listP", listP);

        //load list of categories to 'Categorie' menu
        List<Categorie> listC = new CategoryDAO().getAll();
        request.setAttribute("listC", listC);

        //get lastest product in list to display as new product
        Product last = productDAO.getLastProduct();
        request.setAttribute("last", last);

        
        ////send pageIndex to active page that user are in
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalPage", totalPage);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
//        int id = Integer.parseInt(request.getParameter("id"));
//        List<Products> listP = new ProductDAO().getProductByCid(id);
//        request.setAttribute("listP", listP);
//        request.setAttribute("id", id);
//        request.getRequestDispatcher("home.jsp").forward(request, response);
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
