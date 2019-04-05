
 #### 셀렉터 사용하기
 
 '셀렉터(Selector)'는 함수를 식별하기 위해 만드는 정보이다. 이 정보는 iOS용 앱을 만들 때 이벤트를 전달할 타깃을 지정하거나 알림 또는 타이머 등에 사용된다. 셀렉터를 사용하면 객체 안에 들어 있는 메소드를 구분할 수 있다. 셀렉터를 만들 때는 Selector 구조체를 사용하거나 다음처럼 #selector() 문을 사용한다.
 ```swift
 #selector(메소드이름(파라미터이름1: 파라미터이름2: 파라미터이름n: ))
 ```
 
 #selector 뒤에 소괄호를 붙인 후 메소드 이름과 파라미터를 지정한다. 메소드 이름 뒤에 오는 소괄호 안에 파라미터들을 열거하는데, 각 파라미터 뒤에는 콜론(:)을 붙여준다. 여기에서 파라미터 이름은 외부 파라미터를 의미한다. 외부 파라미터는 이 함수를 호출할 때 사용할 이름을 지정하는 것으로 함수를 정의할 때 외부 파라미터 이름을 _ 로 지정했다면 동일하게 _ 기호를 붙여준다. 셀렉터를 사용할 때는 Selector 구조체를 사용할 때와 #selector 문을 사용할 때 파라미터를 지정하는 방법이 약간 다르다는 점에 주의해야 한다.
 
 여기에서는 셀렉터를 어떻게 만드는지만 알아보겠다. 다음 코드처럼 show 함수를 만든다.
 
```swift
import Foundation

func show() {
    print("show 호출됨")
}
```

 show 함수는 전달되는 파라미터도 없고 반환되는 값도 없는 가장 간단한 형태이다. 이 함수의 셀렉터는 다음 코드처럼 만들 수 있다.
 
```swift
let method = Selector(("show"))
```

 셀렉터는 함수를 식별할 수 있는 문자열로 만들게 된다. 이 문자열은 함수 이름과 파라미터, 외부 파라미터 이름으로 구성된다. show 함수는 파라미터가 없으므로 "show" 라는 문자열만으로 셀렉터를 만들 수 있다. 이 셀렉터를 #selector 문으로 바꾸면 다음과 같다. 파라미터가 없을 때는 함수의 이름만 지정한다.
 ```swift
 #selector(show)
 ```
 
 만약 파라미터가 한 개라면 콜론(:) 기호를 붙여준다. show2 라는 이름의 함수를 추가하고 data 라는 이름의 파라미터를 전달 받도록 한다.
 
```swift
func show2(data:String) {
    print("show2 호출됨 : \(data)")
}

let method2 = Selector(("show2:"))
```

 show2 함수의 파라미터가 한 개이므로 "show:" 문자열로 함수를 구분한다. 콜론을 하나 붙여서 파라미터가 하나 있다는 것을 알려준다. 만약 파라미터가 하나 이상인 경우에는 콜론 뒤에 파라미터의 이름을 붙여준다. 파라미터 이름은 외부 파라미터 이름을 붙여주지만 외부 파라미터가 없으면 내부 파라미터 이름을 붙여준다.
 이 셀렉터를 #selector 문으로 바꾸면 다음과 같다. 파라미터가 있을 때는 함수 이름 뒤에 소괄호를 붙이고 그 안에 파라미터를 지정한다.
 ```swift
 #selector(show2(data:))
 ```
 
 #selector 문에 들어가는 메소드의 파라미터는 모두 지정한다.
 
```swift
func show3(data: String, name: String) {
    print("show3 호출됨 : \(data), \(name)")
}

let method3 = Selector(("show3:name:"))
```

 show3 함수의 이름 뒤에 콜론을 붙인 후 두 번째 파라미터 이름을 붙여주었다. 이 셀렉터를 #selector 문으로 바꾸면 다음과 같다.
 ```swift
 #selector(show3(data:name:))
 ```
 
 show3 메소드의 파라미터는 두 개이며 각각 data:와 name: 기호를 붙여주었다. 이렇게 만든 셀렉터는 나중에 아이폰용 앱을 만들 때 사용되므로 나중에 다시 볼 수 있다.
 
 
 #### 셀렉터로 메소드 구분하기
 
 셀렉터는 메소드를 호출하기 전에 메소드 호출이 가능한지 검사할 때 사용될 수도 있다. 메소드 호출이 가능한지 검사하는 메소드는 다음과 같다.
 ```swift
 func responds(to: Selector) -> Bool
 ```
 
 다음 코드를 입력한다.

```swift
class Person: NSObject {
    var name: String
    var age: Int
    @objc init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    @objc func greeting(message: String) {
        print("\(name)에게 인사 : \(message)")
    }
}
```

 Person 클래스를 만들고 그 안에 greeting이라는 이름의 함수를 추가했다. 그런데 함수 앞에 @objc 키워드가 붙어 있다. 이 키워드는 Objective-C 에서 호출할 수 있는 함수를 의미하며, #selector 를 사용해서 셀렉터를 지정할 경우에는 함수 앞에 붙여주어야 한다. 이렇게 클래스 안에 함수가 들어 있을 때 다음 코드처럼 인스턴스 객체를 만든 후 그 인스턴스 객체의 responds 메소드를 호출하면 greeting 함수를 사용할 수 있는지 없는지 확인할 수 있다. 셀렉터를 사용해 확인하는 코드를 추가한다.
 
```swift
let selector1 = #selector(Person.greeting(message:))

let person1 = Person(name: "소녀시대", age: 22)
person1.responds(to: selector1)
person1.responds(to: #selector(Person.greeting(message:)))

person1.responds(to: #selector(Person.init(name:age:)))
```

 코드를 실행하면 플레이그라운드 화면의 오른쪽에 respons의 결과가 true로 표시되는 것을 알 수 있다.
 
 
 Quiz 38
 
 Dog 클래스를 정의한 후 이 클래스에 특정 메소드가 정의되어 있는지 확인하는 함수를 만듭니다. import Foundation 코드를 가장 먼저 입력하고 Dog 클래스가 NSObject를 상속하도록 합니다. Dog 클래스 안에는 walk라는 이름의 메소드를 추가합니다. Dog 클래스를 정의했다면 checkDog라는 이름의 새로운 함수를 하나 만든 다음 이 함수를 호출했을 때 Dog 클래스 안에 walk라는 이름의 메소드가 있는지 확인하도록 합니다.
 
```swift
import Foundation

class Dog: NSObject {
    var name: String!
    var age: Int!
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    @objc func walk() {
        print("강아지 \(name!)이가 걸어갑니다.")
    }
}

func checkDog(dog:Dog) -> Bool {
    if (dog.responds(to:#selector(Dog.walk))) {
        return true
    } else {
        return false
    }
}

var dog1: Dog = Dog(name: "미미", age: 1)
print("강아지 객체에 walk 메소드가 있나요? : \(checkDog(dog: dog1))")

출력값) 강아지 객체에 walk 메소드가 있나요? : true
```


[Ch9_string.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch9_string1.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
