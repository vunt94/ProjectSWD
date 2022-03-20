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
public class UpdateController extends HttpServlet {

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
        //==> display product's information

        int id = Integer.parseInt(request.getParameter("pid"));
        Product p = new ProductDAO().getProductByID(id);
        List<Categorie> listC = new CategoryDAO().getAll();

        int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        request.setAttribute("pageIndex", pageIndex);

        request.setAttribute("listC", listC);
        request.setAttribute("p", p);
        request.getRequestDispatcher("update.jsp").forward(request, response);
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
        //==> update product

        //get new product's information from text fild
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        int cid = Integer.parseInt(request.getParameter("category"));

        int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        System.out.println("pageIndex: " + pageIndex);
        
        
        
        
        
        
        
        

        int isUpdate = new ProductDAO().updateProductByID(id, new Product(id, name, quantity, price, image, description, cid));

        /*
            1, send pageIndex with purpose when user selected a product in any page >> stay in that page
            2, if do not send pageIndex >>(homeController) pageIndex == null -> automatically go to first page
         */
//        request.setAttribute("pageIndex", pageIndex);
//        request.getRequestDispatcher("manager").include(request, response);
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
