package com.qlove.server.rms.service.impl;

import java.util.ArrayList;
import java.util.List;



import org.springframework.stereotype.Service;

import com.qlove.server.rms.dao.BaseDao;
import com.qlove.server.rms.model.Application;
import com.qlove.server.rms.model.ApplicationApproval;
import com.qlove.server.rms.model.PurchaseApplication;
import com.qlove.server.rms.model.PurchaseApplicationApproval;
import com.qlove.server.rms.model.Resource;
import com.qlove.server.rms.model.Type;
import com.qlove.server.rms.service.FlowService;
import com.qlove.server.rms.service.MailService;
import com.qlove.server.rms.service.ManagerService;
import com.qlove.server.rms.util.ApplicationFlowConfig;
import com.qlove.server.rms.util.ApplicationTypeConfig;
import com.qlove.server.rms.util.LDAP;
import com.qlove.server.rms.util.UserGroupConfig;

@Service("managerService")
@SuppressWarnings("all")
public class ManagerServiceImpl implements ManagerService{
	@javax.annotation.Resource
	private BaseDao baseDao;
	
	@javax.annotation.Resource
	private FlowService flowService;
	
	@javax.annotation.Resource
	private MailService mailService;

	@Override
	public List<Application> getResourceAllocationApplications() {
		// TODO Auto-generated method stub
		List<Object> params=new ArrayList<>();
		params.add(ApplicationTypeConfig.APPLY_RESOURCE);
		params.add(flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.MANAGER));
		params.add(0);//����δ����
		List<Application> list=baseDao.find("from Application where type = ? and step = ? and finished = ?",params);
		return setApplicationResource(list);//Ϊ����󶨶�Ӧ���ʲ���Ϣ
	}

	@Override
	public List<PurchaseApplication> getResourcePurchaseApplications() {
		// TODO Auto-generated method stub
		List<Object> params=new ArrayList<>();
		params.add(flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.MANAGER));
		params.add(0);//����δ����
		return baseDao.find("from PurchaseApplication where step = ? and finished = ?", params);
	}

	@Override
	public void agreeResourceAllocationApplication(int applicationId,String uid) {
		// TODO Auto-generated method stub
		int step=flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.MANAGER);
		ApplicationApproval approval=new ApplicationApproval(applicationId, step, uid, 0, "");
		baseDao.save(approval);//��������Ϣ
		
		Application application=(Application)baseDao.get(Application.class, applicationId);
		application.setStep(step+1);
		baseDao.update(application);//�޸�������Ϣ�����̽�����һ��
		
		//���������ʼ��߳�
		final Application temp_application=application;
		final ApplicationApproval temp_approval=approval;
		Thread thread=new Thread(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				//�����Ա�����ʼ�
				LDAP ldap=new LDAP();
				mailService.sendApplicationMail(ApplicationTypeConfig.APPLY_RESOURCE, temp_application, ldap.getAdmins());
				mailService.sendProcessAgreeMail(ApplicationTypeConfig.APPLY_RESOURCE, UserGroupConfig.MANAGER, temp_approval, temp_application.getReceiver());
			}
		});
		thread.start();
	
	}

	@Override
	public void agreeResourcePurchaseApplication(int applicationId,String uid) {
		// TODO Auto-generated method stub
		int step=flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.MANAGER);
		PurchaseApplicationApproval approval=new PurchaseApplicationApproval(applicationId, step, uid, 0, "");
		baseDao.save(approval);//��������Ϣ
		
		PurchaseApplication application=(PurchaseApplication)baseDao.get(PurchaseApplication.class, applicationId);
		application.setStep(step+1);
		baseDao.update(application);//�޸�������Ϣ�����̽�����һ��
		
		//���������ʼ��߳�
		final PurchaseApplication temp_application=application;
		final PurchaseApplicationApproval temp_approval=approval;
		Thread thread=new Thread(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				//�����Ա�����ʼ�
				LDAP ldap=new LDAP();	
				mailService.sendPurchaseApplicationMail(temp_application, ldap.getAdmins());
				//���û������ʼ�
				mailService.sendPurchaseApplicationProcessMail(UserGroupConfig.MANAGER, true, temp_approval, temp_application.getUser());
			}
		});
		thread.start();
	}

	@Override
	public void refuseResourceAllocationApplication(int applicationId,String uid,String remark) {
		// TODO Auto-generated method stub
		int step=flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.MANAGER);
		ApplicationApproval approval=new ApplicationApproval(applicationId, step, uid, 1, remark);
		baseDao.save(approval);//��������Ϣ
		
		Application application=(Application)baseDao.get(Application.class, applicationId);
		application.setFinished(1);
		application.setRefused(1);
		baseDao.update(application);//�����ʲ���������
		
		//�����ʼ������߳�
		final Application temp_application=application;
		final ApplicationApproval temp_approval=approval;
		Thread thread=new Thread(new Runnable() {
			public void run() {
				//���ʲ������˷����ʼ�
				mailService.sendProcessRefuseMail(ApplicationTypeConfig.APPLY_RESOURCE, UserGroupConfig.MANAGER, temp_approval, temp_application.getReceiver());
			}
		});
		thread.start();
		
	}

	@Override
	public void refuseResourcePurchaseApplication(int applicationId,String uid,String remark) {
		// TODO Auto-generated method stub
		int step=flowService.getStepInFlow(ApplicationFlowConfig.MANAGER_ADMIN_FLOW, UserGroupConfig.MANAGER);
		PurchaseApplicationApproval approval=new PurchaseApplicationApproval(applicationId, step, uid, 1, remark);
		baseDao.save(approval);//��������Ϣ
		
		PurchaseApplication application=(PurchaseApplication)baseDao.get(PurchaseApplication.class, applicationId);
		application.setFinished(1);
		application.setRefused(1);
		baseDao.update(application);//�����ʲ���������
		
		//�����ʼ��߳�
		final PurchaseApplication temp_application=application;
		final PurchaseApplicationApproval temp_approval=approval;
		
		Thread thread=new Thread(new Runnable() {
			public void run() {
				mailService.sendPurchaseApplicationProcessMail(UserGroupConfig.MANAGER, false, temp_approval, temp_application.getUser());
			}
		});
		thread.start();
	}
	
	/**
	 * ���������Ӧ���ʲ���Ϣ
	 * @param list
	 */
	private List<Application> setApplicationResource(List<Application> list){
		for (Application application : list) {
			Resource resource=(Resource)baseDao.get(Resource.class, application.getRid());
			application.setResource(resource);
			application.setResourceName(resource.getName());
		}
		return list;
	}

}
