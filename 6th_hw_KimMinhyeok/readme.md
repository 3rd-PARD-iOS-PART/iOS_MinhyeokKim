## 🙈 화면 설명
<hr>

### 🙉개발 화면 캡쳐 및 대략 설명
<br>
1. 홈 화면
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/6th_hw_KimMinhyeok/screenshots/홈 화면.png?raw=true" width="300"/>
- GET "https://pard-host.onrender.com/pard" 를 통해 멤버들을 가져왔고, 테이블 뷰를 통해서 리스트를 나열. 
<br>
- 추가 버튼 -> 데이터 추가 화면 이동
- 테이블 뷰 셀 -> 해당 멤버 상세화면 이동
<br>
<br>
2. 데이터 추가
<div style="display: flex; justify-content: center;">
    <img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/6th_hw_KimMinhyeok/screenshots/데이터 추가1.png?raw=true" style="margin-right: 10px;" width="300"/>
    <img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/6th_hw_KimMinhyeok/screenshots/데이터 추가2.png?raw=true" style="margin-right: 10px;" width="300"/>
    <img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/6th_hw_KimMinhyeok/screenshots/데이터 추가3.png?raw=true" style="margin-right: 10px;" width="300"/>
</div>
- textField valitaion을 통해 빈칸이 있거나 나이가 0보다 크지 않으면 토스트 메시지 출력
<br>
- POST "https://pard-host.onrender.com/pard" 를 통해 데이터베이스에 멤버 추가
<br>
- 추가하기 버튼 -> 홈 화면 되돌아가기 + 홈 화면 데이터 업데이트
<br>
<br>
3. 상세화면
<img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/6th_hw_KimMinhyeok/screenshots/상세화면.png?raw=true" width="300"/>
- 홈 화면에서 상세화면 이동시 멤버 데이터 전달, 상세화면에서 출력
<br>
<br>
4. 데이터 삭제
<div style="display: flex; justify-content: center;">
    <img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/6th_hw_KimMinhyeok/screenshots/데이터 삭제1.png?raw=true" style="margin-right: 10px;" width="300"/>
    <img src="https://github.com/3rd-PARD-iOS-PART/iOS_MinhyeokKim/blob/main/6th_hw_KimMinhyeok/screenshots/데이터 삭제2.png?raw=true" style="margin-right: 10px;" width="300"/>
</div>
- Detete 버튼 -> alert(취소, 확인) 버튼 -> 삭제 or 취소
<br>
- 삭제시 홈화면 되돌아가기 -> 홈 화면 데이터 업데이트
<br>
- Edit은 구현 x
<br>
<hr>

### 🙊사용한 코드 설명 
<br>
1. 화면 전환 및 돌아가기 위해 present(), dismiss() 함수 사용 (modal)
<br>
2. 홈 화면 리스트 구현을 위한 UITableView & UITableViewCell
<br>
3. 데이터 추가 validation 에서 toast를 위해 UIVIew.animate() 함수 사용
<br>
4. 데이터 삭제시 alert창을 위해 UIAlertController(), UIAlertAction() 사용
<br>
5. 데이터 사용을 위해 Urlsession.shared.dataTask 사용
<br>

<hr>

### 🙈iOS 화이팅!!!🙈
