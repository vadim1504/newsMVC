package by.news.management.dao;


import by.news.management.model.Comment;

import java.util.List;

public interface CommentDAO {

    List<Comment> getAllComments();
    Comment getCommentById(int id);
    void addComment(Comment comment);
    void updateComment(Comment comment);
    void deleteComment(int id);
    boolean commentExists(Comment comment);

}
