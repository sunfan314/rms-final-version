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
 *	ʹ��163��ҵ���䷢���ʼ�
 */
public class MailUtil {
	// ���÷�����
    private static String KEY_SMTP = "mail.smtp.host";
    private static String VALUE_SMTP = "smtp.qiye.163.com";
    //�������˿�����
    private static String KEY_PORT="mail.smtp.port";
    private static int VALUE_PORT = 25;
    // ��������֤
    private static String KEY_PROPS = "mail.smtp.auth";
    private static boolean VALUE_PROPS = true;
    // �������û���������
    private String SEND_USER = "sdswat@shuzijiayuan.com";
    private String SEND_UNAME = "sdswat@shuzijiayuan.com";
    private String SEND_PWD = "sDswppqAT2016";
    // �����Ự
    private MimeMessage message;
    private Session session;
 
    /*
     * ��ʼ������
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
     * �����ʼ�
     * 
     * @param headName
     *            �ʼ�ͷ�ļ���
     * @param sendHtml
     *            �ʼ�����
     * @param receiveUser
     *            �ռ��˵�ַ
     */
    public void doSendHtmlEmail(String headName, String sendHtml,
            String receiveUser){
    	receiveUser="sunfan@shuzijiayuan.com";
    	try {
    		// ������
            InternetAddress from = new InternetAddress(SEND_USER);
            message.setFrom(from);
            // �ռ���
            InternetAddress to = new InternetAddress(receiveUser);
            message.setRecipient(Message.RecipientType.TO, to);
            // �ʼ�����
            message.setSubject(headName);
            String content = sendHtml.toString();
            // �ʼ�����,Ҳ����ʹ���ı�"text/plain"
            message.setContent(content, "text/html;charset=GBK");
            message.saveChanges();
            Transport transport = session.getTransport("smtp");
            // smtp��֤���������������ʼ��������û�������
            transport.connect(VALUE_SMTP, SEND_UNAME, SEND_PWD);
            // ����
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
    	mailUtil.doSendHtmlEmail("��������", "��������", "sunfan@shuzijiayuan.com");
    }
 
    

}
