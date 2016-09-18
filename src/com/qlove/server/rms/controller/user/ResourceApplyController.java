package com.qlove.server.rms.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tools.ant.taskdefs.Untar;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qlove.server.rms.model.Application;
import com.qlove.server.rms.model.Resource;
import com.qlove.server.rms.service.ResourceService;
import com.qlove.server.rms.service.UserService;

@Controller("userResourceApplyController")
@RequestMapping("/user")
public class ResourceApplyController {
	@javax.annotation.Resource
	private UserService userService;
	
	@javax.annotation.Resource
	private ResourceService resourceService;

	/**
	 * @param session
	 * @return �ʲ��������
	 */
	@RequestMapping("/resourceApplyApplication")
	public ModelAndView resourceApplication(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/resourceApplyApplication");
		return modelAndView;
	}


	
	/**
	 * @param type
	 * @return ��ȡĳ�������ҵ�ڿ��ʲ��б�
	 */
	@RequestMapping("/getAvailableResources")
	public ModelAndView getAvailableResources(int type){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("type", resourceService.getType(type));
		modelAndView.addObject("resources", resourceService.getAvailableResources(type));
		modelAndView.setViewName("resource/resourceList");
		return modelAndView;
	}

	/**
	 * @param session
	 * @param application
	 * @return ������ҵ�ڿ��ʲ�
	 */
	@RequestMapping("/applyAvailableResource")
	public @ResponseBody Map<String, Object> applyAvailableResources(HttpServletRequest request, HttpSession session) {
		Map<String,Object> map=new HashMap<String,Object>();
		int rid=Integer.parseInt(request.getParameter("rid"));//�ʲ���ʶ
		String remark=request.getParameter("remark");//��ע��Ϣ
		String uid=(String)session.getAttribute("uid");//������
		map.put("success", userService.createResourceApplyApplication(rid, uid, remark));
		return map;
	}

}
