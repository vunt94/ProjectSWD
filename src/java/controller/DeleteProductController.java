/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HuyenPT
 */
public class DeleteProductController extends HttpServlet {

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

        //get id of product that user has selected to delete
        int id = Integer.parseInt(request.getParameter("pid"));

        //get page index that user has selected product in this page
        int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));

        int isDelete = new ProductDAO().deleteProductByID(id);

        /*
            1, send pageIndex with purpose when user selected a product in any page >> stay in that page
            2, if do not send pageIndex >>(homeController) pageIndex == null -> automatically go to first page
         */
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("message", "Deleted sucessfully!");
        request.getRequestDispatcher("manager").forward(request, response);
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
        //get request delete all product in manager page
        String deleteAll = request.getParameter("deleteAll");
        if (deleteAll != null) {
            new ProductDAO().deleteAllProduct();
        }
        response.sendRedirect("manager");
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
