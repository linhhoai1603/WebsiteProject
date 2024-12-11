package models;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class Order {
   private int id;
   private User user;
   private LocalTime timeOrdered;
   private Voucher voucher;
   private int status;
   private double totalPrice;
   private List<DetailOrder> listOfDetailOrder = new ArrayList<DetailOrder>();
    public Order() {

    }
    public Order(int id, User user, LocalTime timeOrdered, List<DetailOrder> listOfDetailOrder, int status ) {
        this.id = id;
        this.user = user;
        this.timeOrdered = timeOrdered;
        this.status = status;
        this.listOfDetailOrder = listOfDetailOrder;
        this.totalPrice = calculTotalPrice();
    }

    private double calculTotalPrice() {
        return 0.0;
    }

    public double calculateLastPrice() {
        return 0.0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalTime getTimeOrdered() {
        return timeOrdered;
    }

    public void setTimeOrdered(LocalTime timeOrdered) {
        this.timeOrdered = timeOrdered;
    }

    public Voucher getVoucher() {
        return voucher;
    }

    public void setVoucher(Voucher voucher) {
        this.voucher = voucher;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<DetailOrder> getListOfDetailOrder() {
        return listOfDetailOrder;
    }

    public void setListOfDetailOrder(List<DetailOrder> listOfDetailOrder) {
        this.listOfDetailOrder = listOfDetailOrder;
    }

}