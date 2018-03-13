package com.wbz.demo.entity.custom;

import com.wbz.demo.entity.User;

/**
 * @Title: UserCustom.java
 * @Description:用户信息的扩展类
 * @Author 王炳智
 * @Date 2018/3/13 10:24
 */
public class UserCustom extends User {
    //用户的文章数
    private Integer articleCount;

    public Integer getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(Integer articleCount) {
        this.articleCount = articleCount;
    }
}
