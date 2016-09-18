package com.qlove.server.rms.controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qlove.server.rms.model.Resource;
import com.qlove.server.rms.model.Type;
import com.qlove.server.rms.service.AdminService;
import com.qlove.server.rms.service.ResourceService;
import com.qlove.server.rms.service.UserService;
import com.qlove.server.rms.util.ExcelUtil;
import com.qlove.server.rms.util.FileUtil;
import com.qlove.server.rms.util.LDAP;
import com.qlove.server.rms.util.TimeUtil;

@Controller("excelHelper")
@RequestMapping("/admin")
public class ExcelHelper {
	@javax.annotation.Resource
	private ResourceService resourceService;

	@javax.annotation.Resource
	private AdminService adminService;

	/**
	 * @return �����ʲ����뵼������
	 */
	@RequestMapping("excelHelper")
	public ModelAndView excelHelper() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/excelHelper");
		return modelAndView;
	}

	/**
	 * @param file
	 * @return �ϴ��ļ�������������������
	 */
	@RequestMapping("/uploadFile")
	public @ResponseBody Map<String, Object> uploadFile(
			@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(value = "type", required = true) int typeId, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		// �������ݴ洢�ļ�
		String filePath = session.getServletContext().getRealPath("/resources/excel");
		String desFileName = getFileName();
		File desFile = new File(filePath, desFileName);
		try {
			// ���û��ϴ���excel���ݿ��������������ݴ洢�ļ���
			file.transferTo(desFile);
			ExcelUtil excelUtil = new ExcelUtil();
			Type type = resourceService.getType(typeId);
			// �ӿ�����excel�ļ��ж�ȡ�ʲ�����
			List<Resource> list = excelUtil.readFromFile(filePath + FileUtil.SEPARATOR + desFileName, type);
			LDAP ldap = new LDAP();
			// ��ȡ�û��б�
			List<String> users = ldap.getUsers();
			// �����ʲ������쳣��־
			List<DataLog> dataLogs = new ArrayList<>();
			// �������ݼ���
			int count = 0;
			for (Resource resource : list) {
				//����д�ʲ�ӵ����Ĭ��������ʲ�ӵ����Ϊ�ֿ�
				if(resource.getOwner().equals("")){
					resource.setOwner("warehouse");
					adminService.addNewResource(resource);
					count++;
				}else{
					//�ж��û��Ƿ���LDAP��������
					if (users.contains(resource.getOwner())) {
						adminService.addNewResource(resource);
						count++;
					} else {
						DataLog dataLog = new DataLog(list.indexOf(resource) + 1, resource.getOwner());
						dataLogs.add(dataLog);
					}
				}
			}
			map.put("success", true);
			map.put("successCount", count);
			map.put("failCount", dataLogs.size());
			map.put("logs", dataLogs);
			return map;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("success", false);
			return map;
		}

	}

	/**
	 * @param typeId
	 * @param session
	 * @return	�����ʲ����ݵ�excel�ļ�
	 */
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> downloadFile(@RequestParam(value = "type", required = false) int typeId,
			HttpSession session){
		ExcelUtil excelUtil = new ExcelUtil();
		String filePath = session.getServletContext().getRealPath("/resources/exportExcel");
		Type type = resourceService.getType(typeId);
		List<Resource> resources = resourceService.getCompanyResources(typeId);
		try {
			File file = excelUtil.exportResource(filePath, type, resources);
			HttpHeaders headers = new HttpHeaders();
			String fileName = new String((type.getName()+".xlsx").getBytes("UTF-8"), "iso-8859-1");// Ϊ�˽������������������
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
	 * @param session
	 * @return ���ݵ���ģ������
	 */
	@RequestMapping("/downloadExcelTemplate")
	public ResponseEntity<byte[]> downloadExcelTemplate(HttpSession session){
		try {
			String filePath = session.getServletContext().getRealPath("/resources/excel-template");
			File file = new File(filePath+FileUtil.SEPARATOR+FileUtil.EXCEL_TEMPLATE_NAME);
			HttpHeaders headers = new HttpHeaders();
			String fileName = new String((FileUtil.EXCEL_TEMPLATE_NAME).getBytes("UTF-8"), "iso-8859-1");// Ϊ�˽������������������
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
	 * @return ���ݵ�ǰʱ�䴴��excel�ļ���
	 */
	private String getFileName() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String time = df.format(new Date());
		return "data" + "_" + time + ".xls";
	}

	// �쳣��־����¼����������excel���е�λ���Լ�������û���
	class DataLog {
		private int index;

		private String user;

		public DataLog() {
			super();
		}

		public DataLog(int index, String user) {
			super();
			this.index = index;
			this.user = user;
		}

		public int getIndex() {
			return index;
		}

		public void setIndex(int index) {
			this.index = index;
		}

		public String getUser() {
			return user;
		}

		public void setUser(String user) {
			this.user = user;
		}

	}
	

}
