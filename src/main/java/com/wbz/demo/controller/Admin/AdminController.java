package com.wbz.demo.controller.Admin;

import com.wbz.demo.entity.User;
import com.wbz.demo.entity.custom.*;
import com.wbz.demo.service.*;
import com.wbz.demo.entity.custom.ArticleListVo;
import com.wbz.demo.util.Functions;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

/*    @Autowired
    private CommentService commentService;*/

    @Autowired
    private LinkService linkService;

    @ModelAttribute
    public void init(Model model) throws Exception {

    }

    //后台首页
    @RequestMapping("/admin")
    public ModelAndView index() throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        //文章列表
        List<ArticleListVo> articleCustomList = articleService.listArticle(null);
        modelAndView.addObject("articleCustomList",articleCustomList);
        modelAndView.setViewName("/Admin/index");
        return modelAndView;
    }

    //登录页面显示
    @RequestMapping("/login")
    public ModelAndView loginView() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/Admin/login");
        return modelAndView;
    }

    //登录验证
    @RequestMapping(value = "/loginVerify",method = RequestMethod.POST)
    @ResponseBody
    public String loginVerify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberme = request.getParameter("rememberme");
        User user = userService.getUserByNameOrEmail(username);
        if(user==null) {
            map.put("code",0);
            map.put("msg","用户名无效！");
        } else if(!user.getUserPass().equals(password)) {
            map.put("code",0);
            map.put("msg","密码错误！");
        } else {
            //登录成功
            map.put("code",1);
            map.put("msg","");
       //添加session
            request.getSession().setAttribute("user", user);
            //添加cookie
            if(rememberme!=null) {
                //创建两个Cookie对象
                Cookie nameCookie = new Cookie("username", username);
                //设置Cookie的有效期为3天
                nameCookie.setMaxAge(60 * 60 * 24 * 3);
                Cookie pwdCookie = new Cookie("password", password);
                pwdCookie.setMaxAge(60 * 60 * 24 * 3);
                response.addCookie(nameCookie);
                response.addCookie(pwdCookie);
            }
            user.setUserLastLoginTime(new Date());
            user.setUserLastLoginIp(Functions.getIpAddr(request));
            userService.updateUser(user);

        }
        String result = new JSONObject(map).toString();
        return result;
    }

    //退出登录
    @RequestMapping(value = "/admin/logout")
    public String logout(HttpSession session) throws Exception {
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/login";
    }


}
