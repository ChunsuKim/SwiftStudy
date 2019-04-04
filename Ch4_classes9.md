```swift
enum Car : Int {
    case Benz = 0
    case BMW
    case Other
    
    var name : String {
        if self == .Benz {
            return "벤츠"
        } else if self == .BMW {
            return "비.엠.더블유"
        } else {
            return "기타"
        }
    }
    
    func getName() -> String {
        return self.name
    }
}

var car1 = Car.BMW
print("차 이름 : \(car1.name)")

var carName = car1.getName()
print("차 이름 : \(carName)")

출력값) 차 이름 : 비.엠.더블유
출력값) 차 이름 : 비.엠.더블유
```
앞에서 입력한 코드에서 name속성은 열거형 안에서 선택할 수 있는 값 중 하나가 아니라 그 값들을 사용해 새로운 값을 만들어내는 계산 속성이다.
열거형에는 저장 속성을 추가할 수 있으며, 메소드 안에서는 self 키워드를 사용해 열거형 안에 추가한 계산 속성을 참조할 수 있다.
열거형 안에 속성과 메소드를 추가했으므로 car1 이라는 변수에 Car.BMW 를 할당한 후 car1.name 속성의 값을 확인해 보면 name 이라는 계산 속성에서 반환한 값이 출력된다.

name 속성의 값은 열거형의 값 중 하나를 할당할 때 자동으로 같이 할당된다는 것을 이해해야 한다. 열거형 안에 속성을 추가할 수는 있지만 계산 속성만 가능하다고 했다.
그런데 만약 어떤 변수가 열거형 자료로 되어있는데 다른 곳에서 가져온 값과 비교하려고 할 경우에는 열거형 안에 정의한 값과 다르게 만들고 싶을 때도 있다.
스위프트는 이런 경우에 열거형 값을 연결(Association)하는 방식을 사용할 수 있다. 다음 코드를 추가해보자.
```swift
enum CarSize {
    case Small
    case Medium
    case Big
    case Other(Int)
}
```
CarSize 열거형 안에는 Small, Medium, Big 이라는 이름의 세 가지 값이 들어 있다.
그런데 만약 이 세 가지 이외에 다른 크기(예를 들면 준중형을 의미하는 이름)가 들어가야 하고 그 값이 당장 정해져 있지 않다면 Other라는 이름의 값을 넣어둘 수 있다.
그리고 이 값은 변할 수 있어야 한다. 이 경우에 Other라는 이름 뒤에 소괄호를 붙인 후 자료형을 넣어준다. 입력한 코드는 Other라는 값이 정수로 만들어질 수 있도록 한 것이다.
이 열거형으로부터 값을 만들고 값을 비교하는 코드를 다음과 같이 추가한다.
```swift
var size1 = CarSize.Other(10)

let sizeValue = 10

switch size1 {
case .Small:
    print("소형차 크기입니다.")
case .Other(sizeValue):
    print("지정되지 않은 크기 중 \(sizeValue) 입니다.")
default:
    print("알 수 없는 크기입니다.")
}

출력값) 지정되지 않은 크기 중 10 입니다.
```
CarSize 열거형 안에 있는 이름 중에서 Other를 사용해 값을 만들고 싶다면 CarSize.Other 와 함께 소괄호를 붙여준다. 소괄호 안에는 10이라는 정수 값을 넣었다.
이렇게 하면 그 아래에서 switch 문으로 비교할 수 있다. 10이라는 값은 열거형 안에 정의되어 있던 값이 아니라 열거형으로 하나의 값을 만들 때 사용된 것으로, 이 값이 다른 값과 일치하는지 여부를 비교할 수 있다.

지금까지 열거형이 무엇인지 알아보았다. 열거형은 각 항목을 구별하기 위해 사용되므로 코드를 만들 때 자주 사용된다.
특히 열거형으로 만든 값을 if 문이나 switch 문으로 비교할 때 열거형의 이름을 생략한 채 점(.)과 열거형 안에 정의된 이름만으로 비교한다는 점을 잘 기억하기 바란다.

 Quiz 22

가족 구성원을 열거형으로 만들고 하나의 변수에 그 열거형의 값 중 하나를 할당합니다. 그런 다음 if 문 안에서 그 변수의 값이 어떤지 비교하도록 해 보세요,
Family라는 이름의 열거형을 하나 정의합니다. 그리고 하나의 변수를 만든 후 그 열거형의 값 중 하나를 할당합니다. 그리고 if ~ else if ~ else 구문을 사용해 변수의 값을 열거형의 값들과 비교합니다.
```swift
struct Dog {
    var name:String?
    var age:Int = 0
    
    func toString() {
        print("강아지 \(name)의 나이는 \(age)입니다.")
    }
}

var dog1 = Dog(name: "미미", age: 2)
dog1.toString()

출력값) 강아지 Optional("미미")의 나이는 2입니다.
```


[Ch5_array1.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch5_array1.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
