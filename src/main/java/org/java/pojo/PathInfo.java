package org.java.pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class PathInfo implements Serializable {
    private Integer pathId;

    private String pathName;

    public Integer getPathId() {
        return pathId;
    }

    public void setPathId(Integer pathId) {
        this.pathId = pathId;
    }

    public String getPathName() {
        return pathName;
    }

    public void setPathName(String pathName) {
        this.pathName = pathName == null ? null : pathName.trim();
    }
}