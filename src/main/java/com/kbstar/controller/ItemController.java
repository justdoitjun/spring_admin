package com.kbstar.controller;

import com.kbstar.Util.FileUploadUtil;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.dto.ItemSearch;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {
    @Autowired
    ItemService itemService;
    String dir = "item/";
    @Value("${uploadimgdir}")
    String imgdir;
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception{
        List<Item> list = null;
        try{
            list = itemService.get();
        }catch(Exception e){
            throw new Exception ("System Error");
        }
        model.addAttribute("ilist", list);
        model.addAttribute("center",dir+"all");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, Item item){
        MultipartFile mf = item.getImg();
        String imgname = mf.getOriginalFilename();
        item.setImgname(imgname);
        try {
            itemService.register(item);
            itemService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        FileUploadUtil.saveFile(mf,imgdir); //mf에 받은 file이 업로드되어 imgdir 디렉토리로 들어간다.
        //model.addAttribute("center", dir+"add");
                return "redirect:/item/all";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Item item) throws Exception{
        MultipartFile mf = item.getImg();
        String new_imgname = mf.getOriginalFilename();
        log.info("=================================");
        log.info(new_imgname);
        log.info("===============================");

        if(new_imgname.equals("") || new_imgname == null){
            itemService.modify(item);
        }else {
            item.setImgname(new_imgname);
            itemService.modify(item);
        }
        //위처럼 짤 수도 있지만 아래처럼 간단하게 짤 수도 있지
//        if(!new_imgname.equals("") || new_imgname !=null){
//            item.setImgname(new_imgname);
//            FileUploadUtil.saveFile(mf,imgdir);
//        }
        itemService.modify(item);
        return "redirect:/item/detail?id="+item.getId();
    }



    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, int id) throws Exception{
        itemService.remove(id);
        return "redirect:/item/all";
    }

    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
        Item item = null;
        item = itemService.get(id);
        model.addAttribute("gitem", item);
        model.addAttribute("center", dir+"detail");
        return "index";
    }

    @RequestMapping("/search")
    public String search(Model model, ItemSearch ms) throws Exception {//        log.info("-----------------------------");
//          log.info(ms.getName());
//          log.info(ms.getStartdate());
//          log.info(ms.getEnddate());
//          log.info(String.valueOf(ms.getPrice()));
//          log.info("-----------------------------");

        List<Item> list = null;
        list = itemService.search(ms);
        model.addAttribute("ms", ms);
        model.addAttribute("ilist", list);
        model.addAttribute("center", dir+"all");


        return "index";
    }



}