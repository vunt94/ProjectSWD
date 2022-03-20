/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.Product;

/**
 *
 * @author HuyenPT
 */
public class AddToCartController extends HttpServlet {

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

        //get page index that user has selected product in this page
        int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));

        //get id of product that user has selected
        int productID = Integer.parseInt(request.getParameter("pid"));

        //get information of product by id from database
        Product product = new ProductDAO().getProductByID(productID);

        //create new cart with this product
        Cart cart = new Cart(
                productID,
                product.getName(),
                product.getImage(),
                product.getPrice(),
                product.getQuantity(),
                1,//new -> quantity = 1
                product.getPrice());//one product -> total price = product's price

        //get list card form session to check
        List<Cart> listCart = (List<Cart>) request.getSession().getAttribute("listCart");
        
        if (listCart == null) {// list cart is empty/user does has cart->create new list cart
            listCart = new ArrayList<>();
            listCart.add(cart);
        } else {//user has a cart
            /*
            check:
            if: product is exit in cart -> add quantity 1
            else: add new cart to list Cart
             */
            boolean isExist = false;
            for (Cart c : listCart) {
                if (c.getProductID() == productID) {//aleady in card
                    c.setQuantity(c.getQuantity() + 1);//update quantity
                    isExist = true;//mark that product is in card
                }
            }
            if (isExist == false) {//this product is not in card
                listCart.add(cart);
            }
        }

        //update list cart to session
        request.getSession().setAttribute("listCart", listCart);

        /*
        1, send pageIndex with purpose when user selected a product in any page >> stay in that page
        2, if do not send pageIndex >>(homeController) pageIndex == null -> automatically go to first page
         */
        request.setAttribute("pageIndex", pageIndex);
        request.getRequestDispatcher("home").forward(request, response);
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
        //==> increase or decrease quantity in cart
        
        String calcu = request.getParameter("button");
        int pid = Integer.parseInt(request.getParameter("pid"));

        //get list card form session to check
        List<Cart> listCart = (List<Cart>) request.getSession().getAttribute("listCart");
        
        for (int i = 0; i < listCart.size(); i++) {
            if(listCart.get(i).getProductID() == pid){
                if(calcu.equals("plus")){
                    listCart.get(i).setQuantity(listCart.get(i).getQuantity()+1);
                }else{
                    listCart.get(i).setQuantity(listCart.get(i).getQuantity()-1);
                }
                //if quantity == 0 >> delete from listCart
                if(listCart.get(i).getQuantity()==0){
                    listCart.remove(i);
                }
            }
        }
        response.sendRedirect("cart");
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
