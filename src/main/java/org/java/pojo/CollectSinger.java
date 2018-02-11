package org.java.pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CollectSinger implements Serializable {
    private Long collectId;

    private UserInfo user;

    private Long singerId;

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

    public Long getSingerId() {
        return singerId;
    }

    public void setSingerId(Long singerId) {
        this.singerId = singerId;
    }
}