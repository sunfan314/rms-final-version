package com.qlove.server.rms.service;

import java.util.List;

import com.qlove.server.rms.model.Application;
import com.qlove.server.rms.model.Property;
import com.qlove.server.rms.model.PurchaseApplication;
import com.qlove.server.rms.model.Resource;

public interface AdminService {
	
	/**
	 * ����¹��ʲ�
	 * @param resource
	 */
	public void addNewResource(Resource resource);
	
	/**	
	 * �޸��ʲ���Ϣ
	 * @param resource
	 */
	public void editResource(Resource resource);
	
	/**
	 * @return	��ȡ�ʲ����������б�
	 */
	public List<Application> getResourceAllocationApplications();
	
	/**
	 * @return	��ȡ�ʲ����������б�
	 */
	public List<Application> getResourceCallbackApplications();
	
	/**
	 * @return	��ȡ�ʲ����������б�
	 */
	public List<PurchaseApplication> getResourcePurchaseApplications();
	
	
	/**
	 * @param applicationId
	 * @param uid
	 * @return	��׼�ʲ���������
	 */
	public boolean agreeResourceAllocationApplication(int applicationId,String uid);
	
	/**
	 * �ܾ��ʲ���������
	 * @param applicationId
	 * @param uid
	 * @param remark
	 */
	public void refuseResourceAllocationApplication(int applicationId,String uid,String remark);
	
	/**
	 * @param applicationId
	 * @param uid
	 * @return	�ʲ��������
	 */
	public boolean agreeResourceCallbackApplication(int applicationId,String uid);
	
	/**
	 * �ܾ��ʲ������������
	 * @param applicationId
	 * @param uid
	 * @param remark
	 */
	public void refuseResourceCallbackApplication(int applicationId,String uid,String remark);
	
	/**
	 * ͬ���ʲ���������
	 * @param applicationId
	 * @param uid
	 */
	public void agreeResourcePurchaseApplication(int applicationId,String uid);
	
	/**
	 * �ܾ��ʲ���������
	 * @param applicationId
	 * @param uid
	 * @param remark
	 */
	public void refuseResourcePurchaseApplication(int applicationId,String uid,String remark);

}
