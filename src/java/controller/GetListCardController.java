/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;

/**
 *
 * @author HuyenPT
 */
public class GetListCardController extends HttpServlet {

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
        //get list cart from session
        List<Cart> listCart = (List<Cart>) request.getSession().getAttribute("listCart");
        
        //total price of all product in list cart
        double totalPrice = 0;
        
        /*
        when user has not selected any product yet 
        -> listCart has not initialization in arrayList's type yet
        -> initialize new one
        */
        if (listCart == null) {
            listCart = new ArrayList<>();
        } else {
            //total price of cart
            for (Cart c : listCart) {
                totalPrice += c.getProductPrice() * c.getQuantity();
                System.out.println("price: " + c.getProductPrice() + " / quantity: " + c.getQuantity());
            }
        }
        
        System.out.println("size list:" + listCart.size());
        
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("listCart", listCart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);

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
