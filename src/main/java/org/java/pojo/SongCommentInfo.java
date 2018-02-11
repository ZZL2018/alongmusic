package org.java.pojo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class SongCommentInfo implements Serializable {
    private Long commentId;

    private UserInfo userInfo;

    private SongInfo songInfo;

    private String comment;

    private Date createdate;

    private Long praiseCount;

    private Long disagreeCount;

    private Integer musicType;

    public Long getCommentId() {
        return commentId;
    }

    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public SongInfo getSongInfo() {
		return songInfo;
	}

	public void setSongInfo(SongInfo songInfo) {
		this.songInfo = songInfo;
	}

	public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Long getPraiseCount() {
        return praiseCount;
    }

    public void setPraiseCount(Long praiseCount) {
        this.praiseCount = praiseCount;
    }

    public Long getDisagreeCount() {
        return disagreeCount;
    }

    public void setDisagreeCount(Long disagreeCount) {
        this.disagreeCount = disagreeCount;
    }

    public Integer getMusicType() {
        return musicType;
    }

    public void setMusicType(Integer musicType) {
        this.musicType = musicType;
    }
}