package org.java.pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class SongInfo implements Serializable {
    private Long songId;

    private String songName;

    private SingerInfo singerInfo;

    private SongType songType;

    private Long downCount;

    private Long collectCount;

    private Integer uploadRole;

    public Long getSongId() {
        return songId;
    }

    public void setSongId(Long songId) {
        this.songId = songId;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName == null ? null : songName.trim();
    }

    public SingerInfo getSingerInfo() {
		return singerInfo;
	}

	public void setSingerInfo(SingerInfo singerInfo) {
		this.singerInfo = singerInfo;
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