package com.wbz.demo.entity.custom;

import java.util.List;

/**
 * @Title: ArticleDetailVo.java
 * @Description:用于封装文章正文详细信息，包括文章内容信息，作者信息，分类
 * @Author 王炳智
 * @Date 2018/3/12 11:55
 */
public class ArticleDetailVo {
	//文章相关信息
	private ArticleCustom articleCustom;
	
	//文章的作者相关信息
	private UserCustom userCustom;
	
	//文章的分类相关信息
	private List<CategoryCustom> categoryCustomList;

	public ArticleCustom getArticleCustom() {
		return articleCustom;
	}
	
	public void setArticleCustom(ArticleCustom articleCustom) {
		this.articleCustom = articleCustom;
	}
	
	public UserCustom getUserCustom() {
		return userCustom;
	}
	
	public void setUserCustom(UserCustom userCustom) {
		this.userCustom = userCustom;
	}
	
	public List<CategoryCustom> getCategoryCustomList() {
		return categoryCustomList;
	}
	
	public void setCategoryCustomList(List<CategoryCustom> categoryCustomList) {
		this.categoryCustomList = categoryCustomList;
	}

}
