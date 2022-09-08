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
    - SendVerificationMail (이메일 인증) 
   - 방 초대 ✅ㅋㅗ드
   - 방 초대 ✅
```
 
 ## 🚨 프로젝트 ISSUE
 ```
  - App 화면 전환 로직
    - 로그인 성공 시, AuthView에서 HomeView로 이동
    : SceneDelgate의 window를 교체하는 방식으로 구현 예정
  - 피드의 경우에는 현재 SDK의 multipart/form-data 구현의 문제로 불완전한 상태
  : SDK 완성하면 바로 적용 가능
  
 ```
