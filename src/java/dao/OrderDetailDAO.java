/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.OrderDetail;

/**
 *
 * @author HuyenPT
 */
public class OrderDetailDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public int add(List<Cart> listCart, int orderID) {
        try {
            String sql = "INSERT INTO [dbo].[Order_detail]\n"
                    + "           ([orderID]\n"
                    + "           ,[productID]\n"
                    + "           ,[productName]\n"
                    + "           ,[productPrice]\n"
                    + "           ,[productImage]\n"
                    + "           ,[quantity])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            int arr[] = {};
            for (Cart cart : listCart) {
                ps.setInt(1, orderID);
                ps.setInt(2, cart.getProductID());
                ps.setString(3, cart.getProductName());
                ps.setDouble(4, cart.getProductPrice());
                ps.setString(5, cart.getProductImage());
                ps.setInt(6, cart.getQuantity());
                
                ps.addBatch();
            }
            arr = ps.executeBatch();
            
            return arr.length;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

}
