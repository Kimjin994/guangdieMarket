package com.demo.bean;

/**
 * @ClassName Movie
 * @Author 12575
 * @Date 2021/1/4 14:48
 * @Version 1.0
 **/
public class Movie {
    private String title;
    private int movieId;
    private  String heading;
    private String haibao;
    private int classid;
    private String content;
    private String publishtime;
    private String country;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(String publishtime) {
        this.publishtime = publishtime;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    private String director;

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }

    public String getHaibao() {
        return haibao;
    }

    public void setHaibao(String haibao) {
        this.haibao = haibao;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public String getTitle() {
        return title;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }
}
