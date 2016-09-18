package com.qlove.server.rms.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qlove.server.rms.model.Application;
import com.qlove.server.rms.service.UserService;
import com.qlove.server.rms.util.ListUtil;

@Controller("userResourceTransferController")
@RequestMapping("/user")
public class ResourceTransferController {
	@Resource
	private UserService userService;

	/**
	 * @param session
	 * @return �ʲ�ת���������
	 */
	@RequestMapping("/resourceTransferApplication")
	public ModelAndView resourceTransferApplication(HttpSession session) {
//		String uid = (String) session.getAttribute("uid");
		ModelAndView modelAndView = new ModelAndView();
//		List<Application> applications = userService.getReceivedResourceTransferApplication(uid);
//		modelAndView.addObject("transferApplications", applications);
//		modelAndView.addObject("numOfApplications", applications.size());
		modelAndView.setViewName("/user/resourceTransferApplication");
		return modelAndView;
	}
	
	/**
	 * @return	��ȡ�û��յ����ʲ�ת������
	 */
	@RequestMapping("/getResourceTransferApplications")
	public @ResponseBody List<Application> getResourceTransferApplications(HttpSession session){
		String uid=(String)session.getAttribute("uid");
		List<Application> applications=userService.getReceivedResourceTransferApplication(uid);
		return applications;
	}

	/**
	 * @param session
	 * @param agree �Ƿ�ͬ����ܸ����ʲ�ת��
	 * @return ��������ʲ�ת������
	 */
	@RequestMapping("/dealTransferApplication")
	public @ResponseBody Map<String, Object> dealTransferApplication(HttpSession session,
			@RequestParam(value = "aId", required = true) int applicationId,
			@RequestParam(value = "accept", required = true) boolean accept,
			@RequestParam(value = "remark", required = false) String remark) {
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		//�ж������Ƿ��ѱ�����
		if(ListUtil.applicationContained(applicationId, userService.getReceivedResourceTransferApplication(uid))){
			map.put("applicationCompleted",false );
			//�û������ʲ�ת������
			if(accept){
				map.put("success", userService.acceptResourceTransferApplication(applicationId, uid));
			}else{//�û��ܾ��ʲ�ת������
				userService.refuseResourceTransferApplication(applicationId, uid, remark);
				map.put("success", true);
			}
		}else{
			map.put("applicationCompleted",true);
		}
		return map;
	}
}
