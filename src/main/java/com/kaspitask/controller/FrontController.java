package com.kaspitask.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class FrontController {

    @RequestMapping(method = RequestMethod.GET)
    public String mainMenu(ModelMap model) {
        model.addAttribute("Attr", "List of questions should be here");
        return "index";
    }
}
