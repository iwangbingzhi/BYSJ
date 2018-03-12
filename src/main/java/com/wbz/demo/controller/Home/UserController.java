package com.wbz.demo.controller.Home;

import com.wbz.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;


import com.wbz.demo.util.Functions;
/**
 * @Title: UserController.java
 * @Description:用户的controller
 * @Author 王炳智
 * @Date 2018/3/12 10:54
 */
@Controller
public class UserController {

	@Autowired
	private  HttpServletRequest request;

	@Autowired
	private UserService userService;

	@Autowired
	private Functions functions;








}
