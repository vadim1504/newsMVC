package by.news.management.service;

import by.news.management.dao.CommentDAO;
import by.news.management.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    private CommentDAO commentDAOImpl;

    @Override
    public List<Comment> getAllComments() {
        return commentDAOImpl.getAllComments();
    }

    @Override
    public Comment getCommentById(int id) {
        return commentDAOImpl.getCommentById(id);
    }

    public synchronized boolean addComment(Comment comment) {
        if (commentDAOImpl.commentExists(comment)) {
            return false;
        } else {
            commentDAOImpl.addComment(comment);
            return true;
        }
    }

    @Override
    public void updateComment(Comment comment) {
        commentDAOImpl.updateComment(comment);
    }

    @Override
    public void deleteComment(int id) {
        commentDAOImpl.deleteComment(id);
    }
}
