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

import com.qlove.server.rms.model.PurchaseApplication;
import com.qlove.server.rms.service.AdminService;
import com.qlove.server.rms.util.ListUtil;

@Controller("adminResourcePurchaseController")
@RequestMapping("/admin")
public class ResourcePurchaseController {
	@Resource
	private AdminService adminService;
	
	/**
	 * @param session
	 * @return	�����ʲ��������
	 */
	@RequestMapping("/resourcePurchase")
	public ModelAndView resourcePurchase(HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("admin/resourcePurchase");
		return modelAndView;
	}
	
	/**
	 * @return	��ȡ��׼���ʲ���������
	 */
	@RequestMapping("/getResourcePurchaseApplications")
	public @ResponseBody List<PurchaseApplication> getResourcePurchaseApplications(){
		return adminService.getResourcePurchaseApplications();
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
		if(ListUtil.purchaseApplicationContained(applicationId,adminService.getResourcePurchaseApplications())){
			map.put("applicationCompleted",false );
			//����Աͬ���ʲ���������
			if(accept){
				adminService.agreeResourcePurchaseApplication(applicationId,uid);
				map.put("success",true);
			}else{//����Ա�ܾ��ʲ���������
				adminService.refuseResourcePurchaseApplication(applicationId,uid,remark);;
				map.put("success", true);
			}
		}else{
			map.put("applicationCompleted",true);
		}
		return map;
	}


}
