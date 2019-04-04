#### 열거형을 조금 다르게 만들어 사용하기

앞에서 익혔던 것처럼 열거형을 정의할 때 enum 과 case 키워드를 사용하고 case 뒤에 각각의 값을 위한 이름을 붙인다. 그런데 조금 다르게 만들 수도 있다.
열거형을 만들 때 각각의 값이 가지는 자료형을 명시할 수도 있고 각각의 값에 숫자를 할당할 수도 있기 때문이다.
다른 언어에서는 열거형을 만들 때 각각의 값으로 정수 값을 할당하는 경우가 많다. 하지만 스위프트는 열거형 안에 들어 있는 각각의 원소에 정수뿐만 아니라 문자열 등을 할당할 수 있다.

Car와 CarSize라는 이름의 열거형을 정의해보겠다.
```swift
enum Car : Int {
    case Benz = 0
    case BMW
    case Other
}

enum CarSize : String {
    case Small = "소형"
    case Medium = "중형"
    case Big = "대형"
}
```
Car 열거형은 이름 뒤에 콜론(:)과 함께 Int 자료형을 붙여 중괄호 안에서 선언하는 각각의 값들이 정수 값을 가질 수 있게 했다.
이런 경우, 첫 번째 case 뒤에 오는 값에만 0을 할당하면 나머지 case는 자동으로 1씩 증가된 정수 값을 갖게 된다. CarSize 열거형을 정의할 때는 String 자료형을 붙였다.
이렇게 하면 case 뒤에 오는 각각의 값들이 문자열 값을 가질 수 있다.

이렇게 정의한 열거형으로 값을 만들어 변수에 할당할 때는 다음 코드처럼 작성할 수 있다.
```swift
var car1 = Car(rawValue: 0)!
var size1 = CarSize(rawValue: "소형")!

print("자동차 구분 값 : \(car1.rawValue)")
print("자동차 크기 구분 값 : \(size1.rawValue)")

출력값) 자동차 구분 값 : 0
출력값) 자동차 크기 구분 값 : 소형
```
Car 열거형으로 된 값은 이름 뒤에 소괄호를 붙이고 소괄호 안에 파라미터 값을 넣어 만든다. 즉, 클래스로부터 인스턴스 객체를 만드는 것과 똑같은 형태로 만들 수 있다.
여기서는 Car 열거형의 값을 만들면서 rawValue라는 파라미터를 넣었는데 rawValue는 열거형 안에 들어 있는 각각의 값을 사용한다는 의미이다.
값을 넣어 열거형을 만들 때 사용하는 코드 형태는 다음과 같다.
```swift
열거형이름(rawValue: 열거형값)
```
그런데 열거형으로 값을 만들 때 열거형 안에 정의해 놓지 않은 값을 전달할 때는 nil이 반환될 수 있다. 따라서 변수는 nil을 가질 수 있어야 한다.
이 때문에 car1 변수는 옵셔널 자료형으로 선언하거나 또는 뒤에 느낌표(!)를 붙여 강제로 옵셔널을 해제해야 한다. 여기서는 뒤에 느낌표를 붙여 옵셔널을 해제했다.

CarSize 열거형에 들어가는 값들은 문자열을 값으로 가지도록 정의했으며 case 뒤에 오는 각각의 값에 문자열을 할당했다. 열거형으로 만든 값은 다음과 같이 각각의 rawValue 값을 확인할 수 있다.
```swift
열거형변수이름.rawValue
```


[Ch4_classes9.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch4_classes9.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
