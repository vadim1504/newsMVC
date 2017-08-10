package by.news.management.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author vadim
 *
 */
@Entity
@Table(name = "news")
public class News {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "name", nullable = false)
    private String name;
    @OneToMany(fetch = FetchType.LAZY, targetEntity = Comment.class, cascade = CascadeType.REMOVE, orphanRemoval = true)
    @JoinColumn(name = "news_id")
    private Set<Comment> comments = new HashSet<Comment>();
    @Column(name = "date", nullable = false)
    private Date date;
    @Column(name = "text", nullable = false)
    private String text;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        News news = (News) o;

        if (id != news.id) return false;
        if (name != null ? !name.equals(news.name) : news.name != null) return false;
        if (comments != null ? !comments.equals(news.comments) : news.comments != null) return false;
        if (date != null ? !date.equals(news.date) : news.date != null) return false;
        return text != null ? text.equals(news.text) : news.text == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (comments != null ? comments.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (text != null ? text.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", comments=" + comments +
                ", date=" + date +
                ", text='" + text + '\'' +
                '}';
    }
}

