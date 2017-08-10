package by.news.management.controllers;

import by.news.management.model.News;
import by.news.management.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
public class NewsController {

    private final int pSize = 5;
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "0") Integer p ){
        modelMap.addAttribute("news",newsService.getNewsForPage(p, pSize));
        modelMap.addAttribute("currentPage",p);
        double countNews = newsService.getCountNews();
        modelMap.addAttribute("nPage",Math.ceil(countNews/5));
        return "index";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String getNews(ModelMap modelMap, @PathVariable("id") Integer id){
        modelMap.addAttribute("news",newsService.getNewsById(id));
        return "viewer";
    }

    @RequestMapping(value = { "/new" }, method = RequestMethod.GET)
    public String newNews(ModelMap model) {
        News news = new News();
        model.addAttribute("news", news);
        model.addAttribute("edit", false);
        return "edit";
    }

    @RequestMapping(value = { "/create" }, method = RequestMethod.POST)
    public ResponseEntity<Void> createNews(@RequestBody News news) {
        if(!newsService.addNews(news)){
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @RequestMapping(value = { "/edit-{id}-news" }, method = RequestMethod.GET)
    public String editNews(@PathVariable Integer id, ModelMap model) {
        News news = newsService.getNewsById(id);
        model.addAttribute("news", news);
        model.addAttribute("edit", true);
        return "edit";
    }

    @RequestMapping(value = { "/update" }, method = RequestMethod.POST)
    public ResponseEntity<Void> updateNews(@RequestBody News news) {
        if(newsService.getNewsById(news.getId())==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        newsService.updateNews(news);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(value = { "/delete-{id}-news" }, method = RequestMethod.GET)
    public String deleteNews(@PathVariable Integer id) {
        newsService.deleteNews(id);
        return "redirect:/";
    }

}
