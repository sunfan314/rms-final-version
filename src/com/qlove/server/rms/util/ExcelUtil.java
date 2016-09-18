package com.qlove.server.rms.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.qlove.server.rms.model.Resource;
import com.qlove.server.rms.model.Type;
import com.qlove.server.rms.service.AdminService;
import com.qlove.server.rms.service.ResourceService;
import com.qlove.server.rms.service.UserService;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class ExcelUtil {
	
	@javax.annotation.Resource
	private ResourceService resourceService;

	
	/**
	 * @param filePath
	 * @param type
	 * @return	��excel�ļ��ж�ȡ�ʲ���Ϣ
	 * @throws Exception
	 */
	public List<Resource> readFromFile(String filePath, Type type) throws Exception {
		File file = new File(filePath);
		InputStream in;
		Workbook workbook;
		List<Resource> list = new ArrayList<>();
		in = new FileInputStream(file);
		workbook = Workbook.getWorkbook(in);
		// ��ȡ��һ��Sheet��
		Sheet sheet = workbook.getSheet(0);
		// ��ȡ�ʲ���Ŀ
		int size = sheet.getColumn(0).length - 1;
		for (int i = 0; i < size; i++) {
			Resource resource = new Resource();
			// �����ʲ�״̬Ϊ����״̬
			resource.setStatus(0);
			// �����ʲ����
			resource.setType(type);
			Cell[] cells = sheet.getRow(i + 1);
			int temp=cells.length;
			resource.setName((0>=temp)?"":cells[0].getContents());
			resource.setModel((1>=temp)?"":cells[1].getContents());
			resource.setTrackingNo((2>=temp)?"":cells[2].getContents());
			resource.setTrackingNo2((3>=temp)?"":cells[3].getContents());
			resource.setImei((4>=temp)?"":cells[4].getContents());
			resource.setSerialNo((5>=temp)?"":cells[5].getContents());
			resource.setEntryDate((6>=temp)?"":cells[6].getContents());
			resource.setOwner((7>=temp)?"":cells[7].getContents());
			resource.setRemark((8>=temp)?"":cells[8].getContents());
			list.add(resource);
//			�����ֵ����Ϣ
//			Cell[] cells=sheet.getRow(i+1);
//			int num=Integer.parseInt(cells[1].getContents());
//			for(int j=0;j<num;j++){
//				Resource resource=new Resource();
//				resource.setStatus(0);
//				resource.setPurchaser("xiahui");
//				resource.setType(type);
//				int temp=cells.length;
//				resource.setName((0>=temp)?"":cells[0].getContents());
//				resource.setPhoneNumber((2>=temp)?"":cells[2].getContents());
//				resource.setOwner((3>=temp)?"":cells[3].getContents());
//				resource.setEntryDate((4>=temp)?"":cells[4].getContents());
//				resource.setRemark((5>=temp)?"":cells[5].getContents());
//				list.add(resource);
//			}
		}

		in.close();
		workbook.close();
		return list;

	}

	/**
	 * @param file
	 * @return	�����ļ�
	 * @throws Exception
	 */
	public File exportResource(String filePath,Type type,List<Resource> list) throws Exception{

			String fileName=getFileName(type.getName());
			// ����excel�ļ�
			WritableWorkbook book = Workbook.createWorkbook(new File(filePath+FileUtil.SEPARATOR+fileName));
			// ������ΪtypeName�Ĺ���������0��ʾ���ǵ�һҳ
			WritableSheet sheet = book.createSheet(type.getName(), 0);
			//SIM�����
			if(type.getId()==ResourceTypeConfig.SIM_CARD){
				//��ӱ�ͷ
				List<Label> labels=new ArrayList<>();
				labels.add(new Label(0, 0, "�ʲ�����"));
				labels.add(new Label(1, 0, "�ֻ�����"));
				labels.add(new Label(2, 0, "IMSI"));
				labels.add(new Label(3, 0, "�ײ���Ϣ"));
				labels.add(new Label(4, 0, "����"));
				labels.add(new Label(5, 0, "ӵ����"));
				labels.add(new Label(6, 0, "���ʱ��"));
				labels.add(new Label(7, 0, "�ʲ�״̬"));
				labels.add(new Label(8, 0, "��ע��Ϣ"));
				for (Label label : labels) {
					sheet.addCell(label);
				}
				//�м�����
				int rowCount=1;
				for (Resource resource : list) {
					//�����������
					List<Label> resourceInfos=new ArrayList<>();
					resourceInfos.add(new Label(0,rowCount,resource.getName()));
					resourceInfos.add(new Label(1,rowCount,resource.getPhoneNumber()));
					resourceInfos.add(new Label(2,rowCount,resource.getImsi()));
					resourceInfos.add(new Label(3,rowCount,resource.getPack()));
					resourceInfos.add(new Label(4,rowCount,resource.getPassword()));
					resourceInfos.add(new Label(5,rowCount,resource.getOwner()));
					resourceInfos.add(new Label(6,rowCount,resource.getEntryDate()));
					resourceInfos.add(new Label(7,rowCount,resource.getStatusValue()));
					resourceInfos.add(new Label(8,rowCount,resource.getRemark()));
					for (Label label : resourceInfos) {
						sheet.addCell(label);
					}
					rowCount++;
				}
				// д�����ݲ��ر��ļ�
				book.write();
				book.close();
				File file=new File(filePath+FileUtil.SEPARATOR+fileName);
				return file;
				
			}//�ֻ���ֵ�����
			else if(type.getId()==ResourceTypeConfig.PHONE_CARD){
				//��ӱ�ͷ
				List<Label> labels=new ArrayList<>();
				labels.add(new Label(0, 0, "�ʲ�����"));
				labels.add(new Label(1, 0, "��ֵ����"));
				labels.add(new Label(2, 0, "������"));
				labels.add(new Label(3, 0, "������"));
				labels.add(new Label(4, 0, "���ʱ��"));
				labels.add(new Label(5, 0, "�ʲ�״̬"));
				labels.add(new Label(6, 0, "��ע��Ϣ"));
				for (Label label : labels) {
					sheet.addCell(label);
				}
				//�м�����
				int rowCount=1;
				for (Resource resource : list) {
					//�����������
					List<Label> resourceInfos=new ArrayList<>();
					resourceInfos.add(new Label(0,rowCount,resource.getName()));
					resourceInfos.add(new Label(1,rowCount,resource.getPhoneNumber()));
					resourceInfos.add(new Label(2,rowCount,resource.getPurchaser()));
					resourceInfos.add(new Label(3,rowCount,resource.getOwner()));
					resourceInfos.add(new Label(4,rowCount,resource.getEntryDate()));
					resourceInfos.add(new Label(5,rowCount,resource.getStatusValue()));
					resourceInfos.add(new Label(6,rowCount,resource.getRemark()));
					for (Label label : resourceInfos) {
						sheet.addCell(label);
					}
					rowCount++;
				}
				// д�����ݲ��ر��ļ�
				book.write();
				book.close();
				File file=new File(filePath+FileUtil.SEPARATOR+fileName);
				return file;
			}//����Ʒ���
			else if(type.getFatherType()==ResourceTypeConfig.CONSUMABLE){
				//��ӱ�ͷ
				List<Label> labels=new ArrayList<>();
				labels.add(new Label(0, 0, "�ʲ�����"));
				labels.add(new Label(1, 0, "������"));
				labels.add(new Label(2, 0, "������"));
				labels.add(new Label(3, 0, "���ʱ��"));
				labels.add(new Label(4, 0, "�ʲ�״̬"));
				labels.add(new Label(5, 0, "��ע��Ϣ"));
				for (Label label : labels) {
					sheet.addCell(label);
				}
				//�м�����
				int rowCount=1;
				for (Resource resource : list) {
					//�����������
					List<Label> resourceInfos=new ArrayList<>();
					resourceInfos.add(new Label(0,rowCount,resource.getName()));
					resourceInfos.add(new Label(1,rowCount,resource.getPurchaser()));
					resourceInfos.add(new Label(2,rowCount,resource.getOwner()));
					resourceInfos.add(new Label(3,rowCount,resource.getEntryDate()));
					resourceInfos.add(new Label(4,rowCount,resource.getStatusValue()));
					resourceInfos.add(new Label(5,rowCount,resource.getRemark()));
					for (Label label : resourceInfos) {
						sheet.addCell(label);
					}
					rowCount++;
				}
				// д�����ݲ��ر��ļ�
				book.write();
				book.close();
				File file=new File(filePath+FileUtil.SEPARATOR+fileName);
				return file;
			}//ͨ���豸
			else{
				//��ӱ�ͷ
				List<Label> labels=new ArrayList<>();
				labels.add(new Label(0, 0, "�ʲ�����"));
				labels.add(new Label(1, 0, "�ʲ��ͺ�"));
				labels.add(new Label(2, 0, "׷����"));
				labels.add(new Label(3, 0, "����׷����"));
				labels.add(new Label(4, 0, "IMEI"));
				labels.add(new Label(5, 0, "���к�"));
				labels.add(new Label(6, 0, "ӵ����"));
				labels.add(new Label(7, 0, "���ʱ��"));
				labels.add(new Label(8, 0, "�ʲ�״̬"));
				labels.add(new Label(9, 0, "��ע��Ϣ"));
				for (Label label : labels) {
					sheet.addCell(label);
				}
				//�м�����
				int rowCount=1;
				for (Resource resource : list) {
					//�����������
					List<Label> resourceInfos=new ArrayList<>();
					resourceInfos.add(new Label(0,rowCount,resource.getName()));
					resourceInfos.add(new Label(1,rowCount,resource.getModel()));
					resourceInfos.add(new Label(2,rowCount,resource.getTrackingNo()));
					resourceInfos.add(new Label(3,rowCount,resource.getTrackingNo2()));
					resourceInfos.add(new Label(4,rowCount,resource.getImei()));
					resourceInfos.add(new Label(5,rowCount,resource.getSerialNo()));
					resourceInfos.add(new Label(6,rowCount,resource.getOwner()));
					resourceInfos.add(new Label(7,rowCount,resource.getEntryDate()));
					resourceInfos.add(new Label(8,rowCount,resource.getStatusValue()));
					resourceInfos.add(new Label(9,rowCount,resource.getRemark()));
					for (Label label : resourceInfos) {
						sheet.addCell(label);
					}
					rowCount++;
				}
				// д�����ݲ��ر��ļ�
				book.write();
				book.close();
				File file=new File(filePath+FileUtil.SEPARATOR+fileName);
				return file;
			}
	}
	
	/**
	 * @return ���ݵ�ǰʱ�䴴��excel�ļ���
	 */
	private String getFileName(String typeName) {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String time = df.format(new Date());
		return typeName + "_" + time + ".xls";
	}

}
