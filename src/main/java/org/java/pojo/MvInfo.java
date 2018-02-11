package org.java.pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MvInfo implements Serializable {
    private Long mvId;

    private String mvName;

    private SongType songType;

    private Long downCount;

    private Long collectCount;

    private Integer uploadRole;

    public Long getMvId() {
        return mvId;
    }

    public void setMvId(Long mvId) {
        this.mvId = mvId;
    }

    public String getMvName() {
        return mvName;
    }

    public void setMvName(String mvName) {
        this.mvName = mvName == null ? null : mvName.trim();
    }

    public SongType getSongType() {
		return songType;
	}

	public void setSongType(SongType songType) {
		this.songType = songType;
	}

	public Long getDownCount() {
        return downCount;
    }

    public void setDownCount(Long downCount) {
        this.downCount = downCount;
    }

    public Long getCollectCount() {
        return collectCount;
    }

    public void setCollectCount(Long collectCount) {
        this.collectCount = collectCount;
    }

    public Integer getUploadRole() {
        return uploadRole;
    }

    public void setUploadRole(Integer uploadRole) {
        this.uploadRole = uploadRole;
    }
}