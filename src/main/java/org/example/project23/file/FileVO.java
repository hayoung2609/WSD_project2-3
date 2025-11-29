package org.example.project23.file;

public class FileVO {
    private String title;
    private String fileName;

    public FileVO(String title, String filename) {
        this.title = title;
        this.fileName = filename;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
