package com.zy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zy.po.Food;
import com.zy.po.FoodCuisine;
import com.zy.service.FoodService;

@Controller
@RequestMapping("/food")
public class FoodController {
	@Autowired
	private FoodService foodService;
	
	@RequestMapping("foodlist")
	public ModelAndView foodlist(
			ModelAndView mv) throws Exception {
		List<FoodCuisine> foodcuisines = foodService.selectAll();
		mv.addObject("foodcuisines",foodcuisines);
		mv.setViewName("employees/foodlist");
		return mv;
	}
	
	@RequestMapping("tofoodadd")
	public ModelAndView tofoodadd(
			ModelAndView mv) throws Exception {
		mv.setViewName("employees/foodinsert");
		return mv;
	}
			
	@RequestMapping("foodadd")
	public ModelAndView foodadd(
			Food food,
			ModelAndView mv) throws Exception {
		foodService.insert(food);
		List<FoodCuisine> foodcuisines = foodService.selectAll();
		mv.addObject("foodcuisines",foodcuisines);
		mv.setViewName("employees/foodlist");
		return mv;
	}
	
	@RequestMapping("fooddel")
	public ModelAndView fooddel(
			@RequestParam("id") int id,
			ModelAndView mv) throws Exception {
		foodService.delete(id);
		List<FoodCuisine> foodcuisines = foodService.selectAll();
		mv.addObject("foodcuisines",foodcuisines);
		mv.setViewName("employees/foodlist");
		return mv;
	}
	
	@RequestMapping("/tofoodupd")
	public ModelAndView tofoodupd(
			@RequestParam("id") int id,
			ModelAndView mv) throws Exception{
		Food food = foodService.selectById(id);
		mv.addObject("food",food);
		mv.setViewName("employees/foodupd");
		return mv;
	}
	
	@RequestMapping("foodupd")
	public ModelAndView foodupd(
			Food food,
			ModelAndView mv) throws Exception {
		foodService.update(food);
		List<FoodCuisine> foodcuisines = foodService.selectAll();
		mv.addObject("foodcuisines",foodcuisines);
		mv.setViewName("employees/foodlist");
		return mv;
	}
}