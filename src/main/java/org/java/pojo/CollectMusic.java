package org.java.pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CollectMusic implements Serializable {
    private Long collectId;

    private UserInfo user;

    private Long musicId;

    private Integer collectType;

    private Integer musicType;

    public Long getCollectId() {
        return collectId;
    }

    public void setCollectId(Long collectId) {
        this.collectId = collectId;
    }

    public UserInfo getUserInfo() {
        return user;
    }

    public void setUserInfo(UserInfo user) {
        this.user = user;
    }

    public Long getMusicId() {
        return musicId;
    }

    public void setMusicId(Long musicId) {
        this.musicId = musicId;
    }

    public Integer getCollectType() {
        return collectType;
    }

    public void setCollectType(Integer collectType) {
        this.collectType = collectType;
    }

    public Integer getMusicType() {
        return musicType;
    }

    public void setMusicType(Integer musicType) {
        this.musicType = musicType;
    }
}