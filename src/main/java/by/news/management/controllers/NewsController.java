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

    //Number of news on one page.
    private final int pSize = 5;

    @Autowired
    private NewsService newsService;

    /**
     * This method will list existing news for page.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "0") Integer p ){
        modelMap.addAttribute("news",newsService.getNewsForPage(p, pSize));
        modelMap.addAttribute("currentPage",p);
        double countNews = newsService.getCountNews();
        modelMap.addAttribute("nPage",Math.ceil(countNews/5));
        return "index";
    }

    /**
     * This method will existing news by it's id value.
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String getNews(ModelMap modelMap, @PathVariable("id") Integer id){
        modelMap.addAttribute("news",newsService.getNewsById(id));
        return "viewer";
    }

    /**
     * This method will provide the medium to add a new news.
     */
    @RequestMapping(value = { "/new" }, method = RequestMethod.GET)
    public String newNews(ModelMap model) {
        News news = new News();
        model.addAttribute("news", news);
        model.addAttribute("edit", false);
        return "edit";
    }

    /**
     * This method will be called on XmlHttpRequest, handling POST request for
     * saving news in database. It also validates the news input.
     */
    @RequestMapping(value = { "/create" }, method = RequestMethod.POST)
    public ResponseEntity<Void> createNews(@RequestBody News news) {
        if(!newsService.addNews(news)){
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    /**
     * This method will provide the medium to update an existing news.
     */
    @RequestMapping(value = { "/edit-{id}-news" }, method = RequestMethod.GET)
    public String editNews(@PathVariable Integer id, ModelMap model) {
        News news = newsService.getNewsById(id);
        model.addAttribute("news", news);
        model.addAttribute("edit", true);
        return "edit";
    }

    /**
     * This method will be called on XmlHttpRequest, handling POST request for
     * updating news in database. It also validates the news input.
     */
    @RequestMapping(value = { "/update" }, method = RequestMethod.POST)
    public ResponseEntity<Void> updateNews(@RequestBody News news) {
        if(newsService.getNewsById(news.getId())==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        newsService.updateNews(news);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /**
     * This method will delete an news by it's id value.
     */
    @RequestMapping(value = { "/delete-{id}-news" }, method = RequestMethod.GET)
    public String deleteNews(@PathVariable Integer id) {
        newsService.deleteNews(id);
        return "redirect:/";
    }

}
