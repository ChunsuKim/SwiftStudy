이번에는 Person 클래스에 정의한 속성을 Baby 클래스에서 재정의하는 방법을 알아보겠다. 속성은 무조건 새로운 것으로 바꿀 수는 없으니 다음과 같은 경우에만 재정의가 가능하다.
```swift
 1. get, set 구문이 모두 있는 계산 속성으로 저장 속성을 재정의할 때
 2. get, set 구문이 모두 있는 계산 속성을 get, set 구문이 모두 있는 계산 속성으로 재정의할 때
 3. get 구문만 있는 계산 속성을 get, set 구문이 모두 있는 계산 속성으로 재정의할 때
 4. get 구문만 있는 계산 속성을 get 구문만 있는 계산 속성으로 재정의할 때
```
조금 복잡해 보이지만 간단하게 말하면 저장 속성을 계산 속성으로 바꾸거나 get 구문만 있는 계산 속성을 get, set 구문이 모두 있는 계산 속성으로 바꿀 수 있다는 것이다.

다음 코드를 입력한다.
```swift
class Person {
    var name : String
    var age : Int
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
}

class Baby : Person {
    
    override var name: String {
        didSet {
            print("name -> \(name)")
        }
    }
    
    override var age: Int {
        get {
            return 10
        }
        set {
        }
    }
}

var baby1 = Baby(name: "걸스데이", age: 22)
print("baby1의 age -> \(baby1.age)")

baby1.name = "티아라"

출력값) baby1의 age -> 10
      name -> 티아라
```
Person 클래스에 있던 name 속성과 age 속성은 Baby 클래스에서 재정의되었으며, 두 변수 모두 앞에 override 키워드가 붙어 있다.
name 속성은 값이 설정되면 그 값을 화면에 출력하도록 했고 age 속성은 값을 참조할 때 무조건 10이라는 값을 반환하도록 했다. 코드를 실행하면 위의 출력값과 같은 결과를 볼 수 있다.

그런데 **Person 클래스에서 정의한 속성을 자식 클래스에서 상속 받은 경우라도 속성을 바꿀 수 없도록 만들 수 있다.
final 키워드를 속성이나 함수 또는 클래스 앞에 붙이면 상속을 받은 자식 클래스에서 재정의할 수 없다.**
```swift
final -> 자식 클래스에서 재정의할 수 없다는 의미
```
다음 코드처럼 직사각형을 나타내는 Rectangle 클래스를 하나 정의한 후 Square 클래스가 Rectangle 클래스를 상속 받도록 한다.
```swift
class Rectangle {
    final var width : Int!
    final var height : Int!

    final func getWidth() -> Int {
        return width
    }
}

class Square : Rectangle {
    override func getWidth() -> Int {
    }
}
```
Rectangle 클래스에는 두 개의 속성과 하나의 메소드가 들어 있지만 이들 모두 final 키워드가 앞에 붙어 있다. 이렇게 하면 Square 클래스에서 override 키워드로 재정의하려고 할 때 오류 메시지가 표시된다.
다음은 getWidth 메소드를 재정의하려고 할 때 표시된 오류 메시지이다.

![그림](https://user-images.githubusercontent.com/47494240/54889351-835f8d00-4ee7-11e9-935a-270dfb2c3480.png)

이제 Person에서 상속 받아 Baby 클래스를 만들 때 변수나 메소드를 마음대로 추가하거나 바꿀 수 있다는 것을 알게 되었다.

Quiz 31

HumanBeing을 상속한 Student 클래스를 만든 후 HumanBeing 클래스에 들어 있는 함수를 재정의하세요. HumanBeing 클래스의 속성으로 사람 이름과 전화번호를 넣고 walk 함수도 넣어둡니다.
Student 클래스는 HumanBeing 클래스를 상속하도록 한 후 walk 함수를 재정의합니다. HumanBeing의 walk 함수와 Student의 walk 함수 안에서는 각각 다른 메시지를 출력하도록 하세요.
```swift
class HumanBeing {
    var name: String
    var mobile: String
    
    init(name: String, mobile: String) {
        self.name = name
        self.mobile = mobile
    }
    
    func walk() {
        print("사람 \(self.name)이(가) 걸어갑니다.")
    }
}

class Student : HumanBeing {
    override func walk() {
        print("학생 \(self.name)이(가) 걸어갑니다.")
    }
}

var person1 = HumanBeing(name: "김현수", mobile: "010-1000-1000")
person1.walk()

var student1 = Student(name: "김재학", mobile: "010-2000-2000")
student1.walk()

출력값) 사람 김현수이(가) 걸어갑니다.
      학생 김재학이(가) 걸어갑니다.
```

