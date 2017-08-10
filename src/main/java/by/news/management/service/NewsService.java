package by.news.management.service;

import by.news.management.model.News;

import java.util.List;

public interface NewsService {

    Long getCountNews();
    List<News> getNewsForPage(int p, int size);
    List<News> getAllNews();
    News getNewsById(int id);
    boolean addNews(News news);
    void updateNews(News news);
    void deleteNews(int id);

}
