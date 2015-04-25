package com.singthi.thisys.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@RequestMapping(value = "listJson")
	@ResponseBody
	public List<User> listJson(User user,HttpServletRequest request,HttpServletResponse response,Model model) {
		List<User> userList =  userService.findAll();
		
		return userList;
	}
	
	@RequestMapping(value = "form")
	public String form(User user, Model model) {
		if(user.getId() != null) {
			user = userService.getById(user.getId());
		}
		
		model.addAttribute("user", user);
		return "user/userForm";
	}
	
	@RequestMapping(value = "save")
	public String save(User user, Model model, RedirectAttributes redirectAttributes) {
		userService.save(user);
		return "redirect:list";
	}
	
	@RequestMapping(value = "update")
	public String update(User user, Model model, RedirectAttributes redirectAttributes) {
		userService.update(user);
		return "redirect:list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(User user, RedirectAttributes redirectAttributes) {
		userService.delete(user.getId());
		return "redirect:list";
	}
	
	@RequestMapping(value = "testExtJs")
	public String testExtJs() {
		return "user/extUserList";
	}
	
	@RequestMapping(value = "index")
	public String toIndex() {
		return "user/index";
	}
	
}
