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
	 * @return 返回资产详情页面信息
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
	 * @return 获取类别父类别
	 */
	@RequestMapping("/getFatherType")
	public @ResponseBody Map<String, Object> getFatherType(int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fatherType", resourceService.getFatherType(type));
		return map;
	}

	/**
	 * @param rid
	 * @return 返回资产附件页面
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
	 * @return 返回对应资产的附件信息
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
	 * @return 文件上传
	 */
	@RequestMapping("/uploadFile")
	public @ResponseBody Map<String, Object> uploadFile(MultipartFile file, int rid, String remark,
			HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		String filePath = session.getServletContext().getRealPath("/resources/resource-file/" + rid);
		//判断文件夹是否存在，如果不存在则创建文件夹
		File fileFolder=new File(filePath);
		if(!fileFolder.exists()&&!fileFolder.isDirectory()){
			fileFolder.mkdir();
		}
		String desFileName = file.getOriginalFilename();
		File desFile = new File(filePath, desFileName);
		//重名文件提示用户修改文件名
		if(desFile.exists()){
			map.put("success", false);
			map.put("msg","Same Filename");
			return map;
		}
		// 将用户上传的文件拷贝至创建的数据存储文件中
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
	 * @return 文件下载
	 */
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> downloadFile(int id, HttpSession session) {
		ResourceFile resourceFile = resourceService.getResourceFile(id);
		try {
			String filePath = session.getServletContext()
					.getRealPath("resources/resource-file/" + resourceFile.getRid());
			File file = new File(filePath + FileUtil.SEPARATOR + resourceFile.getFileName());
			HttpHeaders headers = new HttpHeaders();
			String fileName = new String((resourceFile.getFileName()).getBytes("UTF-8"), "iso-8859-1");// 为了解决中文名称乱码问题
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
	 * @return	删除文件
	 */
	@RequestMapping("/deleteFile")
	public @ResponseBody Map<String,Object> deleteFile(int id,HttpSession session){
		Map<String, Object> map=new HashMap<>();
		ResourceFile resourceFile=resourceService.getResourceFile(id);
		String filePath=session.getServletContext()
				.getRealPath("resources/resource-file/" + resourceFile.getRid());
		File file=new File(filePath+FileUtil.SEPARATOR+resourceFile.getFileName());
		//删除文件
		if(file.exists()){
			file.delete();
		}
		resourceService.deleteResourceFile(id);
		map.put("success", true);
		return map;
	}

}
