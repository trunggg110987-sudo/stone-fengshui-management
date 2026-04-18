package com.example.stonefengshuimanagement.model.entity;

public class Stone {
    private int id;
    private int categoryId;
    private String name;
    private String code;
    private double price;
    private String imageUrl;
    private String description;
    private int status;

    public Stone() {
    }

    public Stone(int id, int categoryId, String name, String code, double price, String imageUrl, String description, int status) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.code = code;
        this.price = price;
        this.imageUrl = imageUrl;
        this.description = description;
        this.status = status;
    }

    // 🔹 Constructor không có id (dùng khi insert)
    public Stone(int categoryId, String name, String code,
                 double price, String imageUrl, String description, int status) {
        this.categoryId = categoryId;
        this.name = name;
        this.code = code;
        this.price = price;
        this.imageUrl = imageUrl;
        this.description = description;
        this.status = status;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}