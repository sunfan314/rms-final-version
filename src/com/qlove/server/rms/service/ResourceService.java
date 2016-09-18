package com.qlove.server.rms.service;

import java.util.List;

import com.qlove.server.rms.model.Log;
import com.qlove.server.rms.model.Resource;
import com.qlove.server.rms.model.ResourceFile;
import com.qlove.server.rms.model.Type;

/**
 * @author sunfan314
 *
 */
public interface ResourceService {
	
	/**
	 * @param rid
	 * @param uid
	 * @return	�鿴�û��Ƿ�Ϊ�ʲ���ǰӵ����
	 */
	public boolean ifResourceOwner(int rid,String uid);
	
	/**
	 * @param rid
	 * @return	�鿴�ʲ��Ƿ��ڿ���״̬
	 */
	public boolean isResourceAvailable(int rid);
	
	/**
	 * @param typeId
	 * @return	��������Id��ȡ����
	 */
	public Type getType(int typeId);
	
	/**
	 * @return	��ȡ�ʲ�����б�
	 */
	public List<Type> getResourceTypes();
	
	/**	
	 * ��������
	 * @param typeName
	 * @param fatherType
	 */
	public void addType(String typeName,int fatherType);
	
	
	/**
	 * @param type
	 * @return	��ȡ��ҵĳ���ʲ��б�
	 */
	public List<Resource> getCompanyResources(int type);
	
	/**
	 * @param type
	 * @return	��ȡ��ҵĳ������ڿⲢ��״̬�������ʲ��б�
	 */
	public List<Resource> getAvailableResources(int type);
	
	/**
	 * @return ��ȡ���ڱ�������ʲ�id�б�
	 */
	public List<Integer> getApplingResources();
	
	/**
	 * @param uid
	 * @return	��ȡ�����ʲ��б�
	 */
	public List<Resource> getPersonalResources(String uid);
	
	/**
	 * @param rid
	 * @return	��ȡ�ʲ�ʹ�ü�¼�б�
	 */
	public List<Log> getResourceLogs(int rid);
	
	/**
	 * @param rid
	 * @return	�����ʲ���ʶ��ȡ�ʲ���Ϣ
	 */
	public Resource getResource(int rid);
	
	
	/**
	 * @param type
	 * @return	��ȡ���ĸ����
	 */
	public int getFatherType(int type);
	
	/**
	 * @param rid
	 * @return	��ȡ�ʲ��ĸ����б�
	 */
	public List<ResourceFile> getResourceFiles(int rid);
	
	/**
	 * @param id	
	 * @return	����id��ȡ�ʲ��ļ���Ϣ
	 */
	public ResourceFile getResourceFile(int id);
	
	/**
	 * �����ݿ�����ʲ��ļ���Ϣ
	 * @param rid
	 * @param fileName
	 * @param remark
	 */
	public void addResourceFile(int rid,String fileName,String uploader,String remark);
	
	/**
	 * �����ݿ�ɾ���ļ���Ϣ
	 * @param id
	 */
	public void deleteResourceFile(int id);
}
