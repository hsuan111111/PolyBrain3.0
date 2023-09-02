package feature.bookingtast.service;

import java.util.List;
import java.util.Map;

import core.coreService.CoreService;
import feature.bookingtast.dao.TablebookingDAO;
import feature.bookingtast.dao.interf.Tablebooking_interface;
import feature.bookingtast.vo.TablebookingVO;

public class TablebookingService  {
	private Tablebooking_interface dao;

	public TablebookingService() {
		dao = new TablebookingDAO();
	}

	public TablebookingVO addtablebooking(java.sql.Date TABLE_DATE, Integer TABLE_NO, Integer TABLE_MOR,
			Integer TABLE_EVE, Integer TABLE_NIGHT) {

		TablebookingVO tablebookingVO = new TablebookingVO();

		tablebookingVO.setTABLE_DATE(TABLE_DATE);
		tablebookingVO.setTABLE_NO(TABLE_NO);
		tablebookingVO.setTABLE_MOR(TABLE_MOR);
		tablebookingVO.setTABLE_EVE(TABLE_EVE);
		tablebookingVO.setTABLE_NIGHT(TABLE_NIGHT);
		
		dao.insert(tablebookingVO);

		return tablebookingVO;
	}
	public TablebookingVO updatetab( Integer TABLE_BOOK_NO,java.sql.Date TABLE_DATE, Integer TABLE_NO,Integer TABLE_MOR, Integer TABLE_EVE, Integer TABLE_NIGHT) {

		TablebookingVO tablebookingVO = new TablebookingVO();

		tablebookingVO.setTABLE_BOOK_NO(TABLE_BOOK_NO);
		tablebookingVO.setTABLE_DATE(TABLE_DATE);
		tablebookingVO.setTABLE_NO(TABLE_NO);
		tablebookingVO.setTABLE_MOR(TABLE_MOR);
		tablebookingVO.setTABLE_EVE(TABLE_EVE);
		tablebookingVO.setTABLE_NIGHT(TABLE_NIGHT);

		dao.update(tablebookingVO);

		return dao.findByPrimaryKey(TABLE_BOOK_NO);
	}
	public void updatetab(TablebookingVO tablebookingVO) {
		dao.update(tablebookingVO);
	}
	public TablebookingVO getOneTablebooking(Integer TABLE_BOOK_NO) {
		return dao.findByPrimaryKey(TABLE_BOOK_NO);
	}






	public List<TablebookingVO> getAll() {
		return dao.getAll();
	}

	public List<TablebookingVO> getten() {
		return dao.getten();
	}



//	public Set<TablebookingVO> getEmpsByTABLE_DATE(Date TABLE_DATE) {
//		return dao.getOneTablebooking(TABLE_DATE);
//	}


	
	
	
}
