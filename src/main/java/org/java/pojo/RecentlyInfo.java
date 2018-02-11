package org.java.pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class RecentlyInfo implements Serializable {
    private Long recentlyId;

    private SongInfo songInfo;

    public Long getRecentlyId() {
        return recentlyId;
    }

    public void setRecentlyId(Long recentlyId) {
        this.recentlyId = recentlyId;
    }

	public SongInfo getSongInfo() {
		return songInfo;
	}

	public void setSongInfo(SongInfo songInfo) {
		this.songInfo = songInfo;
	}
}