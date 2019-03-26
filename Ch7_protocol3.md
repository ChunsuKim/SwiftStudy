#### 프로토콜의 상속

프로토콜도 클래스처럼 상속할 수 있다. 프로토콜을 상속하는 코드를 입력한다.
```swift
protocol Product {
    func getProductName() -> String
}

protocol Calculator : Product {
    func add(first a: Int, second b: Int) -> Int
}

class MyCalculator : Calculator {
    func getProductName() -> String {
        return "내 계산기"
    }
    func add(first a: Int, second b: Int) -> Int {
        return a + b
    }
}

var calculator : Calculator = MyCalculator()
print("제품명 : \(calculator.getProductName())")

출력값) 제품명 : 내 계산기
```
프로토콜은 객체 지향에서 말하는 인터페이스 역할을 하기 때문에 클래스를 정의할 때 주로 사용된다.
따라서 스위프트에서도 구조체나 열거형에 사용할 수 없도록 하고 클래스에서만 전용으로 사용하도록 만들 수 있다.
프로토콜을 정의할 때 class 키워드를 프로토콜 이름 뒤에 붙이면 클래스 전용 프로토콜이 되어 클래스에서만 사용할 수 있다.
```swift
protocol 프로토콜이름 : class { ... }
```
만약 다른 프로토콜을 상속하면서 클래스 전용 프로토콜로 만들고 싶다면 class 키워드 뒤에 콤마(,)를 붙인 후 부모 프로토콜을 넣어준다.
```swift
protocol 프로토콜이름 : class, 부모프로토콜1, 부모프로토콜2, ... { ... }
```
지금까지 프로토콜에 대해 알아보았다. 프로토콜은 실제 인스턴스 객체가 갖고 있는 속성이나 메소드가 무엇인지 구체적으로 알지 못해도 어떤 것들이 선언되어 있는지 알 수 있도록 하므로 실제 코드를 만들 때 자주 사용된다.

Quiz 33

Thinkable 이라는 이름의 프로토콜을 만들고 Student 클래스가 Person 클래스를 상속하면서 동시에 Thinkable 프로토콜을 구현하도록 만들어 보세요.
Thinkable 프로토콜에는 think라는 이름의 메소드와 init 초기화 함수를 정의합니다. 그리고 Person 클래스에는 사람 이름과 전화번호를 속성으로 넣어 둡니다.
Student 클래스는 Person 클래스를 상속하면서 동시에 Thinkable 프로토콜을 구현하도록 만듭니다. Student 클래스 안에 구현한 think 메소드를 호출하면 메시지를 출력하도록 합니다.
```swift
class Person {
    var name: String?
    var mobile: String?
    
    init(name: String, mobile: String) {
        self.name = name
        self.mobile = mobile
    }
}

protocol Thinkable {
    func think()
    init(name: String, mobile: String)
}

class Student: Person, Thinkable {
    override required init(name: String, mobile: String) {
        super.init(name: name, mobile: mobile)
    }
    
    func think() {
        print("학생 \(self.name!)이(가) 생각합니다.")
    }
}

var student1:Thinkable = Student(name: "김현수", mobile: "010-1000-1000")
student1.think()

출력값) 학생 김현수이(가) 생각합니다.
```

