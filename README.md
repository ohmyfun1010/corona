

## 개요

<img src="https://user-images.githubusercontent.com/62956948/90328332-8bd1cf80-dfd6-11ea-8906-26d8a4a177ca.png" width="400">

본 프로젝트는 전국의 선별진료소의 위치와 정보를 알려주는 웹 사이트 입니다.<br>
개발 목적은 대한민국 시민들에게 코로나 환자들이 격리된 진료소가 아닌 안전한 선별진료소의 위치와 정보를 알려주기 위해 제작하였습니다.

<br>

### 개발 인원

1명

<br>

### 구현 기능

     - 관리자 로그인
     - 지역별 진료소의 데이터를 가져오기 위한 검색 기능
     - CRUD
     - 카카오 API 연동
     

<br>

### 개발 도구

     - Jdk : 8 버전
     - Spring framework : spring 5
     - 웹서버 : Apache
     - WAS : Tomcat 9.0
     - Maven : 3.2.1
     - DBMS : ORACLE 11g
<br>



<br>

## 개발 일지

- 2020\. 07. 08: 프로젝트 기획

- ~ 2020\. 07. 09: 공공포털 사이트의 진료소 데이터를 테이블에 적재 시킨 후 table형식으로 데이터 출력 

- ~ 2020\. 07. 10: 카카오 map api 키워드 발급받은 후 연동

- ~ 2020\. 07. 11: 관리자 로그인 기능 구현

- ~ 2020\. 07. 12: 진료소 데이터 crud기능 구현

- ~ 2020\. 07. 14: 지역별 진료소의 데이터를 가져오기 위한 검색 기능 구현

- ~ 2020\. 07. 15: 1차 버전 개발 완료 

<br>

## 웹 소개

### 대한민국 안전 선별진료소 위치 및 정보 알리미 웹 페이지

- 공공 포털 사이트의 선별 진료소 데이터를 가져와 테이블에 적재 시킨 후 그 테이블을 모두 출력시켜줍니다.
- 사용자는 출력된 데이터의 진료소 이름을 클릭할 수 있으며 클릭과 동시에 선별 진료소의 위치와 정보가 나타납니다.
- 사용자가 자신이 거주하는 지역의 선별 진료소만을 검색하고 싶을 땐 검색페이지로 이동한 후 자신의 거주지역을 입력합니다, 그러면 입력된 지역의 선별진료소 데이터만 출력됩니다.
- 선별 진료소가 만약 추가된다면 관리자만이 추가 삭제 수정 할 수 있도록 구현하였습니다.



<br><br>


### 화면 구성

#### **메인 화면**

<img src="https://user-images.githubusercontent.com/62956948/90328356-b9b71400-dfd6-11ea-95b1-53365396c2cb.png" width="1300">

<br><br>

#### **관리자 로그인 팝업**

<img src="https://user-images.githubusercontent.com/62956948/90328476-9ccf1080-dfd7-11ea-9eb1-4be825164fc9.PNG" width="1300">

<br><br>

#### **관리자전용(새 진료소 등록)**

<img src="https://user-images.githubusercontent.com/62956948/90328483-a0629780-dfd7-11ea-9355-4d1f28da0e1b.PNG" width="1300">

<br><br>

#### **관리자전용(진료소 수정,삭제)**

<img src="https://user-images.githubusercontent.com/62956948/90328486-a3f61e80-dfd7-11ea-8592-b0974df271d1.png" width="1300">

<br><br>

#### **지역별 선별진료소 검색 화면**

<img src="https://user-images.githubusercontent.com/62956948/90328533-03542e80-dfd8-11ea-839e-30736c107f1c.png" width="1300">

<br><br>

#### **검색 결과**

<img src="https://user-images.githubusercontent.com/62956948/90329182-5f6d8180-dfdd-11ea-945b-c5b7bf16b6e4.jpg" width="1300">

<br><br>





