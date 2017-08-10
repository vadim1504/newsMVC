package by.news.management.dao;

import by.news.management.model.News;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Transactional
@Repository
public class NewsDAOImpl implements NewsDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<News> getAllNews() {
        String hql = "FROM News as nws ORDER BY nws.id";
        return (List<News>) entityManager.createQuery(hql).getResultList();
    }

    @Override
    public Long getCountNews() {
        String countQ = "Select count (n.id) from News n";
        return (Long) entityManager.createQuery(countQ).getSingleResult();
    }

    @Override
    public List<News> getNewsForPage(int p, int size) {
        String hql = "FROM News";
        if(p==0){
            return (List<News>) entityManager.createQuery(hql).setFirstResult(0).setMaxResults(size).getResultList();
        }else{
            return (List<News>) entityManager.createQuery(hql).setFirstResult(p*size).setMaxResults(size).getResultList();
        }
    }

    @Override
    public News getNewsById(int id) {
        return entityManager.find(News.class,id);
    }

    @Override
    public void addNews(News news) {
        entityManager.persist(news);
    }

    @Override
    public void updateNews(News news) {
        News news1 = getNewsById(news.getId());
        news1.setName(news.getName());
        news1.setDate(news.getDate());
        news1.setText(news.getText());
        entityManager.flush();
    }

    @Override
    public void deleteNews(int id) {
        entityManager.remove(getNewsById(id));
    }

    @Override
    public boolean newsExists(News news) {
        String hql = "FROM News as nws WHERE nws.name = ? and nws.date = ? and nws.text = ?";
        return entityManager.createQuery(hql).setParameter(1, news.getName()).setParameter(2, news.getDate()).setParameter(3, news.getText()).getResultList().size()>0;
    }
}
