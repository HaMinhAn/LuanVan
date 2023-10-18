package com.luanvan.webservice.command.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/book")
public class GreetingController {
    @GetMapping("/hello")
    public  String greeting(){
        return "Hi";
    };

//    @RequestMapping("/service01")
//    public List<Images> getImages() {
//        List<Images> images = Arrays.asList(
//                new Images(1, "Treehouse of Horror V", "https://www.imdb.com/title/tt0096697/mediaviewer/rm3842005760"),
//                new Images(2, "The Town", "https://www.imdb.com/title/tt0096697/mediaviewer/rm3698134272"),
//                new Images(3, "The Last Traction Hero", "https://www.imdb.com/title/tt0096697/mediaviewer/rm1445594112"));
//        return images;
//    }

}
