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
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author HuyenPT
 */
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Categorie;

public class CategoryDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public List<Categorie> getAll() {
        try {
            String sql = "SELECT * FROM [Categories]";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            List<Categorie> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Categorie(rs.getInt(1), rs.getString(2)));
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public static void main(String[] args) {
        List<Categorie> list = new CategoryDAO().getAll();
        for (Categorie p : list) {
            System.out.println(p.toString());
        }
    }

}
