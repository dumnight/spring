package myspring.user.dao;
import java.util.List;

import myspring.user.vo.DatabaseVO;

@MyMapper
public interface DatabaseMapper {

	List<DatabaseVO> selectDatabaseList();
	List<DatabaseVO> selectOptionList(String selectlist, String datagr, String areacode1 ,String areacode2
			,String areacode3,String areacode4,String areacode5,String areacode6,String areacode7,String areacode8
			,String areacode9,String orderdata,String cntdata);

}

