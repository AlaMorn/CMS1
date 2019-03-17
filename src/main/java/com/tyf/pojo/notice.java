package com.tyf.pojo;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class notice {
    private String sid;
    private String summary;
    private List<MultipartFile> file;

    public List<MultipartFile> getFile() {
        return file;
    }

    public void setFile(List<MultipartFile> file) {
        this.file = file;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }



    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }
}
