package com.qlove.server.rms.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qlove.server.rms.model.Application;
import com.qlove.server.rms.service.UserService;

@Controller("userApplicationProcessController")
@RequestMapping("/user")
public class ApplicationProcessController {
	@Resource
	private UserService userService;

	/**
	 * @param session
	 * @return �鿴����Ľ���
	 */
	@RequestMapping("/userApplicationProcess")
	public ModelAndView userApplicationProcess(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		String uid = (String) session.getAttribute("uid");
		modelAndView.addObject("uid", uid);
		modelAndView.setViewName("user/userApplicationProcess");
		return modelAndView;
	}

	/**
	 * @param session
	 * @return	����û�������ʲ��������룬�ʲ�ת��������ʲ��黹����
	 */
	@RequestMapping("/getUserApplications")
	public @ResponseBody List<Application> getUserApplications(HttpSession session) {
		String uid = (String) session.getAttribute("uid");
		// �û�������ʲ����������ʲ�ת��������ʲ����������б�
		List<Application> list = new ArrayList<>();
		list.addAll(userService.getResourceApplyApplications(uid));
		list.addAll(userService.getResourceTransferApplications(uid));
		list.addAll(userService.getResourceReturnApplications(uid));
		return list;
	}
	
	/**
	 * @param session
	 * @return	����û�������ʲ���������
	 */
	@RequestMapping("/getUserResourceApplyApplications")
	public @ResponseBody List<Application> getUserResourceApplyApplications(HttpSession session){
		String uid=(String)session.getAttribute("uid");
		List<Application> applications=userService.getResourceApplyApplications(uid);
		return applications;
	}
	
	/**
	 * @param session
	 * @return	����û�������ʲ�ת������
	 */
	@RequestMapping("/getUserResourceTransferApplications")
	public @ResponseBody List<Application> getUserResourceTransferApplications(HttpSession session){
		String uid=(String)session.getAttribute("uid");
		List<Application> applications=userService.getResourceTransferApplications(uid);
		return applications;
	}
	
	/**
	 * @param session
	 * @return	����û�������ʲ��黹����
	 */
	@RequestMapping("/getUserResourceReturnApplications")
	public @ResponseBody List<Application> getUserResourceReturnApplications(HttpSession session){
		String uid=(String)session.getAttribute("uid");
		List<Application> applications=userService.getResourceReturnApplications(uid);
		return applications;
	}
	
	/**
	 * @param applicationId
	 * @return	����������ϸ��Ϣ
	 */
	@RequestMapping("/getApplicationDetailInfo")
	public @ResponseBody Map<String,Object> getApplicationDetailInfo(@RequestParam(value="aId",required=true)int applicationId){
		Map<String,Object> map=new HashMap<String,Object>();
		Application application=userService.getApplicationInfo(applicationId);
		map.put("application", application);
		return map;
	}

}
