package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShoesDAO {

    // 建立資料庫連線
    public Connection connect() {
        Connection cn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/shoesstore?useUnicode=true&characterEncoding=utf8", "root", "1234");
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("connect() error:" + ex.getMessage());
        }
        return cn;
    }

    // 分頁的搜尋方法
    public List<Shoes> searchByNameWithPagination(String searchName, int page, int pageSize) {
        List<Shoes> data = new ArrayList<>();
        Connection cn = connect();
        if (cn == null) {
            System.out.println("Database connection failed.");
            return data;
        }

        int offset = (page - 1) * pageSize;
        String SQL = "SELECT * FROM shoesstore.product WHERE name LIKE ? LIMIT ? OFFSET ?";

        try {
            PreparedStatement ps = cn.prepareStatement(SQL);
            ps.setString(1, "%" + searchName + "%");
            ps.setInt(2, pageSize);
            ps.setInt(3, offset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String code = rs.getString("product_code");
                String name = rs.getString("name");
                Double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                Shoes ss = new Shoes(code, name, price, quantity);
                data.add(ss);
            }
            cn.close();
        } catch (SQLException e) {
            System.out.println("searchByNameWithPagination() error: " + e.getMessage());
        }
        return data;
    }

    // 分頁取得商品列表
    public List<Shoes> getPagedShoes(int page, int pageSize) {
        List<Shoes> data = new ArrayList<>();
        Connection cn = connect();
        if (cn == null) {
            System.out.println("Database connection failed.");
            return data;
        }

        int offset = (page - 1) * pageSize;
        String SQL = "SELECT * FROM shoesstore.product LIMIT ? OFFSET ?";

        try {
            PreparedStatement ps = cn.prepareStatement(SQL);
            ps.setInt(1, pageSize);
            ps.setInt(2, offset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String code = rs.getString("product_code");
                String name = rs.getString("name");
                Double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                Shoes ss = new Shoes(code, name, price, quantity);
                data.add(ss);
            }
            cn.close();
        } catch (SQLException e) {
            System.out.println("getPagedShoes() error: " + e.getMessage());
        }
        return data;
    }

    // 計算符合搜尋條件的商品總數
    public int countShoesBySearchName(String searchName) {
        int count = 0;
        Connection cn = connect();
        if (cn == null) {
            System.out.println("Database connection failed.");
            return count;
        }

        String SQL = "SELECT COUNT(*) FROM shoesstore.product WHERE name LIKE ?";
        try {
            PreparedStatement ps = cn.prepareStatement(SQL);
            ps.setString(1, "%" + searchName + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("countShoesBySearchName() error: " + e.getMessage());
        } finally {
            try {
                cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return count;
    }

    // 計算所有商品總數
    public int countShoes() {
        int count = 0;
        Connection cn = connect();
        if (cn == null) {
            System.out.println("Database connection failed.");
            return count;
        }

        String SQL = "SELECT COUNT(*) FROM shoesstore.product";
        try {
            PreparedStatement ps = cn.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("countShoes() error: " + e.getMessage());
        } finally {
            try {
                cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return count;
    }
}
