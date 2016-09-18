package com.qlove.server.rms.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.qlove.server.rms.dao.BaseDao;
import com.qlove.server.rms.model.Application;
import com.qlove.server.rms.model.ApplicationApproval;
import com.qlove.server.rms.model.PurchaseApplication;
import com.qlove.server.rms.model.PurchaseApplicationApproval;
import com.qlove.server.rms.model.Resource;
import com.qlove.server.rms.service.MailService;
import com.qlove.server.rms.service.UserService;
import com.qlove.server.rms.util.ApplicationTypeConfig;
import com.qlove.server.rms.util.MailUtil;
import com.qlove.server.rms.util.SystemConfig;
import com.qlove.server.rms.util.UserGroupConfig;

@Service("mailService")
public class MailServiceImpl implements MailService{
	@javax.annotation.Resource
	private BaseDao baseDao;

	@Override
	public void sendApplicationMail(int type, Application application, String receiver) {
		// TODO Auto-generated method stub
		MailUtil mailUtil=new MailUtil();
		Resource resource=(Resource)baseDao.get(Resource.class, application.getRid());
		//���ڿ��ʲ����봴����Ӧ���ʼ�
		if(type==ApplicationTypeConfig.APPLY_RESOURCE){
			String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
					+application.getReceiver()+"���һ���ʲ���������:</h4>"
					+"<h4 style='margin-left:50px;'>����ʱ�䣺"+application.getTime()+"</h4>"
					+"<h4 style='margin-left:50px;'>��Ʒ���ƣ�"+resource.getName()+"</h4>"
					+"<h4 style='margin-left:50px;'>��ע��Ϣ��"+application.getRemark()+"</h4>"
					+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ������</a>"
					+"</body></html>";
			mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ���������", htmlEMail, receiver+"@shuzijiayuan.com");
		}//���ʲ��黹������Ӧ���ʼ�
		else if(type==ApplicationTypeConfig.RETURN_RESOURCE){
			String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
					+application.getOwner()+"���һ���ʲ��黹����:</h4>"
					+"<h4 style='margin-left:50px;'>����ʱ�䣺"+application.getTime()+"</h4>"
					+"<h4 style='margin-left:50px;'>��Ʒ���ƣ�"+resource.getName()+"</h4>"
					+"<h4 style='margin-left:50px;'>��ע��Ϣ��"+application.getRemark()+"</h4>"
					+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ������</a>"
					+"</body></html>";
			mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ��黹����", htmlEMail, receiver+"@shuzijiayuan.com");
		}//���ʲ�ת�ƴ�����Ӧ���ʼ�
		else if(type==ApplicationTypeConfig.TRANSFER_RESOURCE){
			String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
					+application.getOwner()+"���һ���ʲ�ת������:</h4>"
					+"<h4 style='margin-left:50px;'>����ʱ�䣺"+application.getTime()+"</h4>"
					+"<h4 style='margin-left:50px;'>��Ʒ���ƣ�"+resource.getName()+"</h4>"
					+"<h4 style='margin-left:50px;'>��ע��Ϣ��"+application.getRemark()+"</h4>"
					+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ������</a>"
					+"</body></html>";
			mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ�ת������", htmlEMail, receiver+"@shuzijiayuan.com");
		}
	}

	@Override
	public void sendPurchaseApplicationMail(PurchaseApplication application, String receiver) {
		// TODO Auto-generated method stub
		MailUtil mailUtil=new MailUtil();
		String htmlEmail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
		+application.getUser()+"���һ���ʲ���������:</h4>"
			+"<h4 style='margin-left:50px;'>����ʱ�䣺"+application.getTime()+"</h4>"
			+"<h4 style='margin-left:50px;'>������Ʒ��"+application.getName()+"</h4>"
			+"<h4 style='margin-left:50px;'>����������"+application.getNumber()+"</h4>"
			+"<h4 style='margin-left:50px;'>�깺������"+application.getDescription()+"</h4>"
			+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ������</a>"
			+"</body></html>";
		mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ���������", htmlEmail, receiver+"@shuzijiayuan.com");
	}

	@Override
	public void sendApplicationMail(int type, Application application, List<String> receivers) {
		// TODO Auto-generated method stub
		for (String receiver : receivers) {	
			sendApplicationMail(type, application, receiver);
		}
	}

	@Override
	public void sendPurchaseApplicationMail(PurchaseApplication application, List<String> receivers) {
		// TODO Auto-generated method stub
		for (String receiver : receivers) {
			sendPurchaseApplicationMail(application, receiver);		
		}
	}

	@Override
	public void sendProcessAgreeMail(int type, int userType, ApplicationApproval approval, String receiver) {
		// TODO Auto-generated method stub
		MailUtil mailUtil=new MailUtil();
		Application application=(Application)baseDao.get(Application.class, approval.getApplicationId());
		Resource resource=(Resource)baseDao.get(Resource.class, application.getRid());
		//Ϊ�ڿ��ʲ����뷢���ʼ�֪ͨ������
		if(type==ApplicationTypeConfig.APPLY_RESOURCE){
			//��������ͨ��
			if(userType==UserGroupConfig.MANAGER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"����"+approval.getReviewer()+"��׼�������ʲ���������:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>������Ʒ��"+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>�����ѱ�����������Ա���д��������ĵȴ�</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ�����������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
			//����Ա���ͨ��
			else if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"����Ա"+approval.getReviewer()+"��׼�������ʲ���������:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>������Ʒ��"+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>��Ʒ�ѱ������������˺���</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ�����������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
		//�ʲ��黹�������
		else if(type==ApplicationTypeConfig.RETURN_RESOURCE){
			//����Ա���ͨ��
			if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"����Ա"+approval.getReviewer()+"��׼�������ʲ��黹����:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>�黹��Ʒ��"+resource.getName()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ��黹������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
		}
		
		//�ʲ�ת���������
		else if(type==ApplicationTypeConfig.TRANSFER_RESOURCE){
			//�û����ͨ��
			if(userType==UserGroupConfig.USER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"�û�"+approval.getReviewer()+"��׼�������ʲ�ת������:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>ת����Ʒ��"+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>��Ʒ�ѱ������������˺���</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ�ת��������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
	}

	@Override
	public void sendProcessRefuseMail(int type, int userType, ApplicationApproval approval, String receiver) {
		// TODO Auto-generated method stub
		MailUtil mailUtil=new MailUtil();
		Application application=(Application)baseDao.get(Application.class, approval.getApplicationId());
		Resource resource=(Resource)baseDao.get(Resource.class, application.getRid());
		//Ϊ�ڿ��ʲ����뷢���ʼ�֪ͨ������
		if(type==ApplicationTypeConfig.APPLY_RESOURCE){
			//���������ܾ�
			if(userType==UserGroupConfig.MANAGER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"����"+approval.getReviewer()+"�ܾ��������ʲ���������:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>������Ʒ��"+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>�����Ϣ��"+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ�����������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
			//����Ա��˾ܾ�
			else if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"����Ա"+approval.getReviewer()+"�ܾ��������ʲ���������:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>������Ʒ��"+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>�����Ϣ��"+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ�����������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
		//�ʲ��黹�������
		else if(type==ApplicationTypeConfig.RETURN_RESOURCE){
			//����Ա��˾ܾ�
			if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"����Ա"+approval.getReviewer()+"�ܾ��������ʲ��黹����:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>�黹��Ʒ��"+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>�����Ϣ��"+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ��黹������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
		}
		
		//�ʲ�ת���������
		else if(type==ApplicationTypeConfig.TRANSFER_RESOURCE){
			//�û���˾ܾ�
			if(userType==UserGroupConfig.USER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"�û�"+approval.getReviewer()+"�ܾ��������ʲ�ת������:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>ת����Ʒ��"+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>�����Ϣ��"+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ�ת��������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
	}

	@Override
	public void sendPurchaseApplicationProcessMail(int userType, Boolean agree, PurchaseApplicationApproval approval,
			String receiver) {
		// TODO Auto-generated method stub
		MailUtil mailUtil=new MailUtil();
		PurchaseApplication application=(PurchaseApplication)baseDao.get(PurchaseApplication.class,approval.getApplicationId());
		//ͬ���ʲ���������
		if(agree){
			//�������ͨ��
			if(userType==UserGroupConfig.MANAGER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"����"+approval.getReviewer()+"��׼�������ʲ���������:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>�깺��Ʒ��"+application.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>�����ѱ�����������Ա���д���</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ�����������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
			//����Ա���ͨ��
			else if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"����Ա"+approval.getReviewer()+"��׼�������ʲ���������:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>�깺��Ʒ��"+application.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>��Ʒ���ɹ���Ա�������У������ĵȴ�</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ�����������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
		//�ܾ��ʲ���������
		else{
			//������˾ܾ�
			if(userType==UserGroupConfig.MANAGER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"����"+approval.getReviewer()+"�ܾ��������ʲ���������:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>�깺��Ʒ��"+application.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>�����Ϣ��"+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ�����������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
			//����Ա��˾ܾ�
			else if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"����Ա"+approval.getReviewer()+"�ܾ��������ʲ���������:</h4>"
						+"<h4 style='margin-left:50px;'>���ʱ�䣺"+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>�깺��Ʒ��"+application.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>�����Ϣ��"+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>ǰ��ϵͳ</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMSϵͳ�����ʲ�����������˽��", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
	}

}
