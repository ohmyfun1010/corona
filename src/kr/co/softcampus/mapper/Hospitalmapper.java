package kr.co.softcampus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softcampus.beans.HospitalData;
import kr.co.softcampus.beans.ManagerBean;


public interface Hospitalmapper {
	  @Select("select dates,possible,city,township,hospitalname,address,tel from hospital") 
	  List<HospitalData> getallList();
	  
	  @Insert("insert into hospital(dates,possible,city,township,hospitalname,address,tel) values(#{dates},#{possible},#{city},#{township},#{hospitalname},#{address},#{tel})")
	  void HospitalData(HospitalData hospitalData);
	  
	  @Select("select manager_id,manager_pw from hospitalmanager where manager_id=#{manager_id} and manager_pw=#{manager_pw}")
	  ManagerBean getdata(ManagerBean managerBean);
	  
	  @Delete("delete from hospital where hospitalname =#{hospitalname}")
	  void deletedata(String hospitalname);
	  
	  @Select("select dates,possible,city,township,hospitalname,address,tel from hospital where hospitalname=#{search}")
	  HospitalData gethospitaldata(String search);
	  
	  @Update("update hospital set dates=#{dates},possible=#{possible},city=#{city},township=#{township},hospitalname=#{hospitalname},address=#{address},tel=#{tel} where hospitalname=#{notchangehospitalname}")
	  void updatedata(HospitalData updateHospitalData);
	  
	  @Select("select possible,hospitalname,tel from hospital where city like '%'||#{city}||'%'") 
	  List<HospitalData> getList(String city);
}
