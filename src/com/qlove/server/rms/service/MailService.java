package com.qlove.server.rms.service;

import java.util.List;

import com.qlove.server.rms.model.Application;
import com.qlove.server.rms.model.ApplicationApproval;
import com.qlove.server.rms.model.PurchaseApplication;
import com.qlove.server.rms.model.PurchaseApplicationApproval;

public interface MailService {
	
	/**
	 * 对资产分配、资产归还和资产转移申请发送对应的邮件提醒处理人进行处理
	 * @param type
	 * @param application
	 * @param receiver
	 */
	public void sendApplicationMail(int type,Application application,String receiver);
	
	/**
	 * 对资产购买申请发送邮件提醒处理人进行处理
	 * @param application
	 * @param receiver
	 */
	public void sendPurchaseApplicationMail(PurchaseApplication application,String receiver);
	
	/**
	 * 对多个用户发送邮件
	 * @param type
	 * @param application
	 * @param receivers
	 */
	public void sendApplicationMail(int type,Application application,List<String> receivers);
	
	/**
	 * 对多个用户发送邮件
	 * @param application
	 * @param receivers
	 */
	public void sendPurchaseApplicationMail(PurchaseApplication application,List<String> receivers);

	/**
	 * 向用户发送申请批准处理结果
	 * @param type
	 * @param approval
	 * @param receiver
	 */
	public void sendProcessAgreeMail(int type,int userType,ApplicationApproval approval,String receiver);
	
	/**
	 * 向用户发送申请拒绝处理结果
	 * @param type
	 * @param approval
	 * @param receiver
	 */
	public void sendProcessRefuseMail(int type,int userType,ApplicationApproval approval,String receiver);
	
	/**
	 * 向用户发送资产申购处理结果
	 * @param userType
	 * @param agree
	 * @param approval
	 * @param receiver
	 */
	public void sendPurchaseApplicationProcessMail(int userType,Boolean agree,PurchaseApplicationApproval approval,String receiver);

}
