package com.example.stonefengshuimanagement.service;

import com.example.stonefengshuimanagement.model.entity.Stone;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class StoneService {
    private final List<Stone> stoneList = new ArrayList<>();

    public List<Stone> getAllStones() {
        return stoneList;
    }

    public void addStone(Stone stone) {
        stoneList.add(stone);
    }

    public void editStoneById(int id , Stone stone) {
        for(Stone s : stoneList){
            if(s.getId() == id){
                s.setName(stone.getName());
                s.setPrice(stone.getPrice());
                s.setImageUrl(stone.getImageUrl());
            }
        }
    }
    public void deleteStoneById(int id) {
        stoneList.removeIf(s -> s.getId() == id);
    }
}
