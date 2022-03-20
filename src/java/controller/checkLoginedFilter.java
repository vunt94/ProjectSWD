/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author HuyenPT
 */
@WebFilter(filterName = "checkLoginedFilter", urlPatterns = {"/addToCart","/cart"})
public class checkLoginedFilter implements Filter {
    
   

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest reg = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        //check login
        HttpSession session = reg.getSession();
        Account account = (Account) session.getAttribute("user");
        if(account!= null){//logined
            chain.doFilter(request, response);//pass filter
        }else{//not login
            //check cookie
            String phone =null;
            String password =null;
            
            Cookie [] cookies = reg.getCookies();
            for (Cookie c : cookies) {
                if(c.getName().equals("phone")){
                    phone = c.getValue();
                }
                if(c.getName().equals("password")){
                    password = c.getValue();
                }
                if(phone != null && password != null){
                    break;
                }
            }
            if(phone != null && password != null){
                //check in database
                Account acc = new dao.AccountDAO().getAccount(phone, password);
                if(acc!= null){//account in cookie is satisfy
                //phone and password of account in cookie are correct(in case user change password)
                    session.setAttribute("user", acc);
                    chain.doFilter(request, response);//pass filter
                }else{
                    res.sendRedirect("login");
                }
            }else {//login again
                res.sendRedirect("login");
            }
            
        }
    }

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {        
    }

    /**
     * Init method for this filter
     * @param filterConfig
     */
    public void init(FilterConfig filterConfig) {        
        
    }

   
    
}
