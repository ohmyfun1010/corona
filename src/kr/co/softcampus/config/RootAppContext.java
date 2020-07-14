package kr.co.softcampus.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.softcampus.beans.ManagerBean;



// 프로젝트 작업시 사용할 bean을 정의하는 클래스
@Configuration
public class RootAppContext {
	@Bean("loginUserBean")
	@SessionScope
	public ManagerBean loginUserBean() {
		return new ManagerBean();
	}
}
