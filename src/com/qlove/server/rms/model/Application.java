package com.qlove.server.rms.model;


import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.qlove.server.rms.util.TimeUtil;

/**
 * @author sunfan314
 *	id			�����ʶ
 *	rid			�ʲ���ʶ
 *	owner		�ʲ�ӵ����
 *	receiver	�ʲ�������
 *	remark		���뱸ע��Ϣ
 *	time		����ʱ��
 *	type		�������ͣ�0���ڿ��ʲ����룻1�������ʲ�ת�ƣ�2�������ʲ��黹��
 *	flow		��������
 *	step		�����������̲���(��ʼΪ��һ��)
 *	finished	�����Ƿ������0��ʾδ������1��ʾ������
 *	refused		�����Ƿ񱻾ܾ���0��ʾδ���ܾ���1��ʾ���ܾ���
 */	
@Entity
@Table(name="application")
public class Application {
	@Id
	private int id;
	
	private int rid;
	
	private String owner;
	
	private String receiver;
	
	private String remark;
	
	private String time;
	
	private int type;
	
	@ManyToOne(targetEntity=com.qlove.server.rms.model.Flow.class)
	@JoinColumn(name="flow")
	private Flow flow;
	
	private int step;
	
	private int finished;
	
	private int refused;
	
	@OneToMany
	@JoinColumn(name="application_id")
	private List<ApplicationApproval> approvals;
	
	@Transient
	private Resource resource;
	
	@Transient
	private String resourceName;
	
	@Transient
	private String status;
	
	public Application(){
		super();
		this.time=TimeUtil.getCurrentTime();
	}
	
	public Application(int rid,String owner,String receiver,String remark,int type){
		super();
		this.rid=rid;
		this.owner=owner;
		this.receiver=receiver;
		this.remark=remark;
		this.type=type;
		this.step=1;
		this.finished=0;
		this.refused=0;
		this.time=TimeUtil.getCurrentTime();
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

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Flow getFlow() {
		return flow;
	}

	public void setFlow(Flow flow) {
		this.flow = flow;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getFinished() {
		return finished;
	}

	public void setFinished(int finished) {
		this.finished = finished;
	}

	public int getRefused() {
		return refused;
	}

	public void setRefused(int refused) {
		this.refused = refused;
	}

	public List<ApplicationApproval> getApprovals() {
		return approvals;
	}

	public void setApprovals(List<ApplicationApproval> approvals) {
		this.approvals = approvals;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getStatus() {
		if (this.finished == 1) {//�������
			if (this.refused == 0) {
				return "����ͨ��";
			} else if (this.refused == 1) {
				return "����ܾ�";
			}
		} else if (this.finished == 0) {//������δ����
			if (this.step == 1) {
				return "��δ���";
			} else {
				return "�������";
			}
		}
		return "";
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
