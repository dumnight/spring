package myspring.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myspring.user.dao.DatabaseDao;
import myspring.user.vo.DatabaseVO;

@Service("databaseService")
public class DatabaseServiceImpl implements DatabaseService {

	@Autowired
	DatabaseDao databasedao;
	
	@Override
	public List<DatabaseVO> getDatabaseList() {
		return databasedao.readall();
	}
	
	public List<DatabaseVO> getOptionList(String selectlist, String datagr, String areacode1, String areacode2,
			String areacode3, String areacode4, String areacode5, String areacode6, String areacode7, String areacode8,
			String areacode9, String orderdata, String cntdata) {
		return databasedao.optionList(selectlist, datagr, areacode1, areacode2, areacode3, areacode4, areacode5, areacode6, areacode7, areacode8, areacode9, orderdata, cntdata);
	}

	


}
