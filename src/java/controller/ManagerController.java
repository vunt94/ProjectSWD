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
import javax.servlet.http.HttpSession;
import model.Account;
import model.Categorie;
import model.Product;

/**
 *
 * @author HuyenPT
 */
public class ManagerController extends HttpServlet {

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

        //get account from session
        Account a = (Account) request.getSession().getAttribute("user");
        if (a == null) {//user has not logined yet
            response.sendRedirect("login");
        } else if (a.getIsAdmin() == 0) {//user has logged but are not admin
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title></title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>You are not allow to access!!!</h1>");
            out.println("<a href=\"home\">Back to home</a></br>");
            out.println("<a href=\"login\">Or Login with another account</a>");
            out.println("</body>");
            out.println("</html>");
        } else {

            int pageIndex = 1;
            int pageSize = 5;

            String rawPageIndex = request.getParameter("pageIndex");

            //'pageIndex' is null means: user does not click to another page -> automatically go to first page
            if (rawPageIndex != null) {
                pageIndex = Integer.parseInt(rawPageIndex);
            }

            ProductDAO productDAO = new ProductDAO();

            //total page >> each page has pageSize items
            int totalPage = productDAO.countPage(pageSize);

            //total products in database
            int totalPorduct = productDAO.countTotalProduct();

            //get list of products in pageIndex
            List<Product> list = productDAO.getAllProductPagging(pageIndex, pageSize);
            
            /*
            in case admin delete last product in that page >> get list of product in that page return with size = 0
            -> get list of product in previous page
            */
            if(list.size() == 0){
                pageIndex--;
                list = productDAO.getAllProductPagging(pageIndex, pageSize);
            }
            
            //get list category to display in 
            List<Categorie> listC = new CategoryDAO().getAll();

           
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("totalPorduct", totalPorduct);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("listC", listC);
            request.setAttribute("list", list);
            request.getRequestDispatcher("manager.jsp").forward(request, response);
        }

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
        response.getWriter().println("go to post method in manager");
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
