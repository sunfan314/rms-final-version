package com.qlove.server.rms.util;

import com.novell.ldap.LDAPConnection;

public class LDAPConfig {
	
	/**
	 * LDAP��������ַ
	 */
	public static String HOST = "172.20.20.200";
	
	/**
	 * LDAP�������˿�
	 */
	public static int PORT = 389;
	
	/**
	 * ��ʱ����
	 */
	public static int TIMEOUT = 10000;
	
	/**
	 * �����������
	 */
	public static String SEARCH_BASE="dc=kinstalk,dc=com";
	
	/**
	 * ְԱ�����������
	 */
	public static String USER_SEARCH_BASE="ou=People,dc=kinstalk,dc=com";
	
	/**
	 * ����Ա�����������
	 */
	public static String ADMIN_SEARCH_BASE="cn=SZJY_RMS_ADMIN,ou=Groups,dc=kinstalk,dc=com";
	
	/**
	 * ���������������
	 */
	public static String MANAGER_SEARCH_BASE="cn=SZJY_RMS_MANAGER,ou=Groups,dc=kinstalk,dc=com";
	
	
	/**
	 * �û�����������
	 */
	public static String USER_FILTER="(|(objectClass=inetOrgPerson)(objectClass=posixAccount)(objectClass=shadowAccount))";
	
	/**
	 * Ⱥ������������
	 */
	public static String GROUP_FILTER="(|(objectClass=posixGroup)(objectClass=top))";
	
	/**
	 * ������Χ
	 */
	public static int SEARCH_SCOPE=LDAPConnection.SCOPE_SUB;
	
	
	
	
}
