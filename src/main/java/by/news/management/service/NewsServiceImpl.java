package by.news.management.service;

import by.news.management.dao.NewsDAO;
import by.news.management.model.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsDAO newsDAOImpl;

    @Override
    public List<News> getNewsForPage(int p, int size) {
        return newsDAOImpl.getNewsForPage(p,size);
    }

    @Override
    public Long getCountNews() {
        return newsDAOImpl.getCountNews();
    }

    @Override
    public List<News> getAllNews() {
        return newsDAOImpl.getAllNews();
    }

    @Override
    public News getNewsById(int id) {
        return newsDAOImpl.getNewsById(id);
    }

    @Override
    public synchronized boolean addNews(News news) {
        if (newsDAOImpl.newsExists(news)) {
            return false;
        } else {
            newsDAOImpl.addNews(news);
            return true;
        }
    }

    @Override
    public void updateNews(News news) {
        newsDAOImpl.updateNews(news);
    }

    @Override
    public void deleteNews(int id) {
        newsDAOImpl.deleteNews(id);
    }
}
