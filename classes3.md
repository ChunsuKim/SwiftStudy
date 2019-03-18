### 5_객체의 속성


클래스를 정의할 때 그 안에는 속성과 메소드가 들어갈 수 있다.
속성은 '어트리뷰트(Attributes)' 또는 '프로퍼티(Properties)'라고 부르며, 스위프트에서는 속성을 크게 저장 속성과 계산 속성으로 구분한다.
'저장 속성(Stored Properties)'은 지금까지 만들어 본 일반적인 변수나 상수와 같다.
즉, 클래스 안에 var 키워드를 사용해 변수를 추가하거나 let 키워드를 사용해 상수를 추가하면 그것이 저장 속성이 된다.
'계산 속성(Computed Properties)'은 속성의 값을 넣거나 뺄 때 특정 코드가 함께 실행되도록 만든다.
이런 계산 속성은 값을 가져올 때는 get, 값을 넣을 때 set 이라는 단어를 사용한다.
set 속성은 필요하면 추가해서 사용할 수도 있고, 생략할 수도 있으므로 get 속성만 사용하는 경우도 많다.
계산 속성은 단순히 변수의 값만을 가져오거나 넣는 경우보다는 여러 변수의 값을 사용해서 새로운 값을 만든 다음 그 값을 가져올 때 많이 사용된다.


#### 저장 속성

저장 속성은 이미 클래스 안에 넣어 보았던 변수를 말한다.
이미 여러 번 사용해 보았으니 저장 속성 중에서 조금 다른 특징을 갖고 있는 '지연 속성(Lazy Properties)'에 대해서만 알아보겠다.
클래스 안에 선언된 모든 변수나 상수는 초기 값을 할당해야 하며, 만약 초기 값이 할당되어 있지 않다면 init 함수 안에서 초기 값을 할당해야 한다고 했다.
그런데 변수 앞에 lazy 키워드를 붙이면 처음에는 값이 할당되지 않고 남아 있다가 다른 곳에서 값을 참조하는 시점에 초기화된다.
lazy 키워드를 사용했을 때 어떻게 되는지 확인하기 위해 다음 코드를 입력해 보겠다.
```swift
class Friend {
    var name : String?
    init() {
        print("Friend:init 호출됨.")
        name = "Friend"
    }
}

class Person {
    var name : String?
    lazy var group = Friend()
    init(name:String) {
        self.name = name
    }
    func walk(speed:Int) {
        print("\(name)이(가) \(speed)km 속도로 걸어갑니다.")
    }
    func run(speed:Int) {
        print("\(name)이(가) \(speed)km 속도로 뛰어갑니다.")
    }
}

var person01 = Person(name: "철수")
person01.walk(speed: 10)

print("Group 속성 -> \(person01.group)")

출력값) Optional("철수")이(가) 10km 속도로 걸어갑니다.
출력값) Friend:init 호출됨.
출력값) Group 속성 -> __lldb_expr_13.Friend
```
Person 클래스 안에는 name 속성을 추가했으며 init 함수는 하나의 파라미터를 전달 받도록 정의 되었다.
init 함수 안에서는 전달 받은 파라미터 값을 자기 자신의 name 변수 즉, self.name에 할당한다.
name 변수 외에 group이라는 이름의 변수가 하나 더 추가되었는데 이 변수의 초기 값은 Friend 클래스의 인스턴스가 되도록 만든다.
Friend 클래스는 단순히 name 속성만을 가지고 있는데 init 함수가 호출되면 콘솔 화면에 호출되었다는 메시지가 출력되도록 만들었다.

여기서 중요한 점은 group 변수 앞에 lazy 키워드가 붙었다는 것이다. 이 키워드가 붙으면 인스턴스 객체가 만들어져도 이 변수는 초기화되지 않는다.

Person 객체의 인스턴스를 만들어 person01 변수에 할당한 후 walk 함수를 호출했지만 group 변수에 할당될 Friend 객체는 만들어지지 않았다.
이것은 'Friend:init 호출됨.'이라는 메시지가 출력되지 않은 것을 보면 알 수 있다. 이 객체는 person01.group 변수를 참조할 때 초기화되어 만들어진다.
이렇게 값이 늦게 만들어지기 때문에 lazy라는 단어를 붙인다고 기억하면 좋다.
