package com.example.stonefengshuimanagement.model.dto;

public class StoneDetailDTO {
    private int id;
    private int categoryId;
    private String categoryName;
    private String name;
    private String code;
    private double price;
    private String imageUrl;
    private String description;
    private int status;

    public StoneDetailDTO() {
    }

    public StoneDetailDTO(int id, int categoryId, String categoryName,
                          String name, String code, double price,
                          String imageUrl, String description, int status) {
        this.id = id;
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.name = name;
        this.code = code;
        this.price = price;
        this.imageUrl = imageUrl;
        this.description = description;
        this.status = status;
    }

    // Getter & Setter

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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
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