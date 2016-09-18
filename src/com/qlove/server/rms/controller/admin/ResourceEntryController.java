package com.qlove.server.rms.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qlove.server.rms.model.Property;
import com.qlove.server.rms.model.Resource;
import com.qlove.server.rms.model.Type;
import com.qlove.server.rms.service.AdminService;
import com.qlove.server.rms.service.ResourceService;
import com.qlove.server.rms.service.UserService;
import com.qlove.server.rms.util.LDAP;
import com.qlove.server.rms.util.ResourceTypeConfig;
import com.qlove.server.rms.util.TimeUtil;

import junit.framework.Test;

@Controller("adminResourceEntryController")
@RequestMapping("/admin")
public class ResourceEntryController {
	@javax.annotation.Resource
	private UserService userService;
	
	@javax.annotation.Resource
	private AdminService adminService;
	
	@javax.annotation.Resource
	private ResourceService resourceService;
	
	/**
	 * @param session
	 * @return �¹��ʲ�������
	 */
	@RequestMapping("/resourceEntry")
	public ModelAndView resourceEntry(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("admin/resourceEntry");
		return modelAndView;
	}
	
	/**
	 * @return	����û��б������ֿ⣩
	 */
	@RequestMapping("/getUsers")
	public @ResponseBody List<Property> getUsers(){
		List<Property> list=new ArrayList<>();
		list.add(new Property("warehouse","�ֿ�"));
		list.addAll(userService.getUsers());
		return list;
	}
	
	/**
	 * @return	��ȡһ������б�
	 */
	@RequestMapping("/getFatherTypes")
	public @ResponseBody List<Type> getFatherTypes(){
		List<Type> list=new ArrayList<>();
		List<Type> types=resourceService.getResourceTypes();
		for (Type type : types) {
			if(type.getFatherType()==0){
				list.add(type);
			}
		}
		return list;
	}
	
	/**
	 * @param typeName
	 * @param fatherType
	 * @return	��������
	 */
	@RequestMapping("/addType")
	public @ResponseBody Map<String,Object> addType(String typeName,int fatherType){
		Map<String,Object> map=new HashMap<String,Object>();
		List<Type> types=resourceService.getResourceTypes();
		for (Type type : types) {
			if(type.getName().equals(typeName)&&type.getFatherType()==fatherType){
				map.put("success", false);
				return map;
			}
		}
		resourceService.addType(typeName, fatherType);
		map.put("success", true);
		return map;
	}
	

	/**
	 * @param session
	 * @param resource
	 * @return	����¹��ʲ�
	 */
	@RequestMapping("/enterNewResource")
	public @ResponseBody Map<String, Object> enterNewResource(Resource resource) {
		Map<String,Object> map=new HashMap<String,Object>();
		LDAP ldap=new LDAP();
		List<String> userList=ldap.getUsers();
		userList.add("warehouse");
		//����ʲ�ӵ�����Ƿ���ڣ���ֹ�ʲ�������������ڵ��û��������޷��ʲ��޷���ȡ
		if(userList.contains(resource.getOwner())){
			adminService.addNewResource(resource);
			map.put("success", true);
		}else{
			map.put("success",false);
		}
		return map;
	}
	
	/**
	 * @param request
	 * @return	��������ֵ��
	 */
	@RequestMapping("/enterPhoneCards")
	public @ResponseBody Map<String,Object> enterPhoneCards(HttpServletRequest request){
		Map<String,Object> map=new HashMap<>();
		int number=Integer.parseInt(request.getParameter("number"));
		String cardType=request.getParameter("cardType");
		String purchaser=request.getParameter("purchaser");
		String remark=request.getParameter("remark");
		Resource resource=new Resource();
		resource.setName(cardType);
		resource.setPurchaser(purchaser);
		resource.setRemark(remark);
		resource.setType(resourceService.getType(ResourceTypeConfig.PHONE_CARD));
		resource.setOwner("warehouse");
		resource.setEntryDate(TimeUtil.getCurrentTime());
		for(int i=0;i<number;i++){
			adminService.addNewResource(resource);
		}	
		map.put("success", true);
		return map;
	}
	
	/**
	 * @return	����û��б������ֿ⣩
	 */
	@RequestMapping("/test")
	public @ResponseBody List<Property> test(){
		List<Property> list=new ArrayList<>();
		list.add(new Property("warehouse","�ֿ�"));
		list.addAll(userService.getUsers());
		return list;
	}
	
	/**
	 * @param session
	 * @param resource
	 * @return	�޸��ʲ���Ϣ
	 */
	@RequestMapping("/editResource")
	public @ResponseBody Map<String,Object> editResource(HttpSession session,Resource resource){
		Map<String,Object> map=new HashMap<String,Object>();
		LDAP ldap=new LDAP();
		List<String> userList=ldap.getUsers();
		userList.add("warehouse");
		//����ʲ�ӵ�����Ƿ���ڣ���ֹ�ʲ�������������ڵ��û��������޷��ʲ��޷���ȡ
		if(userList.contains(resource.getOwner())){
			adminService.editResource(resource);
			map.put("success", true);
		}else{
			map.put("success",false);
		}
		return map;
	}
	

}
