package lab.spring.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import lab.spring.controller.DBConnection;
import lab.spring.model.UserVO; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
 
import javax.naming.NamingException;
 


public interface UserDAO { 



	public List<UserVO> getUserList() throws Exception; 
	public UserVO getUserInfo(String userid) throws Exception; 
	public int insertUser(UserVO userVO) throws Exception; 
	public int updateUser(UserVO userVO) throws Exception; 
	public int checkOverId(String user_id) throws Exception;
	
	
	
    
	}

