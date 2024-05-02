## 🙈 화면 설명
<hr>

### 🙉개발 화면 캡쳐 및 대략 설명
<br>
1. TabBar의 Home을 선택했을 때 보이는 화면입니다.(지난과제의 내용이었음. But, scroll시 네비게이션바 색상 변하는 것 막는 것 추가)
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/4th_hw_KimMinhyeok/readme_images/homeView1.png?raw=true" width="300"/>
<hr>
2-1. TabBar의 Search를 선택했을 때 보이는 화면입니다.
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/4th_hw_KimMinhyeok/readme_images/searchView1.png?raw=true" width="300"/>
<br>
섹션이 하나인 tableView를 이용하여 구현하였습니다.
<br><br>
2-2. 챌린지 과제인 검색기능에 대한 화면입니다.
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/4th_hw_KimMinhyeok/readme_images/searchView2.png?raw=true" width="300"/>
<br>
검색창에 입력을 할 때마다 즉각적으로 리스트가 보이게 구현: 검색 버튼 누르지 않아도
<hr>
3. TabBar의 ComingSoon을 선택했을 때 보이는 화면입니다. 
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/4th_hw_KimMinhyeok/readme_images/comingSoonView1.png?raw=true" width="300"/>
<br>
해당 데이터들은 TMDB의 title, backdrop, overview, release_date, genre_ids 데이터들을 이용하였습니다.
<hr>
4. TabBar의 Downloads를 선택했을 때 보이는 화면입니다. 
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/4th_hw_KimMinhyeok/readme_images/downloadView1.png?raw=true" width="300"/>
<br>
크게 다른 내용이 없기에 기본적인 UI입니다. UIImageView, UILabel, UIButton을 이용하였습니다. 
<hr>

#### 여기서부터 이번 과제!!
<br>
5. Search 화면의 cell을 클릭했을 때 이동하는 Detail 모달 화면입니다.
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/5th_hw_KimMinhyeok/readme_images/디테일기본.png?raw=true" width="300"/>
<br>
6. 모달 전체 스크롤 기능 화면입니다. (물론 테이블 뷰도 따로 스크롤 가능!)
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/5th_hw_KimMinhyeok/readme_images/스크롤화면.png?raw=true" width="300"/>
<br>
7. 중간에 탭바가 있어서...커스텀 탭바로 해야해서... 인터넷 참고 했습니다 죄송합니다ㅠ 그래도 이동 잘 됌!, 옆으로 스크롤도 됌! 나이스
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/5th_hw_KimMinhyeok/readme_images/탭바이동.png?raw=true" width="300"/>
<br>
8. Youtube API로 헤더 영상에 WebView 넣기
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/5th_hw_KimMinhyeok/readme_images/헤더영상재생.png?raw=true" width="300"/>
<br>
9. 유투브 연결이라 전체화면 자동으로 가능
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/5th_hw_KimMinhyeok/readme_images/헤더영상풀스크린.png?raw=true" width="300"/>
<br>
10. 테이블 뷰에도 동일하게 유투브 연결했음으로 재생 가능 (작게 하면 안에 재생, 프로그래스바 UI가 조금 바뀌는 것 같음. 그래도 나이스)
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/5th_hw_KimMinhyeok/readme_images/테이블뷰영상재생.png?raw=true" width="300"/>
<br>
11. 테이블 뷰의 영상 또한 유투브이므로 전체화면 기능 있음
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/5th_hw_KimMinhyeok/readme_images/테이블뷰영상재생2.png?raw=true" width="300"/>
<br>
12. 모달 형태의 화면전환을 했으므로 우상단에 취소버튼으로 dismiss 기능
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/5th_hw_KimMinhyeok/readme_images/dismiss.png?raw=true" width="300"/>
<hr>

### 🙊사용한 코드 설명 
1. Search Detail (Search tap에서 cell 클릭시 이동)
- 모달창을 이용하기 위해서 present로 이동 // present(searchDetailVC, animated: true)
- var movieTitle: String, var movieSubtitle: String, var movieDescription: String 을 통해 셀 데이터 전달 받음
- ScrollView 로 모달창 전체 스크롤 가능하게 함
2. 탭뷰
- 모달창 안에 탭바를 구현하기 위해, 또한 탭뷰가 상단에 있게 하기 위해 CollectionView 안에 TableView 사용
- 탭바와 탭뷰를 따로 구현하여 isSelected 값을 통해 서로 통신하도록 함
- SnapKit 사용해 봄
- Episodes 탭은 피그마 화면대로 구현하였음. 나머지 탭은 각 탭뷰의 title 만 중앙에 출력하도록 함
3. Episodes 탭뷰 셀
- header 및 Episodes 탭뷰의 각 셀에는 TMDB에서 가져온 제목과 Description, Youtube에서 가져온 영상이 있음
- Youtube 영상을 가져오고 재생하기 위해서 WKWebView을 사용하여 웹(영상 url)을 통해서 가져옴 // webView.load(URLRequest(url: url)), 해당 셀의 제목 + "trailer를 검색하여 가져오게 함

<hr>

### 🙈iOS 화이팅!!!🙈
