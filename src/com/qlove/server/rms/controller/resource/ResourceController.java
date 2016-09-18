package com.qlove.server.rms.controller.resource;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qlove.server.rms.model.Resource;
import com.qlove.server.rms.model.ResourceFile;
import com.qlove.server.rms.service.ResourceService;
import com.qlove.server.rms.util.FileUtil;

@Controller("resourceController")
@RequestMapping("/resource")
public class ResourceController {
	@javax.annotation.Resource
	private ResourceService resourceService;

	/**
	 * @param rid
	 * @return �����ʲ�����ҳ����Ϣ
	 */
	@RequestMapping("/resourceInfo")
	public ModelAndView getResourceInfo(int rid) {
		Resource resource = resourceService.getResource(rid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("resource", resource);
		modelAndView.setViewName("resource/resourceInfo");
		return modelAndView;

	}

	/**
	 * @param type
	 * @return ��ȡ������
	 */
	@RequestMapping("/getFatherType")
	public @ResponseBody Map<String, Object> getFatherType(int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fatherType", resourceService.getFatherType(type));
		return map;
	}

	/**
	 * @param rid
	 * @return �����ʲ�����ҳ��
	 */
	@RequestMapping("/resourceFiles")
	public ModelAndView resourceFiles(int rid, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("resource/resourceFiles");
		modelAndView.addObject("uid", session.getAttribute("uid"));
		modelAndView.addObject("rid", rid);
		return modelAndView;
	}

	/**
	 * @param rid
	 * @return ���ض�Ӧ�ʲ��ĸ�����Ϣ
	 */
	@RequestMapping("/getResourceFiles")
	public @ResponseBody List<ResourceFile> getResourceFiles(int rid) {
		return resourceService.getResourceFiles(rid);
	}

	/**
	 * @param file
	 * @param rid
	 * @param remark
	 * @param session
	 * @return �ļ��ϴ�
	 */
	@RequestMapping("/uploadFile")
	public @ResponseBody Map<String, Object> uploadFile(MultipartFile file, int rid, String remark,
			HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		String filePath = session.getServletContext().getRealPath("/resources/resource-file/" + rid);
		//�ж��ļ����Ƿ���ڣ�����������򴴽��ļ���
		File fileFolder=new File(filePath);
		if(!fileFolder.exists()&&!fileFolder.isDirectory()){
			fileFolder.mkdir();
		}
		String desFileName = file.getOriginalFilename();
		File desFile = new File(filePath, desFileName);
		//�����ļ���ʾ�û��޸��ļ���
		if(desFile.exists()){
			map.put("success", false);
			map.put("msg","Same Filename");
			return map;
		}
		// ���û��ϴ����ļ����������������ݴ洢�ļ���
		try {
			file.transferTo(desFile);
			resourceService.addResourceFile(rid, file.getOriginalFilename(), session.getAttribute("uid").toString(), remark);;
		} catch(Exception e){
			e.printStackTrace();
			map.put("success", false);
			return map;
		}
		map.put("success", true);
		return map;
	}

	/**
	 * @param id
	 * @param session
	 * @return �ļ�����
	 */
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> downloadFile(int id, HttpSession session) {
		ResourceFile resourceFile = resourceService.getResourceFile(id);
		try {
			String filePath = session.getServletContext()
					.getRealPath("resources/resource-file/" + resourceFile.getRid());
			File file = new File(filePath + FileUtil.SEPARATOR + resourceFile.getFileName());
			HttpHeaders headers = new HttpHeaders();
			String fileName = new String((resourceFile.getFileName()).getBytes("UTF-8"), "iso-8859-1");// Ϊ�˽������������������
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @param id
	 * @param session
	 * @return	ɾ���ļ�
	 */
	@RequestMapping("/deleteFile")
	public @ResponseBody Map<String,Object> deleteFile(int id,HttpSession session){
		Map<String, Object> map=new HashMap<>();
		ResourceFile resourceFile=resourceService.getResourceFile(id);
		String filePath=session.getServletContext()
				.getRealPath("resources/resource-file/" + resourceFile.getRid());
		File file=new File(filePath+FileUtil.SEPARATOR+resourceFile.getFileName());
		//ɾ���ļ�
		if(file.exists()){
			file.delete();
		}
		resourceService.deleteResourceFile(id);
		map.put("success", true);
		return map;
	}

}
