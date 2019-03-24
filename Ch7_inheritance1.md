# 상속과 프로토콜이 무엇인지 알아보기

### 1_상속이란 무엇일까?

**스위프트가 어떤 언어인지를 한 마디로 정리하면 '함수를 일급 객체로 취급하는 객체 지향 언어'라고 말할 수 있다.**
물론 다른 특징들이 많으므로 다른 말로 정리할 수도 있지만 그만큼 일급 객체라는 말이 중요하다는 뜻이다. 함수를 일급 객체로 다루면 함수를 변수에 할당할 수 있다.
그리고 객체 지향 언어이기 때문에 클래스를 먼저 정의하고 그 클래스로부터 인스턴스 객체를 만들 수 있다는 것도 알고 있다. 일반적인 객체 지향 언어에서 볼 수 있는 가장 중요한 특징들을 다시 정리하면 다음과 같다.

> * 객체를 만드는 틀인 클래스나 템플릿을 정의할 수 있다.
>
> * 클래스라는 틀을 한 번 만들면 그 클래스로부터 새로운 객체를 여러 개 만들 수 있다.
>
> * 클래스는 다른 클래스가 가지는 속성이나 함수를 그대로 상속할 수 있다.

첫 번째 특징은 이미 클래스를 만들어 보았기 때문에 잘 알고 있다. 그리고 두 번째 특징 역시 클래스로부터 인스턴스 객체를 만들어 보았기 때문에 어떻게 코드를 만드는지도 알고 있다.
그렇다면 이번에는 세 번째 특징인 상속을 살펴볼 차례이다.


#### 상속의 의미

'상속(Inheritance)'이란 말은 많이 들어보았을 것이다. 재산 상속이라는 말을 특히 많이 들어보았을 텐데, 이때 사용하는 상속이라는 용어는 한 마디로 '재산을 물려준다.'는 뜻이다.
객체 지향에서 말하는 상속이라는 것도 이 말의 의미와 다르지 않다.

![그림](https://user-images.githubusercontent.com/47494240/54877162-28358800-4e5e-11e9-8c21-f1d53fccfe0a.png)

그런데 프로그램을 만드는 과정에서 '상속'이라는 기능을 사용한다는 것은 도대체 누가 누구한테 무엇을 물려준다는 말일까?
붕어빵 틀의 역할을 하는 것이 클래스인데 이미 만들어 둔 클래스에서 다른 클래스로 속성을 물려주는 것을 상속이라고 한다.
예를 들어, 사람을 묶어두는 Person 클래스를 미리 만들어 놓았을 때 학생을 표현하는 Student를 만들고 싶다면 학생도 사람이므로 처음부터 클래스의 모든 코드를 새로 정의하는 것은 비효율적이다.
따라서 Person이 가지고 있는 속성이나 함수들을 물려받아 Student 클래스를 만드는 것이 더 좋은 방법이라고 할 수 있다.

![그림](https://user-images.githubusercontent.com/47494240/54877163-28358800-4e5e-11e9-963c-71aed507f053.png)

상속 기능을 사용할 때 Person처럼 물려주는 쪽을 '부모 클래스' 또는 '상위 클래스'라고 한다. 그리고 Student처럼 물려받는 쪽을 '자식 클래스' 또는 '하위 클래스'라고 한다.
스위프트는 '단일 상속'을 지원한다. 즉, 부모 클래스가 여러 개일 수 없고 하나만 상속할 수 있다.
물론 상속 받은 부모 클래스가 또 다른 클래스를 상속했다면 수직으로 계속 상속 받는 구조를 만들 수 있다.
예를 들어, 일반적인 사람을 아기, 유아, 어린이, 청소년, 성인 등으로 분류할 때 이들은 모두 사람이라고 할 수 있으므로 사람으로부터 상속하여 아기나 유아 또는 어린이 등을 나타내는 클래스를 만들 수 있다.

상속이 무엇인지 알게 되었으니 Person을 상속하여 Baby라는 클래스를 만들어 보겠다. 다음 코드를 입력한다.
```swift
class Person {
    var name : String!
    var age : Int!
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
    func toString() -> String {
        return "Person {\(name), \(age)}"
    }
}
```
Person 클래스에는 name과 age 변수가 속성으로 추가되었다. 클래스 안에 추가되는 속성은 일반 저장 속성인 경우 항상 초기 값을 가지고 있어야 하므로 nil 값을 가질 수 있도록 변수 뒤에 느낌표(!)를 추가했다.
그리고 이 클래스로부터 인스턴스 객체를 만들 때 호출되는 초기화 함수를 init이라는 이름으로 추가했다. 초기화 함수는 반환 자료형을 명시하지 않는다는 것을 기억할 것이다.
초기화 함수에서는 name과 age라는 이름의 파라미터를 전달 받았으며 self 키워드를 사용해 name 변수와 age 변수의 값으로 할당했다.
또한 toString 이라는 이름의 함수도 추가되었는데 이 함수는 필요할 때 호출하면 name 과 age 속성의 값을 확인할 수 있도록 도와준다.

이제 이 Person 클래스를 상속하여 Baby 클래스를 만들려고 한다. 스위프트에서 클래스를 상속할 때는 다음과 같은 형식을 사용한다.
```swift
class 클래스이름 : 부모클래스이름 {
  ...
}
```
class 키워드 뒤에 클래스 이름이 있으면 그 뒤에 콜론(:)을 붙인 후 부모클래스 이름을 명시한다. 다음과 같이 Baby 클래스를 정의한다.

```swift
class Baby : Person {
}
```
Baby 클래스에는 아무런 코드도 들어 있지 않지만 실제로는 Person 클래스가 가지고 있는 속성과 초기화 함수 그리고 함수들을 그대로 상속 받아 가지고 있게 된다.
Baby 클래스를 정의했으니 이 클래스로부터 인스턴스 객체를 만들 수 있다. 다음 코드처럼 Person 클래스로부터 인스턴스 객체를 만드는 코드와 Baby 클래스로부터 인스턴스 객체를 만드는 코드를 추가한다.
```swift
var person1 = Person(name: "소녀시대", age: 20)
print("person1 정보 -> \(person1.toString())")

var baby1 = Baby(name: "걸스데이", age: 22)
print("baby1 정보 -> \(baby1.toString())")

출력값) person1 정보 -> Person {Optional("소녀시대"), Optional(20)}
      baby1 정보 -> Person {Optional("걸스데이"), Optional(22)}
```
코드를 실행하면 person1 변수와 baby1 변수에 할당된 객체들의 정보를 확인할 수 있다.

이렇게 Person 클래스의 속성을 상속한 Baby 클래스는 Person 클래스의 모든 속성을 갖게 된다.


#### 클래스의 초기화 함수 정리하기

그런데 여기서 초기화 함수를 좀 더 자세히 살펴볼 필요가 있다. 왜냐하면 Baby 클래스에서 초기화 함수를 다시 만들거나 새로운 초기화 함수를 추가하고 싶을 수도 있기 때문이다.

스위프트는 클래스 안에 들어 있는 속성들의 초기 값을 모두 초기화하도록 강제하고 있다.
따라서 클래스 안에 변수를 선언하고 초기 값을 지정하지 않았다면 초기화 함수인 init 안에서 그 변수들에 초기 값을 할당해야 한다.

이미 알고 있듯이 초기화 함수는 init이라는 이름을 가지는데 func 키워드를 붙이지 않고 반환 값도 없다.
```swift
init() {
  코드
}
```
클래스에는 다양한 상황에서 인스턴스 객체를 편하게 만들 수 있도록 파라미터를 전달 받는 초기호 함수를 여러 개 작성하기도 한다.
그중에서 초기화가 필요한 모든 속성의 초기 값을 설정하는 초기화 함수를 '전체 초기화 함수(Designated Initializer)'라고 한다.
그리고 일부 속성만 초기화하는 초기화 함수를 '부분 초기화 함수(Convenience Initializer)'라고 한다. 초기화가 필요한 클래스는 반드시 한 개 이상의 전체 초기화 함수를 갖고 있어야 한다.

전체 초기화 함수는 초기화가 필요한 속성에 초기 값을 할당하는 코드가 먼저 실행되도록 해야 한다. 그다음 다른 작업을 수행하는 코드가 들어갈 수 있다.

다음 코드처럼 직사각형을 나타내는 Retangle 클래스를 만들어 보겠다.
```swift
class Rectangle {
    var width : Int
    var height : Int
    
    init (width: Int, height: Int) {
        self.width = width
        self.height = height
        show()
    }
    
    func show() {
        print("Retangle {\(width), \(height)}")
    }
}
```
Rectangle 클래스 안에 들어 있는 width 와 height 변수는 저장 속성으로 추가되었으며 초기 값이 없다. 따라서 이 두 속성은 초기화 함수인 init 안에서 초기화되어야 한다,
여기에서는 init 함수에서 두 개의 파라미터를 전달 받은 후 width 와 height 속성의 초기 값을 설정하도록 했다.
그런데 클래스 안에 추가한 show 메소드를 호출하는 코드를 변수의 값을 초기화하는 코드 이전에 넣으면 오류가 표시된다.
예를 들어, show 메소드의 이름을 toString으로 바꾼 후 init 초기화 함수안의 가장 첫 줄에 넣으면 다음과 같이 오류 메시지가 나타난다.

![그림](https://user-images.githubusercontent.com/47494240/54877164-28ce1e80-4e5e-11e9-8fd4-32a0d5f1caa0.png)

결국 Rectangle 클래스로부터 새로운 인스턴스 객체를 만들 때 show 메소드가 함께 호출되게 하려면 초기화 함수의 가장 마지막 부분에서 show 메소드를 호출해야 한다.

전체 초기화 함수와 달리 부분 초기화 함수는 초기화가 필요한 모든 속성의 초기 값을 설정하지 않는다. 그런데 앞에서도 언급한 것처럼 **스위프트의 클래스는 반드시 모든 속성이 초기화가 되어야 한다는 규칙이 있다.**
따라서 부분 초기화 함수가 호출되었을 때는 나머지 초기화를 다른 메소드가 진행하도록 해야 한다. 이것을 '초기화 메소드 위임(Initializer Delegation)'이라고 한다.
일반적으로는 부분 초기화 함수를 호출했을 때 그 함수 안에서 다시 전체 초기화 함수나 다른 부분 초기화 함수를 호출하는 경우가 많다.

부분 초기화 함수는 앞에 convenience 지시자를 붙인다. 형식은 다음과 같다.
```swift
convenience init(파라미터) {
  같은 클래스에 들어 있는 전체 초기화 함수 또는 부분 초기화 함수 호출
  초기화를 위한 코드
}
```
Rectangle1 클래스를 만들고 안에 init() 함수와 convenience init (height: Int) 함수를 추가한다.
```swift
class Rectangle1 {
    var width : Int
    var height : Int
    
    init (width: Int, height: Int) {
        self.width = width
        self.height = height
        
        show()
    }
    
    init() {
        self.width = 0
        self.height = 0
    }
    
    convenience init (height: Int) {
        self.init()
        self.height = height
    }
    
    func show() {
        print("Rectangle1 {\(width), \(height)}")
    }
}

var rect1 = Rectangle1(width: 100, height: 100)
var rect2 = Rectangle1(height: 200)
rect2.show()

출력값) Rectangle1 {100, 100}
      Rectangle1 {0, 200}
```
첫 번째 init 함수는 초기화 함수이며 파라미터는 전달 받지 않고 width와 height 속성의 값을 0으로 초기화한다.
convenience 지시자가 붙은 init 함수는 height 값만 파라미터로 전달 받는 부분 초기화 함수이다.
그 안의 코드를 보면 init 초기화 함수를 호출하여 width 와 height 속성의 값을 먼저 0으로 초기화한 후 전달 받은 height 값을 설정한다.

코드를 실행하면 위의 출력값 같이 초기화 함수에 따라 인스턴스 객체가 다른 값을 가지는 것을 알 수 있다.

클래스 안에 들어 있는 모든 속성이 초기화되어야 하는 규칙 때문에 초기화 함수를 추가했더라도 그 안에서 초기화를 실패할 수도 있다.
예를 들어, 초기화 함수로 전달된 파라미터의 값이 원하는 값이 아닐 때는 초기화에 실패할 수 있는데 이때 nil을 반환할 수 있는 함수가 '실패 가능 초기화 함수(Failable Initializer)'이다.
다른 초기화 함수들은 반환 값이 없지만 실패 가능 초기화 함수는 nil을 반환 값으로 가질 수 있으므로 옵셔널로 반환된다고 명시한다. 다음 코드를 입력한다.
```swift
class Rectangle2 {
    var width : Int
    var height : Int
    
    init (width: Int, height: Int) {
        self.width = width
        self.height = height
        
        show()
    }
    
    init() {
        self.width = 0
        self.height = 0
    }
    
    convenience init (height: Int) {
        self.init()
        self.height = height
    }
    
    init? (width: Int, height: Int, type: Int) {
        self.width = width
        self.height = height
        
        if type < 1 {
            return nil
        }
    }
    
    func show() {
        print("Rectangle2 {\(width), \(height)}")
    }
}

var rect3 = Rectangle2(width: 100, height: 100)
var rect4 = Rectangle2(height: 200)
rect4.show()
```
새로 추가한 초기화 함수는 실패 가능 초기화 함수이며 init 함수 이름 뒤에 물음표(?)를 붙였다. 이것은 초기화 함수에서 nil을 반환할 수 있기 때문이며 물음표(?) 대신 느낌표(!)를 붙일 수도 있다.
init 함수로는 세 개의 파라미터가 전달되는데 두 개의 파라미터를 사용해 초기화한 다음 세 번째 파라미터가 0보다 작은 값일 경우 nil을 반환하도록 한다.

이 초기화 함수를 사용해 인스턴스 객체를 만들도록 다음 코드를 추가한다.
```swift
var rect5 = Rectangle2(width: 300, height: 300, type: -1)
print("rect5 정보 -> \(rect5)")

출력값) Rectangle2 {100, 100}
      Rectangle2 {0, 200}
      rect5 정보 -> nil
```
코드를 실행하면 실패 가능 초기화 함수가 호출되면서 rect5 변수에 nil이 할당된 것을 알 수 있다.

