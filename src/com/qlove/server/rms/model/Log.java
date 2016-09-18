package com.qlove.server.rms.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.qlove.server.rms.util.TimeUtil;

/**
 * @author sunfan314
 *	id			��־��ʶ
 *	rid			�ʲ���ʶ
 *	owner		�ʲ�ӵ����
 *	startTime	��ʼʹ��ʱ��
 *	endTime		����ʹ��ʱ��
 *	remark		��ע��Ϣ
 */
@Entity
@Table(name="log")
public class Log {
	@Id
	private int id;
	
	private int rid;
	
	private String owner;
	
	private String startTime;
	
	private String endTime;
	
	private String remark;
	
	public Log(){
		super();
	}

	public Log(int rid, String owner, String remark) {
		super();
		this.rid = rid;
		this.owner = owner;
		this.startTime = TimeUtil.getCurrentTime();
		this.endTime = "";
		this.remark = remark;
	}



	public Log(int rid, String owner, String startTime, String remark) {
		super();
		this.rid = rid;
		this.owner = owner;
		this.startTime = startTime;
		this.endTime="";
		this.remark = remark;
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

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
