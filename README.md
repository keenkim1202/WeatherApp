# WeatherApp
metaWeather API를 사용하어 만든 날씨앱 입니다.

- MVC 패턴으로 작성하였습니다.
- 39도씨 메인 컬러를 차용하여 UI에 적용하였습니다.

## API
- [metaWeatherAPI](https://www.metaweather.com/api/)

## 사용 라이브러리
- [Alamofire](https://github.com/Alamofire/Alamofire)
  -  HTTTP 통신 처리를 위해 사용하였습니다.
- [Kingfihser](https://github.com/onevcat/Kingfisher)
  - url로부터 이미지를 비동기적으로 처리하기 위해 사용하였습니다.
- [Snapkit](https://github.com/SnapKit/SnapKit)
  - 코드로 AutoLayout을 가독성이 좋은 코드로 작성하기 위해 사용하였습니다.

## 구현 기능
- [x] custom UI 구성
- [x] Model 생성
  - [x] Location : 위치 정보 모델
  - [x] Weather : 날짜별 상세 날씨 정보 모델
- [x] API 통신 처리
  - [x] Location 정보 가져오기
  - [x] Location 정보에 따른 오늘, 내일 날씨 정보 가져오기
  - [x] API 통신 중에 로딩 에니메이션 추가
- [x] 오른쪽 상단에 Refresh 버튼 추가
  - [x] 로딩중일 때는 비활성화

## 실행 영상
<p align="center"><img width="30%" src="https://user-images.githubusercontent.com/59866819/162689439-d1160eac-f13c-43ea-b93f-54a95ccd624a.gif" /></p>
