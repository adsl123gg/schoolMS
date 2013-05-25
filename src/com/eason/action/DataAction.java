package com.eason.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.eason.pojo.Admin;
import com.eason.pojo.Class;
import com.eason.pojo.Course;
import com.eason.pojo.Data;
import com.eason.pojo.Paper;
import com.eason.pojo.Student;
import com.eason.pojo.Teacher;
import com.eason.pojo.User;
import com.eason.service.AdminService;
import com.eason.service.ClassService;
import com.eason.service.CourseService;
import com.eason.service.DataService;
import com.eason.service.PaperService;
import com.eason.service.StudentService;
import com.eason.service.TeacherService;
import com.eason.service.UserService;
import com.eason.utility.Time;
import com.eason.utility.UUID;

public class DataAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private DataService dataService;
	private UserService userService;
	
	private List<Data> datas;
	
	private File file;
	private String fileFileName;
	private String fileContentType;
	private String code;
	private String title;
	
	private String fileName;
	private String datalist;
	
	@Action(value="adminDataList",results={@Result(name="success",location="/WEB-INF/content/admin_data.jsp")})
	public String dataList(){
		
		datas=dataService.findAll();
		return SUCCESS;
	}
	
	@Action(value="teacherDataList",results={@Result(name="success",location="/WEB-INF/content/teacher_data.jsp")})
	public String teacherDataList(){
		
		datas=dataService.findAll();
		return SUCCESS;
	}
	
	@Action(value="studentDataList",results={@Result(name="success",location="/WEB-INF/content/student_data.jsp")})
	public String studentDataList(){
		
		datas=dataService.findAll();
		return SUCCESS;
	}
	
	
	@Action(value="fileUpload",results={@Result(name="success",type="redirectAction",params={"actionName","${datalist}","code","${code}"}),
			@Result(name="input",type="redirectAction",params={"actionName","${datalist}","code","fileupload_fail"})			
	})
	public String fileUpload() throws Exception{
		
			System.out.println("文件类型：" + fileContentType);
			System.out.println("文件名称：" + fileFileName);
			System.out.println(file.length());
			if (file.length()>=MAXFILELENGTH) {
				setCode(FILEUPLOAD_FAIL);
				return SUCCESS;
			}
			
			String savePath = ServletActionContext.getServletContext().getRealPath("/") + "upload/";
			String savename=UUID.getUUID()+fileFileName.substring(fileFileName.indexOf("."));
			
			try {
				
				InputStream inputStream = new FileInputStream(file);
				OutputStream outputStream = new FileOutputStream(new File(savePath+savename));
				
				byte[] buffer = new byte[1024];
				int len = -1;
				while((len = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, len);
				}
				
				outputStream.flush();
				outputStream.close();
				inputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
				setCode(FILEUPLOAD_FAIL);
				return SUCCESS;
			}
			
			User user=(User) session.get("user");
			System.out.println(user.getId());
			user=userService.findById(user.getId());
			
			Data data=new Data();
			data.setFilename(fileFileName);
			data.setSavename(savename);
			data.setCreatetime(Time.getTime());
			data.setUser(user);
			
			dataService.save(data);
			
			if ("student".equals(user.getRole())) {
				setDatalist("studentDataList");
			}else if ("teacher".equals(user.getRole())) {
				setDatalist("teacherDataList");
			}else if ("admin".equals(user.getRole())) {
				setDatalist("adminDataList");
			}
			
			setCode(FILEUPLOAD_SUCCESS);
			return SUCCESS;
	}
	
	public String download() throws Exception {
		System.out.println(fileName);
		return SUCCESS;
	}
	
	public InputStream getInputStream() throws Exception {
		//获取downloadfile文件夹中的文件
		String filePath = ServletActionContext.getServletContext().getRealPath("/") + "upload/" + fileName;
		fileFileName=dataService.findNameBySavename(fileName);
		
		fileFileName=new String(fileFileName.getBytes("UTF-8"), "iso8859-1");
		title="attachment;filename=\""+fileFileName+"\"";
		
		InputStream stream = new FileInputStream(new File(filePath));
		return stream;
	}

	@Autowired
	public void setDataService(DataService dataService) {
		this.dataService = dataService;
	}

	public List<Data> getDatas() {
		return datas;
	}

	public void setDatas(List<Data> datas) {
		this.datas = datas;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getDatalist() {
		return datalist;
	}

	public void setDatalist(String datalist) {
		this.datalist = datalist;
	}
	
	
}
