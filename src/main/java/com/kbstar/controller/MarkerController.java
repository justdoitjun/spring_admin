package com.kbstar.controller;

import com.kbstar.dto.Marker;
import com.kbstar.dto.MarkerSearch;
import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/marker")
public class MarkerController {
    @Autowired
    MarkerService markerService;
    String dir = "marker/";
    @Value("${uploadimgdir}")
    String imgdir;
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception{
        List<Marker> list = null;
        try{
            list = markerService.get();
        }catch(Exception e){
            throw new Exception ("System Error");
        }
        model.addAttribute("mlist", list);
        model.addAttribute("center",dir+"all");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, Marker marker) throws Exception{
        log.info(marker.getTitle());
        log.info(String.valueOf(marker.getLat()));
        log.info(String.valueOf(marker.getLng()));
        log.info(marker.getLoc());
        markerService.register(marker);
        model.addAttribute("mtitle", marker.getTitle());
        model.addAttribute("mlat", marker.getLat());
        model.addAttribute("mlng", marker.getLng());
        model.addAttribute("mloc", marker.getLoc());
        model.addAttribute("center",  dir+"test");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception{
        Marker marker = null;
        marker = markerService.get(id);
        model.addAttribute("marker", marker);
        model.addAttribute("center",  dir+"detail");
        return "index";
    }

    @RequestMapping("/search")
    public String search(Model model, MarkerSearch ms) throws Exception{
        List<Marker> list = markerService.search(ms);
        model.addAttribute("ms", ms);
        model.addAttribute("mlist", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }


}