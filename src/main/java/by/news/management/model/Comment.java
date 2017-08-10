package by.news.management.model;

import javax.persistence.*;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author vadim
 *
 */
@Entity
@Table(name = "comments")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "news_id")
    private int news;
    @Column(name = "author_id",nullable = false)
    private int authorId;
    @Column(name = "text",nullable = false)
    private String text;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getNews() {
        return news;
    }

    public void setNews(int news) {
        this.news = news;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Comment comment = (Comment) o;

        if (id != comment.id) return false;
        if (news != comment.news) return false;
        if (authorId != comment.authorId) return false;
        return text != null ? text.equals(comment.text) : comment.text == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + news;
        result = 31 * result + authorId;
        result = 31 * result + (text != null ? text.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", news=" + news +
                ", authorId=" + authorId +
                ", text='" + text + '\'' +
                '}';
    }
}
