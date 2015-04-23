package com.singthi.thisys;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.singthi.thisys.model.User;
import com.singthi.thisys.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource
	private UserService userService;
	
	@RequestMapping(value = {"","list"})
	public String list(User user,HttpServletRequest request,HttpServletResponse response,Model model) {
		List<User> userList =  userService.findAll();
		model.addAttribute("userList", userList);
		
		return "user/userList";
	}
	
}
