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
public class ProductDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public List<Product> getAll() {
        try {
            String sql = "SELECT * FROM Products";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            //ps.set();
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllProductPagging(int pageIndex, int pageSize) {
        try {
            String sql = "SELECT * FROM Products ORDER BY pid "
                    + "OFFSET (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public int countTotalProduct() {
        try {
            String sql = "SELECT COUNT(*) FROM Products";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public int countPage(int pageSize) {
        try {
            String sql = "SELECT COUNT(*) FROM Products";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            int count = 0;

            if (rs.next()) {
                count = rs.getInt(1);
            }
            int numOfPage = count / pageSize;
            if (count % pageSize != 0) {
                numOfPage++;
            }
            return numOfPage;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public int countPageForSearch(int pageSize, String keyword) {
        try {
            String sql = "SELECT COUNT(*) FROM Products WHERE [name] LIKE '%" + keyword + "%'";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt(1);
            }
            int numOfPage = count / pageSize;
            if (count % pageSize != 0) {
                numOfPage++;
            }
            return numOfPage;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public int countPageForCategoryFilter(int cid, int pageSize) {
        try {
            String sql = "SELECT COUNT(*) FROM Products WHERE cid = ? ";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            rs = ps.executeQuery();
            int count = 0;

            if (rs.next()) {
                count = rs.getInt(1);
            }
            int numOfPage = count / pageSize;
            if (count % pageSize != 0) {
                numOfPage++;
            }
            return numOfPage;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public List<Product> getProductByCid(int cid, int pageIndex, int pageSize) {
        try {
            String sql = "SELECT * FROM Products WHERE cid = ? ORDER BY pid "
                    + "OFFSET (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";;

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.setInt(2, pageIndex);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);
            ps.setInt(5, pageSize);
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public Product getLastProduct() {
        try {
            String sql = "SELECT TOP 1 * FROM Products ORDER BY pid DESC";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7));
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Product getProductByID(int id) {
        try {
            String sql = "SELECT * FROM Products WHERE pid = ?";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7));
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    //when user search in Search box
    public List<Product> getProductByName(String keyword, int pageIndex, int pageSize) {
        try {
            String sql = "SELECT * FROM Products WHERE name LIKE '%" + keyword + "%' ORDER BY pid OFFSET (?*?-?) ROWS FETCH NEXT ? ROWS ONLY ";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int deleteProductByID(int id) {
        try {
            String sql = "DELETE FROM Products WHERE pid = ?;";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }
    
     public int deleteAllProduct() {
        try {
            String sql = "DELETE FROM PRODUCTS";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public int addProduct(Product p) {
        try {
            String sql = "INSERT INTO [dbo].[Products]\n"
                    + "           ([name]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price]\n"
                    + "           ,[image]\n"
                    + "           ,[description]\n"
                    + "           ,[cid])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setInt(2, p.getQuantity());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getImage());
            ps.setString(5, p.getDescription());
            ps.setInt(6, p.getCid());
            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public int updateProductByID(int id, Product p) {
        try {
            String sql = "UPDATE [dbo].[Products]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[image] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[cid] = ?\n"
                    + " WHERE  pid = ?";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setInt(2, p.getQuantity());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getImage());
            ps.setString(5, p.getDescription());
            ps.setInt(6, p.getCid());
            ps.setInt(7, id);
            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public static void main(String[] args) {
//        List<Product> list = new ProductDAO().getProductByCid(1, 1, 3);
//        for (Product p : list) {
//            System.out.println(p.toString());
//        }

        System.out.println(new ProductDAO().getProductByID(1).getPrice());
    }

}
