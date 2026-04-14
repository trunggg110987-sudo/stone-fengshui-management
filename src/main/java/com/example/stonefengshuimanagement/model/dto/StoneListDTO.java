package com.example.stonefengshuimanagement.model.dto;

public class StoneListDTO {
    private int id;
    private String name;
    private String code;
    private double price;
    private String imageUrl;
    private String categoryName;
    private int status;

    public StoneListDTO() {
    }

    public StoneListDTO(int id, String name, String code, double price,
                        String imageUrl, String categoryName, int status) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.price = price;
        this.imageUrl = imageUrl;
        this.categoryName = categoryName;
        this.status = status;
    }

    // Getter & Setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
