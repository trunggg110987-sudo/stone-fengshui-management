package com.example.stonefengshuimanagement.service;

public class CartItem {
    private int stoneId;
    private String name;
    private String image;
    private double price;
    private int quantity;

    public CartItem() {}

    public CartItem(int stoneId, String name, String image, double price, int quantity) {
        this.stoneId = stoneId;
        this.name = name;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
    }

    public int getStoneId() { return stoneId; }
    public void setStoneId(int stoneId) { this.stoneId = stoneId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getTotal() {
        return price * quantity;
    }
}