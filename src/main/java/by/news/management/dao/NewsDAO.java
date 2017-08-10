package by.news.management.dao;


import by.news.management.model.News;

import java.util.List;

public interface NewsDAO {

    Long getCountNews();
    List<News> getNewsForPage(int p,int size);
    List<News> getAllNews();
    News getNewsById(int id);
    void addNews(News news);
    void updateNews(News news);
    void deleteNews(int id);
    boolean newsExists(News news);

}
