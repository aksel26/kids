package lab.spring.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRegService {

	@Autowired
	private SqlSessionTemplate userSqlSession;
	private UserDAO userDao;

	// 중복 아이디 체크
	public int userIdCheck(String user_id) throws Exception {

		userDao = userSqlSession.getMapper(UserDAO.class);
 
		return userDao.checkOverId(user_id);
	}
}