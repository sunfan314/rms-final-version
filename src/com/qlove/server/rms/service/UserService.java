package com.qlove.server.rms.service;

import java.util.List;

import com.qlove.server.rms.model.Application;
import com.qlove.server.rms.model.Property;
import com.qlove.server.rms.model.PurchaseApplication;


public interface UserService {
	
	/**
	 * @param uid
	 * @param password
	 * @return	�û������֤
	 */
	public boolean login(String uid,String password);
	
	/**
	 * @param uid
	 * @return	��ȡ�û�Ȩ��
	 */
	public int getUserAuthority(String uid);
	
	
	/**
	 * @return	��ȡӵ���ʲ����û��б�
	 */
	public List<String> getUserWithResources();

	/**
	 * @return	��ȡ�����û�
	 */
	public List<Property> getUsers();
	
	/**
	 * @param uid
	 * @return	��ȡ�����û�����ȥĳ���û�uid��
	 */
	public List<Property> getUsers(String uid);
	
	/**
	 * @param rid
	 * @param uid
	 * @param remark
	 * @return	�����ʲ���������
	 */
	public boolean createResourceApplyApplication(int rid,String uid,String remark);
	
	/**
	 * @param rid
	 * @param uid	��������
	 * @param receiver
	 * @param remark
	 * @return	�����ʲ�ת������
	 */
	public boolean createResourceTransferApplication(int rid,String uid,String receiver,String remark);
	
	/**
	 * @param rid	�ʲ���ʶ
	 * @param uid	��������
	 * @return	�����ʲ��黹����
	 */
	public boolean createResourceReturnApplication(int rid,String uid,String remark);
	
	/**
	 * �����ʲ���������
	 * @param application
	 */
	public void createResourcePurchaseApplication(PurchaseApplication application);
	
	/**
	 * @param applicationId
	 * @return	��ȡ�������ϸ��Ϣ
	 */
	public Application getApplicationInfo(int applicationId);
	
	/**
	 * @param applicationId
	 * @return	��ȡ�����������ϸ��Ϣ
	 */
	public PurchaseApplication getPurchaseApplicationInfo(int applicationId);
	
	/**
	 * @param uid
	 * @return	����û�������ʲ��������루�����Ѵ����δ����ģ�
	 */
	public List<Application> getResourceApplyApplications(String uid);
	
	/**
	 * @param uid
	 * @return	����û�������ʲ�ת������
	 */
	public List<Application> getResourceTransferApplications(String uid);
	
	/**
	 * @param uid
	 * @return	����û�������ʲ��黹���루�����Ѵ����δ����ģ�
	 */
	public List<Application> getResourceReturnApplications(String uid);
	
	/**
	 * @param uid
	 * @return	����û��յ����ʲ�ת�����루δ����ģ�
	 */
	public List<Application> getReceivedResourceTransferApplication(String uid);
	
	/**
	 * @param uid
	 * @return	����û�������ʲ���������
	 */
	public List<PurchaseApplication> getResourcePurchaseApplications(String uid);
	
	/**
	 * @param applicationId
	 * @param uid
	 * @return	�����ʲ�ת������
	 */
	public boolean acceptResourceTransferApplication(int applicationId,String uid);
	
	
	/**
	 * �ܾ��ʲ�ת������
	 * @param applicationId
	 * @param uid
	 * @param remark
	 */
	public void refuseResourceTransferApplication(int applicationId,String uid,String remark);
	
	


}
