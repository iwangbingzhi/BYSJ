package com.wbz.demo.controller.Home;

import com.wbz.demo.entity.custom.*;
import com.wbz.demo.service.*;

import com.wbz.demo.entity.custom.ArticleListVo;
import com.wbz.demo.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Title: IndexController.java
 * @Description:用户的controller
 * @Author 王炳智
 * @Date 2018/3/12 11:54
 */
@Controller
public class IndexController {
	
	@Autowired
	private ArticleService articleService;
	
	//首页显示
	@RequestMapping("/")
	public ModelAndView IndexView() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		//文章列表
		int pageSize = 10;
		List<ArticleListVo> articleListVoList = articleService.listArticleByPage(1,null,pageSize);
		modelAndView.addObject("articleListVoList",articleListVoList);

		modelAndView.setViewName("/Home/index");
		return modelAndView;
	}
	
	//文章分页显示
	@RequestMapping("p/{pageNow}")
	//适合RESTful
	public @ResponseBody  ModelAndView ArticleListByPageView(@PathVariable("pageNow") Integer pageNow) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		//设置每页显示的数量
		int pageSize = 10;
		List<ArticleListVo> articleListVoList = articleService.listArticleByPage(1,pageNow,pageSize);
		modelAndView.addObject("articleListVoList",articleListVoList);
		modelAndView.setViewName("Home/index");
		return modelAndView;//不会被解析为跳转路径，而是直接写入HTTP response body中
	}

}




