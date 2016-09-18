package com.qlove.server.rms.dao;

import java.io.Serializable;
import java.util.List;


public interface BaseDao<T> {
	
	/**
	 * @param o
	 * @return	�洢����ʵ��
	 */
	public Serializable save(T o);

	/**
	 * @param o
	 * ɾ������ʵ��
	 */
	public void delete(T o);

	/**
	 * @param o
	 * ���¶���ʵ��
	 */
	public void update(T o);

	/**
	 * @param o
	 * �洢����¶���ʵ��
	 */
	public void saveOrUpdate(T o);

	/**
	 * @param hql
	 * @return	��ѯ����ʵ��
	 */
	public List<T> find(String hql);
	
	/**
	 * @param hql
	 * @param param
	 * @return	��ѯ����ʵ��
	 */
	public List<T> find(String hql,Object param);
	
	/**
	 * @param hql
	 * @param param
	 * @return	��ѯ����ʵ��
	 */
	public List<T> find(String hql, Object[] param);

	/**
	 * @param hql
	 * @param param
	 * @return	��ѯ����ʵ��
	 */
	public List<T> find(String hql, List<Object> param);

	/**
	 * @param hql
	 * @param param
	 * @param page
	 * @param rows
	 * @return	��ѯ����ʵ��
	 */
	public List<T> find(String hql, Object[] param, Integer page, Integer rows);

	/**
	 * @param hql
	 * @param param
	 * @param page
	 * @param rows
	 * @return	��ѯ����ʵ��
	 */
	public List<T> find(String hql, List<Object> param, Integer page,
			Integer rows);

	/**
	 * @param c
	 * @param id
	 * @return	���ݶ����ʶ����ʵ�����
	 */
	public T get(Class<T> c, Serializable id);

	/**
	 * @param hql
	 * @param param
	 * @return	���ݲ�������ʵ�����
	 */
	public T get(String hql, Object[] param);

	/**
	 * @param hql
	 * @param param
	 * @return	���ݲ�������ʵ�����
	 */
	public T get(String hql, List<Object> param);

	/**
	 * @param hql
	 * @return	
	 */
	public Long count(String hql);

	/**
	 * @param hql
	 * @param param
	 * @return
	 */
	public Long count(String hql, Object[] param);

	/**
	 * @param hql
	 * @param param
	 * @return
	 */
	public Long count(String hql, List<Object> param);

	/**
	 * @param hql
	 * @return	ִ��hql���
	 */
	public Integer executeHql(String hql);

	/**
	 * @param hql
	 * @param param
	 * @return	ִ��hql���
	 */
	public Integer executeHql(String hql, Object[] param);

	/**
	 * @param hql
	 * @param param
	 * @return	ִ��hql���
	 */
	public Integer executeHql(String hql, List<Object> param);

}
