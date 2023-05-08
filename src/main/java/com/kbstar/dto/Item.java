package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Item {
    private int id; //자동으로 들어가므로 사용자 입력 불필요
    private String name;
    private int price;
    private String imgname;
    private Date rdate; // 자동으로 들어가므로 사용자 입력 불필요

    public Item(int id, String name, int price, String imgname, Date rdate) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgname = imgname;
        this.rdate = rdate;
    } // img는 가끔씩 올릴 거라서

    private MultipartFile img;
}
