package com.qlove.server.rms.controller.admin;

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
import com.qlove.server.rms.service.AdminService;
import com.qlove.server.rms.util.ListUtil;

@Controller("adminResourceCallbackController")
@RequestMapping("/admin")
public class ResourceCallbackController {
	@Resource
	private AdminService adminService;
	
	/**
	 * @param session
	 * @return	�����ʲ����ս���
	 */
	@RequestMapping("/resourceCallback")
	public ModelAndView resourceCallback(HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
//		List<Application> applications=adminService.getResourceCallbackApplications();
//		modelAndView.addObject("numOfApplications", applications.size());
//		modelAndView.addObject("applications", applications);
		modelAndView.setViewName("admin/resourceCallback");
		return modelAndView;
	}
	
	/**
	 * @return	�����ʲ����������б�
	 */
	@RequestMapping("/getResourceCallbackApplications")
	public @ResponseBody List<Application> getResourceCallbackApplications(){
		return adminService.getResourceCallbackApplications();
	}
	
	
	
	/**
	 * @param rid
	 * @param session
	 * @return	�����ʲ�
	 */
	@RequestMapping("/dealResourceCallbackApplication")
	public @ResponseBody Map<String,Object> dealResourceCallbackApplication(HttpSession session,
			@RequestParam(value = "aId", required = true) int applicationId,
			@RequestParam(value = "accept", required = true) boolean accept,
			@RequestParam(value = "remark", required = false) String remark){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		//�ж������Ƿ��ѱ�����
		if(ListUtil.applicationContained(applicationId, adminService.getResourceCallbackApplications())){
			map.put("applicationCompleted",false );
			//����Ա����ʲ�����
			if(accept){
				map.put("success", adminService.agreeResourceCallbackApplication(applicationId, uid));
			}else{//����Ա�ܾ��ʲ�����
				adminService.refuseResourceCallbackApplication(applicationId, uid, remark);
				map.put("success", true);
			}
		}else{
			map.put("applicationCompleted",true);
		}
		return map;
	}

}
