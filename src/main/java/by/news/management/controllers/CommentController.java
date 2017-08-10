package by.news.management.controllers;

import by.news.management.model.Comment;
import by.news.management.model.News;
import by.news.management.service.CommentService;
import by.news.management.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private NewsService newsService;

    /**
     * This method will be called on XmlHttpRequest, handling POST request for
     * saving comment in database. It also validates the news input.
     */
    @PostMapping(value = "/comment", consumes = {MediaType.APPLICATION_JSON_VALUE} )
    public ResponseEntity<Void> addComment(@RequestBody Comment comment) {
        News news = newsService.getNewsById(comment.getNews());
        if(news==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        if (!commentService.addComment(comment)) {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
        return new ResponseEntity<>(HttpStatus.CREATED);
    }
}
