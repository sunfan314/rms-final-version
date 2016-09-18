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
		//对在库资产申请创建对应的邮件
		if(type==ApplicationTypeConfig.APPLY_RESOURCE){
			String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
					+application.getReceiver()+"提出一条资产分配申请:</h4>"
					+"<h4 style='margin-left:50px;'>申请时间："+application.getTime()+"</h4>"
					+"<h4 style='margin-left:50px;'>物品名称："+resource.getName()+"</h4>"
					+"<h4 style='margin-left:50px;'>备注信息："+application.getRemark()+"</h4>"
					+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往处理</a>"
					+"</body></html>";
			mailUtil.doSendHtmlEmail("RMS系统——资产分配申请", htmlEMail, receiver+"@shuzijiayuan.com");
		}//对资产归还创建对应的邮件
		else if(type==ApplicationTypeConfig.RETURN_RESOURCE){
			String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
					+application.getOwner()+"提出一条资产归还申请:</h4>"
					+"<h4 style='margin-left:50px;'>申请时间："+application.getTime()+"</h4>"
					+"<h4 style='margin-left:50px;'>物品名称："+resource.getName()+"</h4>"
					+"<h4 style='margin-left:50px;'>备注信息："+application.getRemark()+"</h4>"
					+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往处理</a>"
					+"</body></html>";
			mailUtil.doSendHtmlEmail("RMS系统——资产归还申请", htmlEMail, receiver+"@shuzijiayuan.com");
		}//对资产转移创建对应的邮件
		else if(type==ApplicationTypeConfig.TRANSFER_RESOURCE){
			String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
					+application.getOwner()+"提出一条资产转移申请:</h4>"
					+"<h4 style='margin-left:50px;'>申请时间："+application.getTime()+"</h4>"
					+"<h4 style='margin-left:50px;'>物品名称："+resource.getName()+"</h4>"
					+"<h4 style='margin-left:50px;'>备注信息："+application.getRemark()+"</h4>"
					+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往处理</a>"
					+"</body></html>";
			mailUtil.doSendHtmlEmail("RMS系统——资产转移申请", htmlEMail, receiver+"@shuzijiayuan.com");
		}
	}

	@Override
	public void sendPurchaseApplicationMail(PurchaseApplication application, String receiver) {
		// TODO Auto-generated method stub
		MailUtil mailUtil=new MailUtil();
		String htmlEmail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
		+application.getUser()+"提出一条资产购买申请:</h4>"
			+"<h4 style='margin-left:50px;'>申请时间："+application.getTime()+"</h4>"
			+"<h4 style='margin-left:50px;'>申请物品："+application.getName()+"</h4>"
			+"<h4 style='margin-left:50px;'>申请数量："+application.getNumber()+"</h4>"
			+"<h4 style='margin-left:50px;'>申购描述："+application.getDescription()+"</h4>"
			+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往处理</a>"
			+"</body></html>";
		mailUtil.doSendHtmlEmail("RMS系统——资产购买申请", htmlEmail, receiver+"@shuzijiayuan.com");
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
		//为在库资产申请发送邮件通知处理结果
		if(type==ApplicationTypeConfig.APPLY_RESOURCE){
			//经理审批通过
			if(userType==UserGroupConfig.MANAGER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"经理"+approval.getReviewer()+"批准了您的资产分配申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>申请物品："+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>请求已被递送至管理员进行处理，请耐心等待</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产分配申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
			//管理员审核通过
			else if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"管理员"+approval.getReviewer()+"批准了您的资产分配申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>申请物品："+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>物品已被分配至您的账号下</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产分配申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
		//资产归还申请审核
		else if(type==ApplicationTypeConfig.RETURN_RESOURCE){
			//管理员审核通过
			if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"管理员"+approval.getReviewer()+"批准了您的资产归还申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>归还物品："+resource.getName()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产归还申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
		}
		
		//资产转移申请审核
		else if(type==ApplicationTypeConfig.TRANSFER_RESOURCE){
			//用户审核通过
			if(userType==UserGroupConfig.USER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"用户"+approval.getReviewer()+"批准了您的资产转移申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>转移物品："+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>物品已被分配至您的账号下</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产转移申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
	}

	@Override
	public void sendProcessRefuseMail(int type, int userType, ApplicationApproval approval, String receiver) {
		// TODO Auto-generated method stub
		MailUtil mailUtil=new MailUtil();
		Application application=(Application)baseDao.get(Application.class, approval.getApplicationId());
		Resource resource=(Resource)baseDao.get(Resource.class, application.getRid());
		//为在库资产申请发送邮件通知处理结果
		if(type==ApplicationTypeConfig.APPLY_RESOURCE){
			//经理审批拒绝
			if(userType==UserGroupConfig.MANAGER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"经理"+approval.getReviewer()+"拒绝了您的资产分配申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>申请物品："+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>审核信息："+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产分配申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
			//管理员审核拒绝
			else if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"管理员"+approval.getReviewer()+"拒绝了您的资产分配申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>申请物品："+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>审核信息："+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产分配申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
		//资产归还申请审核
		else if(type==ApplicationTypeConfig.RETURN_RESOURCE){
			//管理员审核拒绝
			if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"管理员"+approval.getReviewer()+"拒绝了您的资产归还申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>归还物品："+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>审核信息："+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产归还申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
		}
		
		//资产转移申请审核
		else if(type==ApplicationTypeConfig.TRANSFER_RESOURCE){
			//用户审核拒绝
			if(userType==UserGroupConfig.USER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"用户"+approval.getReviewer()+"拒绝了您的资产转移申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>转移物品："+resource.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>审核信息："+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产转移申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
	}

	@Override
	public void sendPurchaseApplicationProcessMail(int userType, Boolean agree, PurchaseApplicationApproval approval,
			String receiver) {
		// TODO Auto-generated method stub
		MailUtil mailUtil=new MailUtil();
		PurchaseApplication application=(PurchaseApplication)baseDao.get(PurchaseApplication.class,approval.getApplicationId());
		//同意资产购买申请
		if(agree){
			//经理审核通过
			if(userType==UserGroupConfig.MANAGER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"经理"+approval.getReviewer()+"批准了您的资产购买申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>申购物品："+application.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>请求已被递送至管理员进行处理</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产购买申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
			//管理员审核通过
			else if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"管理员"+approval.getReviewer()+"批准了您的资产购买申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>申购物品："+application.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>物品正由管理员处理购买中，请耐心等待</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产购买申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
		//拒绝资产购买申请
		else{
			//经理审核拒绝
			if(userType==UserGroupConfig.MANAGER){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"经理"+approval.getReviewer()+"拒绝了您的资产购买申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>申购物品："+application.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>审核信息："+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产购买申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
			
			//管理员审核拒绝
			else if(userType==UserGroupConfig.ADMIN){
				String htmlEMail="<html><head></head><body><h3>Hi "+receiver+":</h3><h4 style='margin-left:50px;'>"
						+"管理员"+approval.getReviewer()+"拒绝了您的资产购买申请:</h4>"
						+"<h4 style='margin-left:50px;'>审核时间："+approval.getTime()+"</h4>"
						+"<h4 style='margin-left:50px;'>申购物品："+application.getName()+"</h4>"
						+"<h4 style='margin-left:50px;'>审核信息："+approval.getRemark()+"</h4>"
						+ "<a style='margin-left:50px;' href='"+SystemConfig.PROJECT_PATH+"'>前往系统</a>"
						+"</body></html>";
				mailUtil.doSendHtmlEmail("RMS系统——资产购买申请审核结果", htmlEMail, receiver+"@shuzijiayuan.com");
			}
		}
		
	}

}
