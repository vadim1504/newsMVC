package by.news.management.service;

import by.news.management.model.Comment;

import java.util.List;


public interface CommentService {

    List<Comment> getAllComments();
    Comment getCommentById(int id);
    boolean addComment(Comment comment);
    void updateComment(Comment comment);
    void deleteComment(int id);

}
