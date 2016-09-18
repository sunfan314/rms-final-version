package com.qlove.server.rms.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.qlove.server.rms.dao.BaseDao;
import com.qlove.server.rms.model.Application;
import com.qlove.server.rms.model.ApplicationApproval;
import com.qlove.server.rms.model.Flow;
import com.qlove.server.rms.model.Log;
import com.qlove.server.rms.model.Property;
import com.qlove.server.rms.model.PurchaseApplication;
import com.qlove.server.rms.model.Resource;
import com.qlove.server.rms.model.Type;
import com.qlove.server.rms.service.FlowService;
import com.qlove.server.rms.service.MailService;
import com.qlove.server.rms.service.ResourceService;
import com.qlove.server.rms.service.UserService;
import com.qlove.server.rms.util.ApplicationFlowConfig;
import com.qlove.server.rms.util.ApplicationTypeConfig;
import com.qlove.server.rms.util.LDAP;
import com.qlove.server.rms.util.TimeUtil;
import com.qlove.server.rms.util.UserGroupConfig;

@Service("userService")
@SuppressWarnings("all")
public class UserServiceImpl implements UserService {
	@javax.annotation.Resource
	private ResourceService resourceService;
	
	@javax.annotation.Resource
	private FlowService flowService;
	
	@javax.annotation.Resource
	private BaseDao baseDao;
	
	@javax.annotation.Resource
	private MailService mailService;

	@Override
	public boolean login(String uid, String password) {
		// TODO Auto-generated method stub
		LDAP ldap = new LDAP();
		return ldap.userVerify(uid, password);
	}

	@Override
	public int getUserAuthority(String uid) {
		// TODO Auto-generated method stub
		LDAP ldap=new LDAP();
		if(ldap.getAdmins().contains(uid)){
			return UserGroupConfig.ADMIN;
		}else if(ldap.getManagers().contains(uid)){
			return UserGroupConfig.MANAGER;
		}else{
			return UserGroupConfig.USER;
		}
	}

	@Override
	public List<String> getUserWithResources() {
		// TODO Auto-generated method stub
		List<String> userList = new ArrayList<>();
		List<Resource> resources = baseDao.find("from Resource");
		for (Resource resource : resources) {
			userList.add(resource.getOwner());
		}
		return filterRepeatedUser(userList);

	}

	/**
	 * @param userList
	 * @return �����ظ��û�
	 */
	private List<String> filterRepeatedUser(List<String> userList) {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<>();
		for (String str : userList) {
			boolean repeated = false;
			for (String str2 : list) {
				if (str.equals(str2)) {
					repeated = true;
				}
			}
			if (!repeated) {
				list.add(str);
			}
		}
		// ȥ�����
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).equals("warehouse")) {
					list.remove(i);
					break;
				}
			}
		}
		return list;
	}

	@Override
	public List<Property> getUsers() {
		// TODO Auto-generated method stub
		LDAP ldap = new LDAP();
		List<String> userList = ldap.getUsers();
		List<Property> list = new ArrayList<>();
		for (String str : userList) {
			Property property = new Property(str, str);
			list.add(property);
		}
		return list;
	}

	@Override
	public List<Property> getUsers(String uid) {
		// TODO Auto-generated method stub
		LDAP ldap = new LDAP();
		List<String> userList = ldap.getUsers();
		List<Property> list = new ArrayList<>();
		for (String str : userList) {
			if (str.equals(uid)) {
				continue;
			} else {
				Property property = new Property(str, str);
				list.add(property);
			}
		}
		return list;
	}
	
	@Override
	public boolean createResourceApplyApplication(int rid, String uid, String remark) {
		// TODO Auto-generated method stub
		if (resourceService.isResourceAvailable(rid)) {
			Application application = new Application(rid, "warehouse", uid, remark,
					ApplicationTypeConfig.APPLY_RESOURCE);
			Flow flow = (Flow)baseDao.get(Flow.class, ApplicationFlowConfig.MANAGER_ADMIN_FLOW);
			application.setFlow(flow);
			baseDao.save(application);
			//���������ʼ��߳�
			final Application temp_application=application;
			Thread thread=new Thread(new Runnable() {
				
				@Override
				public void run() {
					// TODO Auto-generated method stub
					LDAP ldap=new LDAP();
					//�������ʼ�
					mailService.sendApplicationMail(ApplicationTypeConfig.APPLY_RESOURCE, temp_application, ldap.getManagers());
				}
			});
			thread.start();
			return true;
		} else {
			return false;
		}

	}
	
	@Override
	public boolean createResourceTransferApplication(int rid, String uid, String receiver, String remark) {
		// TODO Auto-generated method stub
		if (resourceService.ifResourceOwner(rid, uid)) {
			Application application = new Application(rid, uid, receiver, remark,
					ApplicationTypeConfig.TRANSFER_RESOURCE);
			Flow flow = (Flow)baseDao.get(Flow.class, ApplicationFlowConfig.RECEIVER_FLOW);
			application.setFlow(flow);
			baseDao.save(application);
			//���������ʼ��߳�
			final Application temp_application=application;
			Thread thread=new Thread(new Runnable() {
				
				@Override
				public void run() {
					// TODO Auto-generated method stub
					//���ʲ������߷����ʼ�
					mailService.sendApplicationMail(ApplicationTypeConfig.TRANSFER_RESOURCE, temp_application, temp_application.getReceiver());
				}
			});
			thread.start();
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean createResourceReturnApplication(int rid, String uid, String remark) {
		// TODO Auto-generated method stub
		if (resourceService.ifResourceOwner(rid, uid)) {
			Application application = new Application(rid, uid, "warehouse", remark,
					ApplicationTypeConfig.RETURN_RESOURCE);
			Flow flow = (Flow)baseDao.get(Flow.class, ApplicationFlowConfig.ADMIN_FLOW);
			application.setFlow(flow);
			baseDao.save(application);
			//���������ʼ��߳�
			final Application temp_application=application;
			Thread thread=new Thread(new Runnable() {
				
				@Override
				public void run() {
					// TODO Auto-generated method stub
					LDAP ldap=new LDAP();
					//�����Ա�����ʼ�
					mailService.sendApplicationMail(ApplicationTypeConfig.RETURN_RESOURCE, temp_application, ldap.getAdmins());
				}
			});
			thread.start();
			return true;
		} else {
			// �ʲ������ڸ��û����û������й黹�ʲ���Ȩ��
			return false;
		}

	}
	
	@Override
	public void createResourcePurchaseApplication(PurchaseApplication application) {
		// TODO Auto-generated method stub
		PurchaseApplication purchaseApplication=new PurchaseApplication(application);
		Flow flow=(Flow)baseDao.get(Flow.class, ApplicationFlowConfig.MANAGER_ADMIN_FLOW);
		purchaseApplication.setFlow(flow);
		baseDao.save(purchaseApplication);
		//���������ʼ��߳�
		final PurchaseApplication temp_application=purchaseApplication;	
		Thread thread=new Thread(new Runnable() {	
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				//�������ʼ�
				LDAP ldap=new LDAP();
				mailService.sendPurchaseApplicationMail(temp_application, ldap.getManagers());
			}
		});
		thread.start();
	}

	@Override
	public Application getApplicationInfo(int applicationId) {
		// TODO Auto-generated method stub
		Application application=(Application)baseDao.get(Application.class, applicationId);
		Resource resource=(Resource)baseDao.get(Resource.class, application.getRid());
		application.setResource(resource);
		return application;
	}
	
	@Override
	public PurchaseApplication getPurchaseApplicationInfo(int applicationId) {
		// TODO Auto-generated method stub
		PurchaseApplication application=(PurchaseApplication)baseDao.get(PurchaseApplication.class, applicationId);
		return application;
	}

	@Override
	public List<Application> getResourceApplyApplications(String uid) {
		// TODO Auto-generated method stub
		List<Object> params=new ArrayList<>();
		params.add(ApplicationTypeConfig.APPLY_RESOURCE);
		params.add(uid);
		List<Application> list=baseDao.find("from Application where type = ? and receiver = ?",params);
		return setApplicationResource(list);//Ϊ����󶨶�Ӧ���ʲ���Ϣ
	}

	@Override
	public List<Application> getResourceTransferApplications(String uid) {
		// TODO Auto-generated method stub
		List<Object> params=new ArrayList<>();
		params.add(ApplicationTypeConfig.TRANSFER_RESOURCE);
		params.add(uid);
		List<Application> list=baseDao.find("from Application where type = ? and owner = ?",params);
		return setApplicationResource(list);//Ϊ����󶨶�Ӧ���ʲ���Ϣ
	}

	@Override
	public List<Application> getResourceReturnApplications(String uid) {
		// TODO Auto-generated method stub
		List<Object> params=new ArrayList<>();
		params.add(ApplicationTypeConfig.RETURN_RESOURCE);
		params.add(uid);
		List<Application> list= baseDao.find("from Application where type = ? and owner = ?",params);
		return setApplicationResource(list);//Ϊ����󶨶�Ӧ���ʲ���Ϣ
	}

	@Override
	public List<Application> getReceivedResourceTransferApplication(String uid) {
		// TODO Auto-generated method stub
		
		List<Object> params=new ArrayList<>();
		params.add(uid);
		params.add(ApplicationTypeConfig.TRANSFER_RESOURCE);
		params.add(flowService.getStepInFlow(ApplicationFlowConfig.RECEIVER_FLOW, UserGroupConfig.USER));
		params.add(0);//����δ����
		List<Application> list=baseDao.find("from Application where receiver = ? and type = ? and step = ? and finished = ?",params);
		return setApplicationResource(list);//Ϊ����󶨶�Ӧ���ʲ���Ϣ
	}

	@Override
	public List<PurchaseApplication> getResourcePurchaseApplications(String uid) {
		// TODO Auto-generated method stub
		return baseDao.find("from PurchaseApplication where user = ?",uid);
	}

	@Override
	public boolean acceptResourceTransferApplication(int applicationId, String uid) {
		// TODO Auto-generated method stub
		Application application=(Application)baseDao.get(Application.class, applicationId);
		Resource resource=(Resource)baseDao.get(Resource.class,application.getRid());
		//�ж����뷢�����Ƿ�����ʲ���ת��Ȩ��
		if(resourceService.ifResourceOwner(resource.getId(), application.getOwner())){
			//�ж��û��Ƿ�Ϊת������Ľ�����
			if(uid.equals(application.getReceiver())){
				
				int step=flowService.getStepInFlow(ApplicationFlowConfig.RECEIVER_FLOW, UserGroupConfig.USER);
				ApplicationApproval approval=new ApplicationApproval(applicationId, step, uid, 0, "");
				baseDao.save(approval);//������������Ϣ
				
				application.setFinished(1);
				baseDao.update(application);//�����ʲ�ת������
				
				resource.setOwner(uid);
				baseDao.update(resource);//�޸��ʲ�ӵ����״̬
				
				List<Object> params=new ArrayList<>();
				params.add(resource.getId());
				params.add(application.getOwner());
				params.add("");
				Log lastLog=(Log)baseDao.get("from Log where rid = ? and owner = ? and endTime = ?", params);
				lastLog.setEndTime(TimeUtil.getCurrentTime());
				baseDao.update(lastLog);//�޸��ʲ�ʹ����־��Ϣ
				
				Log nextLog=new Log(resource.getId(), uid, application.getRemark());
				baseDao.save(nextLog);//�����ʲ�ʹ����־��Ϣ
				
				//���������ʼ��߳�
				final ApplicationApproval temp_approval=approval;
				final Application temp_application=application;
				Thread thread=new Thread(new Runnable() {
					
					@Override
					public void run() {
						// TODO Auto-generated method stub
						//���ʲ�ת�Ʒ����˷����ʼ�
						mailService.sendProcessAgreeMail(ApplicationTypeConfig.TRANSFER_RESOURCE, UserGroupConfig.USER, temp_approval, temp_application.getOwner());
					}
				});
				thread.start();
				
				return true;
			}else{
				return false;
			}
			
		}else{
			return false;
		}	
	}

	@Override
	public void refuseResourceTransferApplication(int applicationId, String uid, String remark) {
		// TODO Auto-generated method stub
		int step=flowService.getStepInFlow(ApplicationFlowConfig.RECEIVER_FLOW, UserGroupConfig.USER);
		ApplicationApproval approval=new ApplicationApproval(applicationId, step, uid, 1, remark);
		baseDao.save(approval);//������������Ϣ
		
		Application application=(Application)baseDao.get(Application.class, applicationId);
		application.setFinished(1);
		application.setRefused(1);
		baseDao.update(application);//�����ʲ�ת������
		
		//�����ʼ������߳�
		final Application temp_application=application;
		final ApplicationApproval  temp_approval=approval;
		Thread thread=new Thread(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				mailService.sendProcessRefuseMail(ApplicationTypeConfig.TRANSFER_RESOURCE, UserGroupConfig.USER, temp_approval, temp_application.getOwner());
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
