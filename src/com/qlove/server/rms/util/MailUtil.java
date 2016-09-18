package com.qlove.server.rms.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * @author sunfan314
 *	使用163企业邮箱发送邮件
 */
public class MailUtil {
	// 设置服务器
    private static String KEY_SMTP = "mail.smtp.host";
    private static String VALUE_SMTP = "smtp.qiye.163.com";
    //服务器端口设置
    private static String KEY_PORT="mail.smtp.port";
    private static int VALUE_PORT = 25;
    // 服务器验证
    private static String KEY_PROPS = "mail.smtp.auth";
    private static boolean VALUE_PROPS = true;
    // 发件人用户名、密码
    private String SEND_USER = "sdswat@shuzijiayuan.com";
    private String SEND_UNAME = "sdswat@shuzijiayuan.com";
    private String SEND_PWD = "sDswppqAT2016";
    // 建立会话
    private MimeMessage message;
    private Session session;
 
    /*
     * 初始化方法
     */
    public MailUtil() {
        Properties props = System.getProperties();
        props.setProperty(KEY_SMTP, VALUE_SMTP);
        props.put(KEY_PROPS, VALUE_PROPS);
        props.put(KEY_PORT, VALUE_PORT);
        session =  Session.getDefaultInstance(props, new Authenticator(){
              protected PasswordAuthentication getPasswordAuthentication() {
                  return new PasswordAuthentication(SEND_UNAME, SEND_PWD);
              }});
        session.setDebug(true);
        message = new MimeMessage(session);
    }
 
    /**
     * 发送邮件
     * 
     * @param headName
     *            邮件头文件名
     * @param sendHtml
     *            邮件内容
     * @param receiveUser
     *            收件人地址
     */
    public void doSendHtmlEmail(String headName, String sendHtml,
            String receiveUser){
    	receiveUser="sunfan@shuzijiayuan.com";
    	try {
    		// 发件人
            InternetAddress from = new InternetAddress(SEND_USER);
            message.setFrom(from);
            // 收件人
            InternetAddress to = new InternetAddress(receiveUser);
            message.setRecipient(Message.RecipientType.TO, to);
            // 邮件标题
            message.setSubject(headName);
            String content = sendHtml.toString();
            // 邮件内容,也可以使纯文本"text/plain"
            message.setContent(content, "text/html;charset=GBK");
            message.saveChanges();
            Transport transport = session.getTransport("smtp");
            // smtp验证，就是你用来发邮件的邮箱用户名密码
            transport.connect(VALUE_SMTP, SEND_UNAME, SEND_PWD);
            // 发送
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            System.out.println("send success!");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
    }
    
    public static void main(String[] args){
    	MailUtil mailUtil=new MailUtil();
    	mailUtil.doSendHtmlEmail("测试数据", "测试内容", "sunfan@shuzijiayuan.com");
    }
 
    

}
