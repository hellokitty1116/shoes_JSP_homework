package model;

import java.util.Objects;

public class Shoes {
    private String code; // 對應 product_code
    private String name;
    private double price;
    private int quantity;

    public Shoes() {
        super();
    }

    public Shoes(String code, String name, double price, int quantity) {
        super();
        this.code = code;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, name, price, quantity);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Shoes other = (Shoes) obj;
        return Objects.equals(code, other.code) && Objects.equals(name, other.name)
                && Double.doubleToLongBits(price) == Double.doubleToLongBits(other.price) && quantity == other.quantity;
    }

    @Override
    public String toString() {
        return "Shoes [code=" + code + ", name=" + name + ", price=" + price + ", quantity=" + quantity + "]";
    }
}
