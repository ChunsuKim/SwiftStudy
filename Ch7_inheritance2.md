#### 상속한 클래스의 초기화 함수

부모 클래스를 상속한 자식 클래스에서 초기화를 할 때는 부모 클래스에 선언한 속성의 초기화까지 고려해야 한다.
기본적으로 부모 클래스에도 초기화 함수가 있으므로 부모 클래스에 선언한 속성은 부모 클래스의 초기화 함수를 사용해 초기화한다. 이것은 자식 클래스에서 부모 클래스의 초기화 함수에게 초기화를 위임하는 것과 같다.

그런데 초기화 함수는 무작정 상속되는 것이 아니라 다음과 같은 경우에만 상속된다.

```swift
 1. 자식 클래스에 전체 초기화 함수를 만들지 않은 경우
 2. 자식 클래스에서 모든 전체 초기화 함수를 재정의한 경우, 부모 클래스의 부분 초기화 함수를 상속 받음
```

자식 클래스에 새로운 속성이 추가되면 초기화 함수는 추가된 속성을 먼저 초기화한 후 부모 클래스의 초기화 함수를 호출한다.

```swift
init() {
  자식 클래스의 속성 초기화
  부모 클래스의 초기화 함수 호출
  자식 클래스의 나머지 초기화 코드
}
```

다음 코드를 입력한다.

```swift
class Person {
    var name : String!
    var age : Int!
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
    
    func toString() -> String {
        return "{\(name), \(age)}"
    }
}

class Baby : Person {
    var mobile : String
    
    init(name:String, age:Int, mobile:String) {
        self.mobile = mobile
        super.init(name: name, age: age)
        print(toString())
    }
}

var baby1 = Baby(name: "걸스데이", age: 22, mobile: "010-1000-1000")
print("baby1 정보 -> \(baby1.toString())")

출력값) {Optional("걸스데이"), Optional(22)}
      baby1 정보 -> {Optional("걸스데이"), Optional(22)}
```

Baby 클래스는 Person 클래스를 상속한 후 mobile 이라는 이름의 변수를 속성으로 추가했다. 그리고 init 초기화 함수를 추가했는데 name, age, mobile 파라미터를 전달 받은 후 속성의 초기값으로 할당한다.
init 초기화 함수를 새로 정의했으므로 Person 클래스의 초기화 함수들은 상속되지 않는다. init 초기화 함수의 코드를 살펴보면 가장 먼저 들어가 있는 것이 Baby 클래스의 속성에 초기 값을 할당하는 것이다.
mobile 변수에 초기 값이 할당되고 나면 부모 클래스인 Person 클래스의 초기화 함수를 호출하여 Person 클래스의 속성 값들을 초기화한다. 부모 클래스를 가리킬 때는 super 키워드를 사용한다.

```swift
self : 나 자신
super : 부모
```

코드를 실행하면 Baby 객체가 잘 만들어진 것을 확인할 수 있다.

자식 클래스에서 부분 초기화 함수를 추가할 때는 자식 클래스의 다른 초기화 함수를 호출하여 초기화하도록 만들 수 있다. 위의 코드를 복사한 후 클래스이름 뒤에 1을 붙이고 Baby1 클래스에 다음 코드를 추가한다.

```swift
class Person1 {
    var name : String!
    var age : Int!
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
    
    func toString() -> String {
        return "{\(name), \(age)}"
    }
}

class Baby1 : Person {
    var mobile : String
    
    init(name:String, age:Int, mobile:String) {
        self.mobile = mobile
        super.init(name: name, age: age)
        
        print(toString())
    }
    
    convenience init(name:String) {
        self.init(name: name, age: 0, mobile: "")
    }
}

var baby2 = Baby1(name: "걸스데이", age: 22, mobile: "010-1000-1000")
print("baby2 정보 -> \(baby2.toString())")
var baby3 = Baby1(name: "티아라")
print("baby3 정보 -> \(baby2.toString())")

출력값) {Optional("걸스데이"), Optional(22)}
      baby2 정보 -> {Optional("걸스데이"), Optional(22)}
      {Optional("티아라"), Optional(0)}
      baby3 정보 -> {Optional("걸스데이"), Optional(22)}
```

새로 추가한 init 함수 안에서는 self 키워드로 Baby 클래스 안에 정의한 다른 전체 초기화 함수를 호출한다.

Quiz 30

HumanBeing 클래스를 상속한 Student 클래스를 만든 후 새로운 속성과 함수를 추가해 보세요. HumanBeing 클래스에는 사람 이름과 전화번호를 속성으로 넣어둡니다.
Student 클래스는 HumanBeing 클래스를 상속하도록 한 후 학교 속성을 추가합니다. 그리고 초기화 함수와 sleep이라는 이름의 함소도 추가합니다.

```swift
class HumanBeing {
    var name : String!
    var mobile : String!
    
    init(name: String, mobile: String) {
        self.name = name
        self.mobile = mobile
    }
}

class Student : HumanBeing {
    var school : String!
    
    init(name:String, mobile:String, school:String) {
        self.school = school
        super.init(name: name, mobile: mobile)
    }
    
    func sleep() {
        print("학생 \(self.name!)이(가) 자고 있습니다.")
    }
}

var student1 = Student(name: "김현수", mobile: "010-1000-1000", school: "고려대학교")
student1.sleep()

출력값) 학생 김현수이(가) 자고 있습니다.
```


[Ch7_inheritance3.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch7_inheritance3.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
