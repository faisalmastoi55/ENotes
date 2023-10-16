package com.notes.project.entities;

import java.sql.Timestamp;

public class AddNotesPost {
    private int pid;
    private String title;
    private String content;
    private Timestamp date;
    private int uid;

    public AddNotesPost() {
    }

    public AddNotesPost(String title, String content, Timestamp date, int uid) {
        this.title = title;
        this.content = content;
        this.date = date;
        this.uid = uid;
    }

    public AddNotesPost(int pid, String title, String content, Timestamp date, int uid) {
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.date = date;
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
    
    
}
