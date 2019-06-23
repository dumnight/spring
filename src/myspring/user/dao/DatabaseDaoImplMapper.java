package myspring.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myspring.user.vo.DatabaseVO;

@Repository("databaseDao")
public class DatabaseDaoImplMapper implements DatabaseDao {
	@Autowired
	private DatabaseMapper databaseMapper;

	@Override
	public List<DatabaseVO> readall() {
		List<DatabaseVO> databaseList = databaseMapper.selectDatabaseList();
		return databaseList;
	}

	@Override
	public List<DatabaseVO> optionList(String selectlist, String datagr, String areacode1, String areacode2,
			String areacode3, String areacode4, String areacode5, String areacode6, String areacode7, String areacode8,
			String areacode9, String orderdata, String cntdata) {
		List<DatabaseVO> databaseList = databaseMapper.selectOptionList(selectlist, datagr, areacode1, areacode2, areacode3, areacode4, areacode5, areacode6, areacode7, areacode8, areacode9, orderdata, cntdata);
		return databaseList;
	}
	
	
}










