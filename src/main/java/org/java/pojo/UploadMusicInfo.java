package org.java.pojo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class UploadMusicInfo implements Serializable {
    private Long uploadId;

    private Long userId;

    private Long musicId;

    private Date createdate;

    private Integer musicType;

    public Long getUploadId() {
        return uploadId;
    }

    public void setUploadId(Long uploadId) {
        this.uploadId = uploadId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getMusicId() {
        return musicId;
    }

    public void setMusicId(Long musicId) {
        this.musicId = musicId;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getMusicType() {
        return musicType;
    }

    public void setMusicType(Integer musicType) {
        this.musicType = musicType;
    }
}