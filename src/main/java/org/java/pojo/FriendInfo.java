package org.java.pojo;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class FriendInfo implements Serializable {
    private Long userId;

    private List<UserInfo> users;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

	public List<UserInfo> getUsers() {
		return users;
	}

	public void setUsers(List<UserInfo> users) {
		this.users = users;
	}
}