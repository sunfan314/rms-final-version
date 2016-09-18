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

@Controller("adminResourceAllocationController")
@RequestMapping("/admin")
public class ResourceAllocationController {
	@Resource
	private AdminService adminService;

	/**
	 * @param session
	 * @return	�����ʲ��������
	 */
	@RequestMapping("/resourceAllocation")
	public ModelAndView resourceAllocation(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
//		List<Application> applications=adminService.getResourceAllocationApplications();
//		modelAndView.addObject("numOfApplications",applications.size());
//		modelAndView.addObject("applications",applications);
		modelAndView.setViewName("admin/resourceAllocation");
		return modelAndView;
	}
	
	/**
	 * @return	����ͨ��������˵��ڿ��ʲ����������б�
	 */
	@RequestMapping("/getResourceAllocationApplications")
	public @ResponseBody List<Application> getResourceAllocationApplications(){
		return adminService.getResourceAllocationApplications();
	}

	

	/**
	 * @param application
	 * @param session
	 * @return	�����ڿ��ʲ�
	 */
	@RequestMapping("/dealResourceAllocationApplication")
	public @ResponseBody Map<String, Object> dealResourceAllocationApplication(HttpSession session,
			@RequestParam(value = "aId", required = true) int applicationId,
			@RequestParam(value = "accept", required = true) boolean accept,
			@RequestParam(value = "remark", required = false) String remark) {
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		//�ж������Ƿ��ѱ�����
		if(ListUtil.applicationContained(applicationId, adminService.getResourceAllocationApplications())){
			map.put("applicationCompleted",false );
			//����Ա����ʲ�����
			if(accept){
				map.put("success", adminService.agreeResourceAllocationApplication(applicationId, uid));
			}else{//����Ա�ܾ��ʲ�ת�Ʒ���
				adminService.refuseResourceAllocationApplication(applicationId, uid, remark);
				map.put("success", true);
			}
		}else{
			map.put("applicationCompleted",true);
		}
		return map;
	}
	
	

}
