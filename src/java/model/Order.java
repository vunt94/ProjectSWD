/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author HuyenPT
 */
public class Order {
    private int id;
    private int cusID;
    private String orderDate;
    private double totalPrice;
    private String note;

    public Order() {
    }

    public Order(int id, int cusID, String orderDate, double totalPrice, String note) {
        this.id = id;
        this.cusID = cusID;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCusID() {
        return cusID;
    }

    public void setCusID(int cusID) {
        this.cusID = cusID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", cusID=" + cusID + ", orderDate=" + orderDate + ", totalPrice=" + totalPrice + ", note=" + note + '}';
    }
    
    
    
}
