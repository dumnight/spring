package myspring.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import myspring.user.service.DatabaseService;
import myspring.user.vo.DatabaseVO;

@Controller
public class RestfulDatabaseController {
	@Autowired
	private DatabaseService databaseService;

	@RequestMapping(value = "/database", method = RequestMethod.GET)
	@ResponseBody
	public Map getDatabaseList() {
		List<DatabaseVO> databaseList = databaseService.getDatabaseList();
		Map result = new HashMap();
		result.put("result", Boolean.TRUE);
		result.put("data", databaseList);
		return result;
	}
	
	//database/10/00/1/2/3/4/5/6/7/8/9/f/10001
	@RequestMapping(value = "/database/{selectlist}/{datagr}/{areacode1}/{areacode2}/{areacode3}/"
			+ "{areacode4}/{areacode5}/{areacode6}/{areacode7}/{areacode8}/{areacode9}/{orderdata}/{cntdata}"
			, method = RequestMethod.GET)
	@ResponseBody
	public Map selectOptionList(@PathVariable String selectlist, @PathVariable String datagr, 
			@PathVariable String areacode1, @PathVariable String areacode2
			, @PathVariable String areacode3, @PathVariable String areacode4, 
			@PathVariable String areacode5, @PathVariable String areacode6, 
			@PathVariable String areacode7, @PathVariable String areacode8
			, @PathVariable String areacode9, @PathVariable String orderdata, @PathVariable String cntdata) {
		
		datagr = datagr.equals("empty") ? "" : datagr;
		selectlist = selectlist.equals("empty") ? "" : selectlist;
		                  
		List<DatabaseVO> options = databaseService.getOptionList(selectlist, datagr, areacode1, areacode2, areacode3, areacode4, areacode5, areacode6, areacode7, areacode8, areacode9, orderdata, cntdata);
		Map result = new HashMap();
		result.put("result", Boolean.TRUE);
		result.put("data", options);
		return result;
	}
	
}
