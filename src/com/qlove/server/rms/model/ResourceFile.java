package com.qlove.server.rms.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.qlove.server.rms.util.TimeUtil;

/**
 * @author sunfan314
 * 资产附件
 * id			文件标识
 * rid			资产标识
 * fileName		文件名
 * remark		备注信息
 * uploader		上传人
 * uploadTime	上传时间
 */
@Entity
@Table(name="resource_file")
public class ResourceFile {
	@Id
	private int id;
	
	private int rid;
	
	private String fileName;
	
	private String remark;
	
	private String uploader;
	
	private String uploadTime;
	
	public ResourceFile(){
		super();
	}
	
	public ResourceFile(int rid,String fileName,String remark,String uploader){
		super();
		this.uploadTime=TimeUtil.getCurrentTime();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUploader() {
		return uploader;
	}

	public void setUploader(String uploader) {
		this.uploader = uploader;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}
	
	

}
