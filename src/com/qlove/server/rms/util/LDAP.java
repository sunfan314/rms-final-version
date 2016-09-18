package com.qlove.server.rms.util;

import java.util.ArrayList;
import java.util.List;

import com.novell.ldap.LDAPAttributeSet;
import com.novell.ldap.LDAPConnection;
import com.novell.ldap.LDAPEntry;
import com.novell.ldap.LDAPException;
import com.novell.ldap.LDAPSearchResults;

@SuppressWarnings("all")
public class LDAP {
	
	private LDAPConnection connection;
	
	/**
	 * @return	��������
	 */
	public LDAPConnection getConnectionInstance(){
		if(connection==null){
			connection=new LDAPConnection();	
			//���ó�ʱʱ��
			connection.setSocketTimeOut(LDAPConfig.TIMEOUT);
			//���÷�������ַ�Ͷ˿ں�
			try {
				connection.connect(LDAPConfig.HOST,LDAPConfig.PORT);
			} catch (LDAPException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return connection;
	}

	/**
	 * @param uid
	 * @return ����uid��ȡ�û��ڵ�
	 * @throws Exception
	 */
	public List<String> getUserDN(String uid) throws Exception {
		List<String> result = new ArrayList<String>();

		LDAPConnection conn = this.getConnectionInstance();
		//������¼
		conn.bind(null, null);

		LDAPSearchResults searchResults = conn.search(LDAPConfig.USER_SEARCH_BASE, LDAPConfig.SEARCH_SCOPE, LDAPConfig.USER_FILTER, null, false);

		while (searchResults.hasMore()) {
			LDAPEntry nextEntry = searchResults.next();
			LDAPAttributeSet attributeSet = nextEntry.getAttributeSet();
			String entryUid = attributeSet.getAttribute("uid").getStringValue();
			if (entryUid.equals(uid)) {
				result.add(nextEntry.getDN());
			}
		}
		return result;
	}

	/**
	 * @param userDN
	 * @param password
	 * @return ���ݽڵ������û����볢������LDAP������
	 */
	public boolean userConnect(String userDN, String password) {
		if (password.equals("")) {
			return false;
		}
		try {
			LDAPConnection conn = this.getConnectionInstance();
			conn.bind(userDN, password);
			return conn.isConnected();
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}

	}

	/**
	 * @param uid
	 * @param password
	 * @return �û���¼��֤
	 */
	public boolean userVerify(String uid, String password) {
		try {
			if (!(getUserDN(uid).size() == 1)) {
				return false;
			}
			return userConnect(getUserDN(uid).get(0), password);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * @return ��ȡ�û��б�
	 */
	public List<String> getUsers() {
		List<String> result = new ArrayList<String>();
		try {
			LDAPConnection conn = this.getConnectionInstance();
			// ������¼
			conn.bind(null, null);

			LDAPSearchResults searchResults = conn.search(LDAPConfig.USER_SEARCH_BASE, LDAPConfig.SEARCH_SCOPE, LDAPConfig.USER_FILTER, null, false);

			while (searchResults.hasMore()) {
				LDAPEntry nextEntry = searchResults.next();
				LDAPAttributeSet attributeSet = nextEntry.getAttributeSet();
				String entryUid = attributeSet.getAttribute("uid").getStringValue();
				result.add(entryUid);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			return result;
		}

	}
	
	/**
	 * @return	��ȡ����Ա�б�
	 */
	public List<String> getAdmins(){
		List<String> result = new ArrayList<String>();
		try {
			LDAPConnection conn =this.getConnectionInstance();
			// ������¼
			conn.bind(null, null);

			LDAPSearchResults searchResults = conn.search(LDAPConfig.ADMIN_SEARCH_BASE, LDAPConfig.SEARCH_SCOPE, LDAPConfig.GROUP_FILTER, null, false);

			while (searchResults.hasMore()) {
				LDAPEntry nextEntry = searchResults.next();
				LDAPAttributeSet attributeSet = nextEntry.getAttributeSet();
				String entryUid = attributeSet.getAttribute("memberUid").getStringValue();
				result.add(entryUid);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			return result;
		}
	}
	
	/**	
	 * @return	��ȡ�����б�
	 */
	public List<String> getManagers(){
		List<String> result = new ArrayList<String>();
		try {
			LDAPConnection conn = this.getConnectionInstance();
			// ������¼
			conn.bind(null, null);

			LDAPSearchResults searchResults = conn.search(LDAPConfig.MANAGER_SEARCH_BASE, LDAPConfig.SEARCH_SCOPE, LDAPConfig.GROUP_FILTER, null, false);

			while (searchResults.hasMore()) {
				LDAPEntry nextEntry = searchResults.next();
				LDAPAttributeSet attributeSet = nextEntry.getAttributeSet();
				String entryUid = attributeSet.getAttribute("memberUid").getStringValue();
				result.add(entryUid);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			return result;
		}
	}

}
