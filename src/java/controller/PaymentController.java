/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.Order;

/**
 *
 * @author HuyenPT
 */
public class PaymentController extends HttpServlet {

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
        //==> upload bill's information

        //get listCart from session
        List<Cart> listCart = (List<Cart>) request.getSession().getAttribute("listCart");

        //get totalPrice from 'cart'
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));

        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("listCart", listCart);
        request.getRequestDispatcher("payment.jsp").forward(request, response);
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
        //==>payment

        //get user's information from text fild
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        String shippingFee = request.getParameter("payment");
//        String payment = request.getParameter("type");
//        String shipment = request.getParameter("shipment");
//        if (payment.equals("1")) {
//            request.setAttribute("credit", "checked");
//        }
//        else {
//            request.setAttribute("cod", "checked");
//        }
//        if (shipment.equals("1")) {
//            request.setAttribute("fast", "checked");
//        }
//        else {
//            request.setAttribute("standard", "checked");
//        }
        //get account from session
        Account account = (Account) request.getSession().getAttribute("user");
        String phoneNumber = account.getPhonenumber();
        String pass = account.getPassword();

        //get userID from database
        int cusID = new AccountDAO().selectAccountReturnID(phone, pass);
        System.out.println("cusID: " + cusID);

        if (cusID > 0) {
            List<Cart> listCart = (List<Cart>) request.getSession().getAttribute("listCart");

            //get totalPrice from 'cart'
            double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
            totalPrice += Double.parseDouble(shippingFee.substring(0, shippingFee.length() - 1));
            Order order = new Order();
            order.setCusID(cusID);
            order.setTotalPrice(totalPrice);
            order.setNote(note);

            //add order to order table
            int orderID = new OrderDAO().addOrderReturnID(order);

            if (orderID > 0) {
                //add listCart to OrderDetail
                int count = new OrderDetailDAO().add(listCart, orderID);
                if (count > 0) {//add successfully to database
                    //delete listCart in session
                    HttpSession session = request.getSession();
                    request.setAttribute("listCart", listCart);
                    request.setAttribute("name", name);
                    request.setAttribute("phone", phone);
                    request.setAttribute("address", address);
                    request.setAttribute("note", note);
                    request.setAttribute("price", Double.parseDouble(shippingFee.substring(0, shippingFee.length() - 1)));
                    request.setAttribute("total", totalPrice);
                    session.removeAttribute("listCart");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("paymentComplete.jsp");
                    dispatcher.forward(request, response);
                }
            }
            
        }
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
