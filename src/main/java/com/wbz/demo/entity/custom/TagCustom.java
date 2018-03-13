package com.wbz.demo.entity.custom;

import com.wbz.demo.entity.Tag;

/**
 * @Title: TagCustom.java
 * @Description:文章标签的信息扩展
 * @Author 王炳智
 * @Date 2018/3/13 10:24
 */
public class TagCustom extends Tag {
	//标签对应的文章数目
	private Integer articleCount;

	public Integer getArticleCount() {
		return articleCount;
	}

	public void setArticleCount(Integer articleCount) {
		this.articleCount = articleCount;
	}
}
