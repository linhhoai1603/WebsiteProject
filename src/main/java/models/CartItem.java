
package models;

import java.util.Map;

public class CartItem {
    private Style style;
    private double price;
    private int quantity;
    private double totalPrice;
    private double area;
    public CartItem(Style product, int quantity) {
        this.style = product;
        this.price = product.getProduct().getPrice().getLastPrice();
        this.quantity = quantity;
        this.totalPrice = quantity * price;
    }
    public Style getStyle() {
        return style;
    }
    public void setStyle(Style product) {
        this.style = product;
    }
    public int getQuantity() {
        return quantity;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    // method update số lượng sản phẩm
    public void setQuantity(int quantity) {
        this.quantity = quantity;
        this.totalPrice = quantity * style.getProduct().getPrice().getLastPrice();
    }
    public double getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    public String toString(){
        return this.style.toString() + " " + this.quantity + " " + this.totalPrice ;
    }

}
