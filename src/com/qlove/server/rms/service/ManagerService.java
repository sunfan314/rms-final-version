package com.qlove.server.rms.service;

import java.util.List;

import com.qlove.server.rms.model.Application;
import com.qlove.server.rms.model.PurchaseApplication;

public interface ManagerService {
	
	/**
	 * @return	��ȡ�ʲ����������б�
	 */
	public List<Application> getResourceAllocationApplications();
	
	/**
	 * @return	��ȡ�ʲ����������б�
	 */
	public List<PurchaseApplication> getResourcePurchaseApplications();
	
	
	/**
	 * @param applicationId
	 * @param uid
	 * @return	������׼�ʲ���������
	 */
	public void agreeResourceAllocationApplication(int applicationId,String uid);
	
	/**
	 * @param request
	 * ��׼�ʲ���������
	 */
	public void agreeResourcePurchaseApplication(int applicationId,String uid);
	
	
	/**
	 * @param applicationId
	 * @param uid
	 * @param remark
	 */
	public void refuseResourceAllocationApplication(int applicationId,String uid,String remark);
	
	/**
	 * @param request
	 * �ܾ��ʲ���������
	 */
	public void refuseResourcePurchaseApplication(int applicationId,String uid,String remark);

}
