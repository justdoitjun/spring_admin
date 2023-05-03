package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/cust")
public class CustController {
    @Autowired
    BCryptPasswordEncoder encoder;
    @Autowired
    CustService custService;
    String dir = "cust/";

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Cust cust,
                          Errors errors, HttpSession session)
    throws Exception{
        if (errors.hasErrors()) {
            List<ObjectError> es = errors.getAllErrors();
            String msg ="";
            for(ObjectError e : es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        cust.setPwd(encoder.encode(cust.getPwd()));
        //custService.register(cust);
        session.setMaxInactiveInterval(100000);
        session.setAttribute("loginadm", cust);
        return "redirect:/cust/detail?id=" + cust.getId();
    }

    @RequestMapping("/detail")
    public String detail(Model model, Cust cust) throws Exception {
        log.info("============================================");
        log.info(cust.getId());
        cust = custService.get(cust.getId());
        model.addAttribute("custinfo", cust);
        model.addAttribute("center",dir+"detail");
        return "index";
    }


    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Cust cust,
                          Errors errors, HttpSession session)
            throws Exception{
        if (errors.hasErrors()) {
            List<ObjectError> es = errors.getAllErrors();
            String msg ="";
            for(ObjectError e : es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        cust.setPwd(encoder.encode(cust.getPwd()));
        custService.modify(cust);
        return "redirect:/cust/detail?id=" + cust.getId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, @Validated Cust cust,
                             Errors errors, HttpSession session)
            throws Exception{
        if (errors.hasErrors()) {
            List<ObjectError> es = errors.getAllErrors();
            String msg ="";
            for(ObjectError e : es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        cust.setPwd(encoder.encode(cust.getPwd()));
        custService.remove(cust.getId());
        return "redirect:/cust/detail?id=" + cust.getId();
    }


    @RequestMapping("/all")
    public String all(Model model) throws Exception{
        List<Cust> list = null;
        try{
            list = custService.get();
        }catch(Exception e){
            throw new Exception ("System Error");
        }
        model.addAttribute("clist", list);
        model.addAttribute("center",dir+"all");
        return "index";
    }

}