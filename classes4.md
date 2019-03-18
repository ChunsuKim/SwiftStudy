#### 계산 속성

이번에는 일반적인 저장 속성이 아닌 계산 속성을 만들어 보겠다. 계산 속성은 속성 이름 뒤에 중괄호로 된 블록을 만든 후 그 안에 get 구문과 set 구문을 추가하는 형식으로 만든다.
계산 속성은 여러 변수에 들어 있는 값을 사용해 새로운 값을 만들어서 가져오고 싶을 때 사용할 수 있다. 여기서는 키와 몸무게를 사용해 BMI(체질량 지수)를 계산하는 속성으로 만들어 보겠다.
BMI를 계산하는 공식은 다음과 같다.
```swift
체질량 지수(BMI) = 체중(kg) / 키(m)^2
```
BMI 값을 사용해 체중을 평가하는 기준은 18.5 미만이면 체중 부족, 18.5 ~ 22.9이면 정상, 23.0 ~ 24.9이면 과체중, 25.0이상이면 비만이다.
```swift
class Person {
    var name : String?
    var height : Float?
    var weight : Float?
    init(name:String, height:Float, weight:Float) {
        self.name = name
        self.height = height
        self.weight = weight
    }
    var bmi : Float {
        get {
            return weight! / (height! * 2)
        }
        set(bmi) {
            if bmi < 20 {
                height = 1.7
                weight = 50
            } else if bmi >= 20 {
                height = 1.65
                weight = 64
            }
        }
    }
}

var person01 = Person(name: "철수", height: 1.7, weight: 49.5)
print("BMI 값 -> \(person01.bmi)")

person01.bmi = 18
print("BMI 값 -> \(person01.bmi)")

person01.bmi = 22
print("BMI 값 -> \(person01.bmi)")

출력값) BMI 값 -> 14.558824
출력값) BMI 값 -> 14.705882
출력값) BMI 값 -> 19.39394
```
Person 클래스를 만들면서 name, height, weight 변수를 추가했다. 이 변수들은 값이 없어도 문제가 생기지 않도록 옵셔널 자료형으로 선언했다.
초기화 함수인 init에는 이름, 키, 몸무게가 파라미터로 전달되고 이 파라미터 값들은 self 키워드를 사용해서 클래스 안에 선언한 변수들에 할당된다.

그 아래에는 bmi라는 이름의 계산 속성이 들어 있다. var 뒤에 속성의 이름이 있고 콜론(:) 뒤에 자료형이 있으니 여기까지는 일반적인 변수 선언과 다를 바 없다.
그러나 그 뒤에 중괄호가 오고 중괄호 안에 코드가 들어 있다는 점이 다르다. 보통 중괄호를 사용하는 것은 함수인데, 함수가 아닌 변수를 선언할 때 중괄호와 코드가 사용된 것이다.
이 중괄호 안에 들어 있는 코드를 보면 함수 안에 들어가는 코드와 다르다. 중괄호 안에는 get과 set이 들어있고 get의 뒤에는 중괄호로 감싼 코드가 있다.
중괄호로 감싸져 있는 코드를 '코드 블록(Code Block)'이라고도 하는데, 이 블록 안에 있는 코드에서는 BMI 값을 계산한 후 그 값을 반환한다.
set 뒤에는 소괄호와 함께 bmi라는 이름이 들어 있다.
이것은 bmi 계산 속성으로 값이 들어온다는 것을 의미하며, 그 뒤에 있는 중괄호로 된 블록 안에서는 전달 받은 값이 20보다 작은지 또는 크거나 같은지를 비교한 후 height와 weight 변수에 값을 할당한다.
이렇게 Person 클래스 안에 선언한 계산 속성을 사용하는 코드는 위에와 같다.

Person 클래스를 사용해 인스턴스 객체를 만들 때는 세 개의 파라미터를 전달한다. 그리고 새로 만든 객체의 bmi 속성을 확인하면 계산 속성의 get 안에 들어 있는 코드가 실행되면서 계산된 BMI 값이 반환된다.
만약 BMI 값을 계산 속성에 할당하면 set 안에 들어 있는 코드가 실행되면서 height와 weight 변수에 새로운 값이 할당된다.

만약 계산 속성을 사용하지 않는다면 BMI를 계산하는 함수를 별도로 만들어야 한다. 따라서 계산 속성을 사용하면 별도의 함수를 만들 때보다 더 단순한 코드를 만들 수 있다.


#### 속성 옵저버

이번에는 속성 옵저버를 사용해 보겠다. '속성 옵저버(Property Observer)'는 속성의 값이 바뀔 때 반응하는 객체를 말한다.
즉, 새로운 값이 속성에 할당되면 자동으로 호출된다. 속성 옵저버에는 다음처럼 두 가지 종류가 있다.

> * **willSet -> 속성에 값이 할당되기 바로 전에 호출된다.**
>
> * **didSet -> 속성에 값이 할당된 직후에 호출된다.**

willSet은 속성에 값이 할당되기 전에 호출되고 didSet은 속성에 값이 할당된 후에 호출된다.
willSet 옵저버 내부에서는 새로 할당된 값이 파라미터로 전달되므로 어떤 값이 속성에 할당될 것인지 미리 알 수 있다.
만약 willSet 뒤에 소괄호를 붙이고 파라미터 이름을 정의하면 파라미터로 전달된 값을 받아 처리할 수 있다.
그리고 별도의 파라미터로 정의하지 않고 파라미터로 전달된 값을 받아 처리하고 싶다면 newValue라는 이름으로 참조할 수 있다.
didSet 옵저버의 경우에는 속성에 할당된 값을 oldValue라는 이름으로 참조할 수 있다.
```swift
class Person1 {
    var name : String?
    var height : Float?
    var weight : Float?
    
    init(name:String, height:Float, weight:Float) {
        self.name = name
        self.height = height
        self.weight = weight
    }
    
    var bmi : Float = 0.0 {
        willSet(bmi) {
            print("bmi willSet 호출됨 -> \(bmi)")
        }
        didSet {
            print("bmi didSet 호출됨 -> \(bmi), \(oldValue)")
        }
    }
}

var person02 = Person1(name: "철수", height: 1.7, weight: 49.5)
print("BMI 값 -> \(person01.bmi)")

person01.bmi = 18
print("BMI 값 -> \(person01.bmi)")

person01.bmi = 22
print("BMI 값 -> \(person01.bmi)")

출력값) BMI 값 -> 19.39394
출력값) BMI 값 -> 14.705882
출력값) BMI 값 -> 19.39394
```
bmi 변수는 Float 자료형으로 선언되었으며 그 뒤에 = 기호를 붙인 후 0.0이라는 값으로 초기 값을 할당했다.
그리고 그 뒤에 중괄호를 붙인 후 중괄호 안에 willSet과 didSet이라는 속성 옵저버를 포함시켰다. willSet은 전달되는 파라미터를 bmi라는 이름으로 정의했다.
따라서 새로 할당될 bmi 값은 bmi라는 이름으로 참조할 수 있다. didSet은 파라미터를 정의하지 않았으므로 그 안에서 기존 값을 참조할 때 oldValue라는 이름을 사용한다.

속성 옵저버는 어떤 용도로 사용할 수 있을까?
속성 옵저버는 어떤 속성에 값을 넣기 전이나 후에 필요한 작업을 할 수 있으므로 예상하지 못했던 값이 속성에 할당되는지 감시하다가 잘못된 값이 들어오면 오류가 발생하지 않도록 만들 수 있다.
