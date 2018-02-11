package org.java.pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class SingerInfo implements Serializable {
    private Long singerId;

    private String singerName;

    private SingerType singerType;

    private Long popularity;

    public Long getSingerId() {
        return singerId;
    }

    public void setSingerId(Long singerId) {
        this.singerId = singerId;
    }

    public String getSingerName() {
        return singerName;
    }

    public void setSingerName(String singerName) {
        this.singerName = singerName == null ? null : singerName.trim();
    }

    public SingerType getSingerType() {
		return singerType;
	}

	public void setSingerType(SingerType singerType) {
		this.singerType = singerType;
	}

	public Long getPopularity() {
        return popularity;
    }

    public void setPopularity(Long popularity) {
        this.popularity = popularity;
    }
}