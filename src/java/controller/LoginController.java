/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author HuyenPT
 */
public class LoginController extends HttpServlet {

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
        // ==>check account saved in cookie and auto login

        //get cookie
        Cookie[] cookie = request.getCookies();
        String phone = "";
        String password = "";

        /*
        1, cookie[] != null <=> logged before
        -> get 'phone' and 'password' from cookie
        -> check with database
        2, cookie == null <=> never logged before
        -> require to login
         */
        if (cookie != null) {
            for (Cookie c : cookie) {
                if (c.getName().equals("phone")) {
                    phone = c.getValue();
                }
                if (c.getName().equals("password")) {
                    password = c.getValue();
                }
                if (phone != null && password != null) {
                    break;
                }
            }
            if (phone != null && password != null) {//added to cookie
                Account acc = new dao.AccountDAO().getAccount(phone, password);
                if (acc != null) {//phone and password of account in cookie are correct(in case user change password)
                    //add to seesion
                    HttpSession session = request.getSession();
                    session.setAttribute("user", acc);
                    response.sendRedirect("home");
                } else {//incorrect phone or password -> login again
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {//login again
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
        //==>require to login

        //get phone and password from text fild in login form
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");

        Account acc = new dao.AccountDAO().getAccount(phone, pass);
        if (acc != null) {//login success
            String remember = request.getParameter("remember");
            if (remember != null) {//set cookie
                Cookie cPhone = new Cookie("phone", phone);
                Cookie cPass = new Cookie("password", pass);

                //set how long cookie will exist(second)
                cPhone.setMaxAge(60 * 100);
                cPass.setMaxAge(60 * 100);

                //Add to browser
                response.addCookie(cPhone);
                response.addCookie(cPass);
            }
            //create and set acc to session
            HttpSession session = request.getSession();
            session.setAttribute("user", acc);

            if (acc.getIsAdmin() != 1) {
                response.sendRedirect("home");
            }else{
                response.sendRedirect("manager");
            }
            
        } else {//login failed
            //send message to login form
            request.setAttribute("flag", 1);
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
