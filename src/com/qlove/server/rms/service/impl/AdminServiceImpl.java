package com.qlove.server.rms.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.qlove.server.rms.dao.BaseDao;
import com.qlove.server.rms.model.Application;
import com.qlove.server.rms.model.ApplicationApproval;
import com.qlove.server.rms.model.Log;
import com.qlove.server.rms.model.Property;
import com.qlove.server.rms.model.PurchaseApplication;
import com.qlove.server.rms.model.PurchaseApplicationApproval;
import com.qlove.server.rms.model.Resource;
import com.qlove.server.rms.model.Type;
import com.qlove.server.rms.service.AdminService;
import com.qlove.server.rms.service.FlowService;
import com.qlove.server.rms.service.MailService;
import com.qlove.server.rms.service.ResourceService;
import com.qlove.server.rms.util.ApplicationFlowConfig;
import com.qlove.server.rms.util.ApplicationTypeConfig;
import com.qlove.server.rms.util.ResourceTypeConfig;
import com.qlove.server.rms.util.TimeUtil;
import com.qlove.server.rms.util.UserGroupConfig;

@Service("adminService")
@SuppressWarnings("all")
public class AdminServiceImpl implements AdminService {
	@javax.annotation.Resource
	private BaseDao baseDao;

	@javax.annotation.Resource
	private FlowService flowService;

	@javax.annotation.Resource
	private ResourceService resourceService;
	
	@javax.annotation.Resource 
	private MailService mailService;

	@Override
	public void addNewResource(Resource resource) {
		// TODO Auto-generated method stub
		int id;
		if(baseDao.find("from Resource").size()==0){
			//���ݿ���û���ʲ�����ʱ����һ����ӵ��ʲ�id����Ϊ1
			id=1;
		}else{
			//��ȡ���id
			List<Integer> list=baseDao.find("select max(id) from Resource");
			id=list.get(0)+1;
		}
		resource.setId(id);
		baseDao.save(resource);
		Log log=new Log(id, resource.getOwner(), resource.getEntryDate(), resource.getRemark());
		baseDao.save(log);
		
	}

	@Override
	public void editResource(Resource resource) {
		// TODO Auto-generated method stub
		baseDao.update(resource);
	}

	@Override
	public List<Application> getResourceAllocationApplications() {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<>();
		params.add(ApplicationTypeConfig.APPLY_RESOURCE);
		params.add(flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.ADMIN));
		params.add(0);// ����δ����
		List<Application> list = baseDao.find("from Application where type = ? and step = ? and finished = ?", params);
		return setApplicationResource(list);// Ϊ����󶨶�Ӧ���ʲ���Ϣ
	}

	@Override
	public List<Application> getResourceCallbackApplications() {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<>();
		params.add(ApplicationTypeConfig.RETURN_RESOURCE);
		params.add(flowService.getStepInFlow(ApplicationFlowConfig.ADMIN_FLOW, UserGroupConfig.ADMIN));
		params.add(0);// ����δ����
		List<Application> list = baseDao.find("from Application where type = ? and step = ? and finished = ?", params);
		return setApplicationResource(list);// Ϊ����󶨶�Ӧ���ʲ���Ϣ
	}

	@Override
	public List<PurchaseApplication> getResourcePurchaseApplications() {
		// TODO Auto-generated method stub
		List<Object> params=new ArrayList<>();
		params.add(flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.ADMIN));
		params.add(0);//����δ����
		return baseDao.find("from PurchaseApplication where step = ? and finished = ?", params);
	}

	@Override
	public boolean agreeResourceAllocationApplication(int applicationId, String uid) {
		// TODO Auto-generated method stub
		Application application = (Application) baseDao.get(Application.class, applicationId);
		Resource resource = (Resource) baseDao.get(Resource.class, application.getRid());
		// �ж��ʲ��Ƿ��ڿ�
		if (resourceService.ifResourceOwner(resource.getId(), application.getOwner())) {
			int step = flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.ADMIN);
			ApplicationApproval approval = new ApplicationApproval(applicationId, step, uid, 0, "");
			baseDao.save(approval);// ������������Ϣ

			application.setFinished(1);
			baseDao.update(application);// �����ʲ���������

			resource.setOwner(application.getReceiver());
			//�����ֻ���ֵ��������Ʒ�����÷������ʱ�ʲ�״̬Ϊ������
			Type type=resource.getType();
			if(type.getId()==ResourceTypeConfig.PHONE_CARD||type.getFatherType()==ResourceTypeConfig.CONSUMABLE){
				resource.setStatus(2);
			}
			baseDao.update(resource);// �޸��ʲ�ӵ����״̬

			List<Object> params = new ArrayList<>();
			params.add(resource.getId());
			params.add(application.getOwner());
			params.add("");
			Log lastLog = (Log) baseDao.get("from Log where rid = ? and owner = ? and endTime = ?", params);
			lastLog.setEndTime(TimeUtil.getCurrentTime());
			baseDao.update(lastLog);// �޸��ʲ�ʹ����־��Ϣ

			Log nextLog = new Log(resource.getId(), application.getReceiver(), application.getRemark());
			baseDao.save(nextLog);// �����ʲ�ʹ����־��Ϣ
			
			//�����ʼ������߳�
			final Application temp_application=application;
			final ApplicationApproval temp_approval=approval;
			Thread thread = new Thread(new Runnable() {
				public void run() {
					mailService.sendProcessAgreeMail(ApplicationTypeConfig.APPLY_RESOURCE, UserGroupConfig.ADMIN, temp_approval, temp_application.getReceiver());
				}
			});
			thread.start();

			return true;

		} else {
			return false;
		}
	}

	@Override
	public void refuseResourceAllocationApplication(int applicationId, String uid, String remark) {
		// TODO Auto-generated method stub
		int step=flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.ADMIN);
		ApplicationApproval approval=new ApplicationApproval(applicationId, step, uid, 1, remark);
		baseDao.save(approval);//������������Ϣ
		
		Application application=(Application)baseDao.get(Application.class, applicationId);
		application.setFinished(1);
		application.setRefused(1);
		baseDao.update(application);//�����ʲ�ת������
			
		//�����ʼ������߳�
		final Application temp_application=application;
		final ApplicationApproval temp_approval=approval;
		Thread thread = new Thread(new Runnable() {
			public void run() {
				mailService.sendProcessRefuseMail(ApplicationTypeConfig.APPLY_RESOURCE, UserGroupConfig.ADMIN, temp_approval, temp_application.getReceiver());
			}
		});
		thread.start();
	}
	
	@Override
	public boolean agreeResourceCallbackApplication(int applicationId, String uid) {
		// TODO Auto-generated method stub
		Application application = (Application) baseDao.get(Application.class, applicationId);
		Resource resource = (Resource) baseDao.get(Resource.class, application.getRid());
		// �ж��ʲ��Ƿ������ʲ�����������
		if (resourceService.ifResourceOwner(resource.getId(), application.getOwner())) {
			int step = flowService.getStepInFlow(ApplicationFlowConfig.ADMIN_FLOW, UserGroupConfig.ADMIN);
			ApplicationApproval approval = new ApplicationApproval(applicationId, step, uid, 0, "");
			baseDao.save(approval);// ������������Ϣ

			application.setFinished(1);
			baseDao.update(application);// �����ʲ�ת������

			resource.setOwner(application.getReceiver());
			baseDao.update(resource);// �޸��ʲ�ӵ����״̬

			List<Object> params = new ArrayList<>();
			params.add(resource.getId());
			params.add(application.getOwner());
			params.add("");
			Log lastLog = (Log) baseDao.get("from Log where rid = ? and owner = ? and endTime = ?", params);
			lastLog.setEndTime(TimeUtil.getCurrentTime());
			baseDao.update(lastLog);// �޸��ʲ�ʹ����־��Ϣ

			Log nextLog = new Log(resource.getId(), application.getReceiver(), application.getRemark());
			baseDao.save(nextLog);// �����ʲ�ʹ����־��Ϣ
			
			//�����ʼ������߳�
			final Application temp_application=application;
			final ApplicationApproval temp_approval=approval;
			Thread thread = new Thread(new Runnable() {
				public void run() {
					mailService.sendProcessAgreeMail(ApplicationTypeConfig.RETURN_RESOURCE, UserGroupConfig.ADMIN, temp_approval, temp_application.getOwner());
				}
			});
			thread.start();

			return true;

		} else {
			return false;
		}
	}

	@Override
	public void refuseResourceCallbackApplication(int applicationId, String uid, String remark) {
		// TODO Auto-generated method stub
		int step=flowService.getStepInFlow(ApplicationFlowConfig.ADMIN_FLOW, UserGroupConfig.ADMIN);
		ApplicationApproval approval=new ApplicationApproval(applicationId, step, uid, 1, remark);
		baseDao.save(approval);//������������Ϣ
		
		Application application=(Application)baseDao.get(Application.class, applicationId);
		application.setFinished(1);
		application.setRefused(1);
		baseDao.update(application);//�����ʲ�ת������
		
		//�����ʼ������߳�
		final Application temp_application=application;
		final ApplicationApproval temp_approval=approval;
		Thread thread = new Thread(new Runnable() {
			public void run() {
				mailService.sendProcessRefuseMail(ApplicationTypeConfig.RETURN_RESOURCE, UserGroupConfig.ADMIN, temp_approval, temp_application.getOwner());
			}
		});
		thread.start();
	}
	
	@Override
	public void agreeResourcePurchaseApplication(int applicationId, String uid) {
		// TODO Auto-generated method stub
		int step=flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.ADMIN);
		PurchaseApplicationApproval approval=new PurchaseApplicationApproval(applicationId, step, uid, 0, "");
		baseDao.save(approval);//��������Ϣ
		
		PurchaseApplication application=(PurchaseApplication)baseDao.get(PurchaseApplication.class, applicationId);
		application.setFinished(1);
		baseDao.update(application);//�޸�������Ϣ�����̽�����һ��
		
		//�����ʼ��߳�
		final PurchaseApplication temp_application=application;
		final PurchaseApplicationApproval temp_approval=approval;
		Thread thread = new Thread(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				mailService.sendPurchaseApplicationProcessMail(UserGroupConfig.ADMIN, true, temp_approval, temp_application.getUser());
			}
		});
		thread.start();
		
	}

	@Override
	public void refuseResourcePurchaseApplication(int applicationId, String uid, String remark) {
		// TODO Auto-generated method stub
		int step=flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.ADMIN);
		PurchaseApplicationApproval approval=new PurchaseApplicationApproval(applicationId, step, uid, 1, remark);
		baseDao.save(approval);//��������Ϣ
		
		PurchaseApplication application=(PurchaseApplication)baseDao.get(PurchaseApplication.class, applicationId);
		application.setFinished(1);
		application.setRefused(1);
		baseDao.update(application);//�����ʲ���������
		
		//�����ʼ��߳�
		final PurchaseApplication temp_application=application;
		final PurchaseApplicationApproval temp_approval=approval;
		Thread thread = new Thread(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				mailService.sendPurchaseApplicationProcessMail(UserGroupConfig.ADMIN, false, temp_approval, temp_application.getUser());
			}
		});
		thread.start();
	}

	/**
	 * ���������Ӧ���ʲ���Ϣ
	 * 
	 * @param list
	 */
	private List<Application> setApplicationResource(List<Application> list) {
		for (Application application : list) {
			Resource resource = (Resource) baseDao.get(Resource.class, application.getRid());
			application.setResource(resource);
			application.setResourceName(resource.getName());
		}
		return list;
	}


}
