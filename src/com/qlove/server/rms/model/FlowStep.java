package com.qlove.server.rms.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author sunfan314 flowId ���̱�ʶ step ���̲��� group �û�Ⱥ�� remark ���̱�ע��Ϣ
 */
@Entity
@Table(name = "flow_step")
@IdClass(com.qlove.server.rms.model.FlowStepPK.class)
public class FlowStep {
	@Id
	private int flowId;
	@Id
	private int step;
	
	@ManyToOne(targetEntity=com.qlove.server.rms.model.Group.class) 
	@JoinColumn(name="userGroup")
	private Group group;

	private String remark;

	public int getFlowId() {
		return flowId;
	}

	public void setFlowId(int flowId) {
		this.flowId = flowId;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
