package com.qlove.server.rms.controller.manager;

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
import com.qlove.server.rms.service.ManagerService;
import com.qlove.server.rms.util.ListUtil;

@Controller("managerResourceAllocationController")
@RequestMapping("/manager")
public class ResourceAllocationController {
	@Resource
	private ManagerService managerService;

	/**
	 * @param session
	 * @return �����ڿ��ʲ������������
	 */
	@RequestMapping("/resourceAllocation")
	public ModelAndView resourceAllocation(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
//		List<Application> applications=managerService.getResourceAllocationApplications();
//		modelAndView.addObject("numOfApplications", applications.size());
//		modelAndView.addObject("applications",applications);
		modelAndView.setViewName("manager/resourceAllocation");
		return modelAndView;
	}
	
	/**
	 * @return	�����ڿ��ʲ����������б�
	 */
	@RequestMapping("/getResourceAllocationApplications")
	public @ResponseBody List<Application> getResourceAllocationApplications(){
		return managerService.getResourceAllocationApplications();
	}

	/**
	 * @param session
	 * @param application
	 * @return	�����ʲ���������
	 */
	@RequestMapping("/dealResourceAllocationApplication")
	public @ResponseBody Map<String, Object> dealResourceAllocationApplication(HttpSession session,
			@RequestParam(value = "aId", required = true) int applicationId,
			@RequestParam(value = "accept", required = true) boolean accept,
			@RequestParam(value = "remark", required = false) String remark) {
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		//�ж������Ƿ��ѱ�����
		if(ListUtil.applicationContained(applicationId, managerService.getResourceAllocationApplications())){
			map.put("applicationCompleted",false );
			//����ͬ���ʲ���������
			if(accept){
				managerService.agreeResourceAllocationApplication(applicationId,uid);
				map.put("success",true);
			}else{//����ܾ��ʲ���������
				managerService.refuseResourceAllocationApplication(applicationId,uid,remark);;
				map.put("success", true);
			}
		}else{
			map.put("applicationCompleted",true);
		}
		return map;
	}

}
