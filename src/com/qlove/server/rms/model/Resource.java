package com.qlove.server.rms.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.qlove.server.rms.util.ResourceStatusConfig;

/**
 * @author sunfan314 
 * id 			�ʲ���ʶ 
 * name 		�ʲ��� 
 * model 		�ʲ��ͺ� 
 * trackingNo 	�ʲ�׷���� 
 * trackingNo2	����豸׷����
 * IMEI 		�ƶ��豸��ʶ��
 * serialNo 	�ʲ����к� 
 * entryDate 	�ʲ�������� 
 * consumeDate	�ʲ�ʹ��ʱ��
 * owner 		�ʲ���ǰ�����ˣ��ڿ�ʱ������Ϊwarehouse��
 * status 		�ʲ�״̬��0�����ã�1���𻵣� 
 * remark 		��ע��Ϣ 
 * type 		�ʲ����
 * phoneNumber	�ֻ�����(��ֵ����ֵ�����SIM������)
 * purchaser	������
 * imsi			�ƶ��û���ʶ(SIM����ʶ)
 * pack			SIM���ײ�
 * password		�ʲ�����
 */
@Entity
@Table(name = "resource")
public class Resource {
	@Id
	private int id;

	private String name;

	private String model;

	private String trackingNo;
	
	private String trackingNo2;

	@Column(name = "IMEI")
	private String imei;

	private String serialNo;

	private String entryDate;
	
	@Transient
	private String consumeDate;

	private String owner;

	private int status;
	
	@Transient
	private String statusValue;

	private String remark;
	
	@ManyToOne(targetEntity=Type.class)
	@JoinColumn(name="type")
	private Type type;
	
	private String phoneNumber;
	
	private String purchaser;
	
	
	@Column(name="IMSI")
	private String imsi;
	
	@Column(name="package")
	private String pack;
	
	private String password;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getTrackingNo() {
		return trackingNo;
	}

	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
	}

	public String getTrackingNo2() {
		return trackingNo2;
	}

	public void setTrackingNo2(String trackingNo2) {
		this.trackingNo2 = trackingNo2;
	}

	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		this.imei = imei;
	}

	public String getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getConsumeDate() {
		return consumeDate;
	}

	public void setConsumeDate(String consumeDate) {
		this.consumeDate = consumeDate;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getStatusValue() {
		String temp="";
		switch (status) {
		case 0:
			temp=ResourceStatusConfig.RESOURCE_REGULAR;
			break;
		case 1:
			temp=ResourceStatusConfig.RESOURCE_DAMAGED;
			break;
		case 2:
			temp=ResourceStatusConfig.RESOURCE_USED;
			break;
		case 3:
			temp=ResourceStatusConfig.RESOURCE_LENDED;
			break;
		default:
			break;
		}
		return temp;
	}

	public void setStatusValue(String statusValue) {
		this.statusValue = statusValue;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPurchaser() {
		return purchaser;
	}

	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}

	public String getImsi() {
		return imsi;
	}

	public void setImsi(String imsi) {
		this.imsi = imsi;
	}

	public String getPack() {
		return pack;
	}

	public void setPack(String pack) {
		this.pack = pack;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


}
