/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author HuyenPT
 */
public class AddController extends HttpServlet {

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

        //get information of product
//        String name = request.getParameter("name");
//        System.out.println("Quantity: " + request.getParameter("name"));
//        System.out.println("Quantity: " + request.getParameter("quantity"));
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
//        double price = Double.parseDouble(request.getParameter("price"));
//        String image = request.getParameter("image");
//        String description = request.getParameter("description");
//        int categoryid = Integer.parseInt(request.getParameter("category"));
        String fileName = "";
        
        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Configure a repository (to ensure a secure temp location is used)
        ServletContext servletContext = this.getServletConfig().getServletContext();
        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        factory.setRepository(repository);

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        HashMap<String, String> fields = new HashMap<>();
        try {
            // Parse the request
            List<FileItem> items = upload.parseRequest(request);
            // Process the uploaded items
            Iterator<FileItem> iter = items.iterator();
            
            while (iter.hasNext()) {
                FileItem item = iter.next();
                
                if (item.isFormField()) {
                    fields.put(item.getFieldName(), item.getString());
                    String namefile = item.getFieldName();
                    String value = item.getString();
                    
                } else {
                   
                   fileName = item.getName();
                   if (fileName == null || fileName.equals("")) {
                       break;
                   }
                   else {
                       Path path = Paths.get(fileName);
                       String storePath = servletContext.getRealPath("/images");
                       File uploadFile = new File(storePath + "/" + path.getFileName());
                       item.write(uploadFile);
                       System.out.println("Store path: " + storePath);
                   }
                }
            }
        } catch (FileUploadException ex) {
            Logger.getLogger(AddController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(AddController.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("File: " + fileName);
        System.out.println("HashMap: " + fields);
        String name = fields.get("name");
        int quantity = Integer.parseInt(fields.get("quantity"));
        System.out.println("Quantity: " + quantity);
        double price = Double.parseDouble(fields.get("price"));
//        String image = request.getParameter("image");
        String description = fields.get("description");
        System.out.println("Description: " + description);
        int categoryid = Integer.parseInt(fields.get("cat"));
        int isAdd = new ProductDAO().addProduct(new Product(0, name, quantity, price, fileName, description, categoryid));
//        request.setAttribute("message", "Added sucessfully!");
//        request.getRequestDispatcher("manager").forward(request, response);
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
