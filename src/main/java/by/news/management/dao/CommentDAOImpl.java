package by.news.management.dao;

import by.news.management.model.Comment;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Transactional
@Repository
public class CommentDAOImpl implements CommentDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Comment> getAllComments(){
        String hql = "FROM Comment as cm ORDER BY cm.id";
        return (List<Comment>) entityManager.createQuery(hql).getResultList();
    }

    @Override
    public Comment getCommentById(int id) {
        return entityManager.find(Comment.class,id);
    }

    public void addComment(Comment comment) {
        entityManager.persist(comment);
    }

    @Override
    public void updateComment(Comment comment) {
        Comment com1 = getCommentById(comment.getId());
        com1.setNews(comment.getNews());
        com1.setAuthorId(comment.getAuthorId());
        com1.setText(comment.getText());
        entityManager.flush();
    }

    @Override
    public void deleteComment(int id) {
        entityManager.remove(getCommentById(id));

    }

    public boolean commentExists(Comment comment) {
        String hql = "FROM Comment as cm WHERE cm.news = ? and cm.authorId = ? and cm.text = ?";
        int count = entityManager.createQuery(hql).setParameter(1, comment.getNews()).setParameter(2, comment.getAuthorId()).setParameter(3, comment.getText()).getResultList().size();
        return count > 0;
    }

}
