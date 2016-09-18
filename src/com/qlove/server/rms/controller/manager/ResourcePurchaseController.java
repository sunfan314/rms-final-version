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

import com.qlove.server.rms.model.PurchaseApplication;
import com.qlove.server.rms.service.ManagerService;
import com.qlove.server.rms.util.ListUtil;

@Controller("managerResourcePurchaseController")
@RequestMapping("/manager")
public class ResourcePurchaseController {
	@Resource
	private ManagerService managerService;

	/**
	 * @param session
	 * @return �����ʲ������������
	 */
	@RequestMapping("/resourcePurchase")
	public ModelAndView resourcePurchase(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("manager/resourcePurchase");
		return modelAndView;
	}

	/**
	 * @return ��ȡ�ʲ����������б�
	 */
	@RequestMapping("/getResourcePurchaseApplications")
	public @ResponseBody List<PurchaseApplication> getResourcePurchaseApplications() {
		return managerService.getResourcePurchaseApplications();
	}

	/**
	 * @param session
	 * @param str
	 * @return �����ʲ���������
	 */
	@RequestMapping("/dealResourcePurchaseApplication")
	public @ResponseBody Map<String, Object> dealResourcePurchaseApplication(HttpSession session,
			@RequestParam(value = "aId", required = true) int applicationId,
			@RequestParam(value = "accept", required = true) boolean accept,
			@RequestParam(value = "remark", required = false) String remark) {
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		//�ж������Ƿ��ѱ�����
		if(ListUtil.purchaseApplicationContained(applicationId, managerService.getResourcePurchaseApplications())){
			map.put("applicationCompleted",false );
			//����ͬ���ʲ���������
			if(accept){
				managerService.agreeResourcePurchaseApplication(applicationId,uid);
				map.put("success",true);
			}else{//����ܾ��ʲ���������
				managerService.refuseResourcePurchaseApplication(applicationId,uid,remark);;
				map.put("success", true);
			}
		}else{
			map.put("applicationCompleted",true);
		}
		return map;
	}

}
