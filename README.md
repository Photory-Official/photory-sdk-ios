# PhotorySDK

### 개발 환경
* iOS 15.0 이상
* framework방식으로 사용할 수 있도록 제작

## 🍀 구현해야 하는 것들 🍀
 - ✅: App에서 구현이 온전히 된 케이스 <br>
 - 🌙: App에서 구현되었으나 SDK에서 구현되지 않은 부분 <br>
 - 🍑: App에서 구현되지 않았으나 SDK에서 구현된 부분 <br>
 
```
 - Auth
  - SignUp
    - EmailValidation (이메일 중복 확인)
    - SendVerificationMail (이메일 인증번호 전송) 
    - AuthKeyValidation (이메일 인증번호 확인) 
   - SignIn
    - SignIn (로그인)
    - SignInToken (로그인 유지)
 - Room
   - RoomDetail (해당 방 정보 상세보기)
   - RoomList (방 리스트 가져오기)
   - RoomCreate (방 생성)
   - RoomEnter (방 입장)
   - RoomPassword (방 비밀번호 변경)
   - RoomDisable (방 삭제)
   - RoomLeave (방 나가기)
   - RoomOwner (방 오너 변경)
   - RoomKick (방 강퇴)
  - Feed
   - FeedDelete (피드 삭제)
   - FeedCreate (피드 생성)
   - FeedUpdate (피드 수정)
   - FeedDetail (피드 읽기)
   - FeedList (피드 리스트)
    
```
 
 ## 🚨 프로젝트 ISSUE
 ```
  - App 화면 전환 로직
    - 로그인 성공 시, AuthView에서 HomeView로 이동
    : SceneDelgate의 window를 교체하는 방식으로 구현 예정
  - 피드의 경우에는 현재 SDK의 multipart/form-data 구현의 문제로 불완전한 상태
  : SDK 완성하면 바로 적용 가능
  
 ```
