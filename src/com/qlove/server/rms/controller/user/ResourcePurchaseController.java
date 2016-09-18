package com.qlove.server.rms.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qlove.server.rms.model.PurchaseApplication;
import com.qlove.server.rms.service.UserService;

@Controller("userResourcePurchaseController")
@RequestMapping("/user")
public class ResourcePurchaseController {
	@Resource
	private UserService userService;
	
	/**
	 * @param session
	 * @return	�ʲ������������
	 */
	@RequestMapping("/resourcePurchaseApplication")
	public ModelAndView resourcePurchaseApplication(HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		String uid=(String)session.getAttribute("uid");
		List<PurchaseApplication> list=userService.getResourcePurchaseApplications(uid);
		modelAndView.addObject("uid", uid);
		modelAndView.addObject("applications", list);
		modelAndView.setViewName("user/resourcePurchaseApplication");
		return modelAndView;
	}
	
	/**
	 * @param aId
	 * @return	��ȡ�ʲ���������
	 */
	@RequestMapping("/getPurchaseApplicationDetailInfo")
	public @ResponseBody Map<String,Object> getPurchaseApplicationDetailInfo(int aId){
		Map<String,Object> map=new HashMap<String,Object>();
		PurchaseApplication application=userService.getPurchaseApplicationInfo(aId);
		map.put("application", application);
		return map;
	}
	
	/**
	 * @param session
	 * @param info	�ʲ�����������Ϣ
	 * @return	�ύ�ʲ���������
	 */
	@RequestMapping("/purchaseResourceApplication")
	public @ResponseBody Map<String, Object> commitPurchaseApplication(HttpSession session,PurchaseApplication application){
		Map<String,Object> map=new HashMap<String,Object>();
		application.setUser((String)session.getAttribute("uid"));
		userService.createResourcePurchaseApplication(application);
		map.put("success", true);
		return map;
	}
}
