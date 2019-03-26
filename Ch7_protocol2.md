#### 프로토콜에 추가할 수 있는 것들

프로토콜은 기본적으로 인터페이스의 역할을 하므로 가장 중요한 것은 메소드 선언이다. 하지만 스위프트는 프로토콜에 속성을 추가할 수도 있고 초기화 메소드를 선언할 수도 있다.
프로토콜에 추가할 수 있는 것들을 정리하면 다음과 같다.
```swift
 1. 메소드 선언
 2. 타입 메소드 선언
 3. 초기화 메소드 선언
 4. 속성 선언(속성의 get, set 행위의 선언)
```
메소드 선언은 이미 알고 있으므로 타입 메소드와 초기화 메소드를 선언하는 코드를 만들어 보겠다. 다음 코드를 입력한다.
```swift
class MyCalculator : Calculator {
    var owner = ""
    
    //var duration : Float = 0.0
    var duration: Float {
        get {
            return 0
        }
        set { }                 // duration 속성
    }
    
    static func getType() -> String {
        return "계산기"
    }
    
    required init(owner: String) {
        self.owner = owner
    }
    
    func add(first a: Int, second b: Int) -> Int {
        return a + b
    }
}

protocol Calculator {
    static func getType() -> String
    init(owner: String)
    func add(first a: Int, second b: Int) -> Int
    
// 시간 정보를 저장할 속성 추가
    var duration : Float { get set }
}
```
프로토콜에는 static 키워드를 사용해 타입 메소드를 선언할 수 있다. 이렇게 선언한 타입 메소드는 클래스에서 똑같은 유형의 타입 메소드로 구현해야 한다.
프로토콜에는 초기화 함수인 init 함수도 선언할 수 있다. 이렇게 하면 클래스에서 동일한 init 함수를 구현해야 하며, init 함수 앞에 required 키워드를 함께 붙여야 한다.
```swift
 * 프로토콜에서 init 함수 선언
 -> init(owner: String)

 * 클래스에서 init 함수 구현
 -> required init(owner: String) { ... }
```
이렇게 구현한 클래스를 사용해 인스턴스 객체를 만들고 add 메소드를 호출하는 코드를 추가한다.
```swift
var calculator : Calculator = MyCalculator(owner: "소녀시대")
var result = calculator.add(first: 10, second: 10)
print("add 결과 -> \(result)")

출력값) add 결과 -> 20
```
코드를 실행하면 위의 출력값 같이 add 메소드를 호출한 결과를 볼 수 있다.

프로토콜 안에는 속성을 선언할 수도 있다. 프로토콜에 속성을 선언할 때는 get, set 중에서 어떤 것이 정의되어야 하는지를 정할 수 있다. 위의 주석처럼 시간 정보를 저장할 속성을 프로토콜에 추가한다.

프로토콜에 속성을 선언하는 형식은 다음과 같다.
```swift
var 변수이름 : 자료형 { get }
var 변수이름 : 자료형 { get set }
```
속성은 get 행위만 하도록 선언할 수도 있고 get, set 행위가 가능하도록 선언할 수도 있다. 이렇게 선언한 속성은 클래스에서 저장 속성이나 계산 소성으로 구현한다.
주의할 점은 프로토콜에서 get 행위만 가능하도록 한 것을 클래스에서 get, set 행위가 가능하도록 할 수는 없다는 것이다. 이것은 코드를 입력하다보면 오류가 표시되므로 쉽게 확인할 수 있다.

프로토콜에 선언된 duration 속성을 MyCalculator 클래스에서 구현한다.

duration 속성은 클래스 안에 저장 속성으로 추가할 수도 있고 계산 속성으로 추가할 수도 있다.

