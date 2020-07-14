package kr.co.softcampus.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softcampus.beans.HospitalData;
import kr.co.softcampus.beans.ManagerBean;
import kr.co.softcampus.mapper.Hospitalmapper;
@Repository
public class HospitalDao {
	@Autowired
	private Hospitalmapper hospitalmapper;
	
	public List<HospitalData> getallList(){
		return hospitalmapper.getallList();
	}
	public void HospitalData(HospitalData hospitalData) {
		hospitalmapper.HospitalData(hospitalData);
	}
	public ManagerBean getdata(ManagerBean managerBean) {
		return hospitalmapper.getdata(managerBean);
	}
	public void deletedata(String hospitalname) {
		hospitalmapper.deletedata(hospitalname);
	}
	public HospitalData gethospitaldata(String search)
	{
		return hospitalmapper.gethospitaldata(search);
	}
	/*
	 * public void updatedata(HospitalData updateHospitalData) {
	 * hospitalmapper.updatedata(updateHospitalData); }
	 */
	public List<HospitalData> getList(String city)
	{
		return hospitalmapper.getList(city);
	}
}
