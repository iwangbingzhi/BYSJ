package com.wbz.demo.controller.Home;

import com.wbz.demo.entity.custom.*;
import com.wbz.demo.service.*;
import com.wbz.demo.entity.custom.ArticleListVo;
import com.wbz.demo.entity.custom.CategoryCustom;
import com.wbz.demo.entity.custom.PageCustom;
/*import com.wbz.demo.entity.custom.TagCustom;*/
import com.wbz.demo.service.ArticleService;
import com.wbz.demo.service.CategoryService;
import com.wbz.demo.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class PageController {
	@Autowired
	private PageService pageService;

	@Autowired
	private ArticleService articleService;

	@Autowired
	private CategoryService categoryService;


	@ModelAttribute
	public void init(Model model) throws Exception {

	}

	//页面显示
	@RequestMapping(value = "/{key}")
	public ModelAndView ArticleDetailView(@PathVariable("key") String key) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		PageCustom pageCustom = pageService.getPageByKey(1,key);
		if(pageCustom!=null) {
			modelAndView.addObject("pageCustom",pageCustom);
			modelAndView.setViewName("Home/Page/page");
		} else {
			modelAndView.setViewName("Home/Error/404");
		}
		return modelAndView;

	}


	//文章归档页面显示
	@RequestMapping(value = "/articleFile")
	public ModelAndView articleFile() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("Home/Page/articleFile");
		List<ArticleListVo> articleList = articleService.listArticle(1);
		modelAndView.addObject("articleList",articleList);
		return modelAndView;
	}

	//站点地图显示
	@RequestMapping(value = "/map")
	public ModelAndView siteMap() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("Home/Page/siteMap");
		//文章显示
		List<ArticleListVo> articleList = articleService.listArticle(1);
		modelAndView.addObject("articleList",articleList);
        //分类显示
        List<CategoryCustom> categoryCustomList = categoryService.listCategory(1);
        modelAndView.addObject("categoryCustomList",categoryCustomList);

		return modelAndView;
	}

	//留言板
	@RequestMapping(value = "/message")
	public ModelAndView message() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("Home/Page/message");
		return modelAndView;
	}
}
