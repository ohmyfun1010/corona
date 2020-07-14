package kr.co.softcampus.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softcampus.beans.HospitalData;
import kr.co.softcampus.beans.ManagerBean;
import kr.co.softcampus.dao.HospitalDao;

@Service
public class Hospitalservice {
	@Autowired
	private HospitalDao hospitalDao;
	
	@Resource(name = "loginUserBean")
	private ManagerBean loginUserBean;
	
	public List<HospitalData> getallList(){
		return hospitalDao.getallList();
	}
	public void HospitalData(HospitalData hospitalData)
	{
		hospitalDao.HospitalData(hospitalData);
	}
	public void getdata(ManagerBean managerBean) {
		ManagerBean mb = hospitalDao.getdata(managerBean);
		if(mb!=null)
		{
			loginUserBean.setManager_id(mb.getManager_id());
			loginUserBean.setManager_pw(mb.getManager_pw());
			loginUserBean.setLogin_check(true);
		}
	}
	public ManagerBean getalldata(ManagerBean managerBean) {
		return hospitalDao.getdata(managerBean);
	}
	public void deletedata(String hospitalname) {
		hospitalDao.deletedata(hospitalname);
	}
	public HospitalData gethospitaldata(String search)
	{
		return hospitalDao.gethospitaldata(search);
	}
	/*
	 * public void updatedata(HospitalData updateHospitalData) {
	 * hospitalDao.updatedata(updateHospitalData); }
	 */
	public List<HospitalData> getList(String city){
		return hospitalDao.getList(city);
	}
}
