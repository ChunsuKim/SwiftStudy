 #### 약한 참조
 
 '약한 참조(Weak Pointer)'는 강한 참조와는 다르게 객체를 소유하지 않는다. 즉, ARC는 약한 참조를 만들 때는 레퍼런스 개수를 늘리지 않는다.
 약한 참조를 코드에서 사용하고 싶다면 weak 또는 unowned 키워드를 사용한다. weak 또는 unowned를 사용하는 형식은 다음과 같다.
 ```swift
 weak var 변수이름 : 자료형
 unowned var 변수이름 : 자료형
 ```
 weak 키워드를 사용해 선언한 변수 또는 상수에서 가리키던 객체가 해제되면 이 변수 또는 상수에는 자동으로 nil이 할당된다. 따라서 nil이 할당될 수 있도록 옵셔널로 선언해야 한다.
 
```swift
class Person {
    var name : String!
    var age : Int!
    var team : Team!
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
        print("\(name)이 만들어졌습니다.")
    }
    
    deinit {
        print("\(name!)가 메모리에서 해제되었습니다.")
    }
}

class Team {
    weak var person : Person?
    
    init(person:Person) {
        self.person = person
        print("Team이 만들어졌습니다.")
    }
    
    deinit {
        print("Team 객체 해제됨.")
    }
}

var person1 : Person! = Person(name:"소녀시대", age:22)
var team1 : Team! = Team(person:person1)
person1.team = team1

person1 = nil
team1 = nil

//출력값: 소녀시대이 만들어졌습니다.
//      Team이 만들어졌습니다.
//      소녀시대가 메모리에서 해제되었습니다.
//      Team 객체 해제됨.
```
 바뀐 부분은 Team 클래스 안에 있던 person 변수의 선언 부분이다. weak 키워드가 사용되었고 물음표(?)를 붙여 옵셔널로 선언했다.
 코드를 실행하면 위의 출력값 같이 객체를 가리키는 두 개 변수에 모두 nil을 할당했을 때 속성으로 들어 있던 객체들이 같이 해제된 것을 확인할 수 있다.
 
 이렇게 하면 속성으로 추가했던 객체가 메모리에서 해제되지 않던 강한 순환 참조의 문제를 해결할 수 있다.
 왜나하면 weak 키워드를 사용해 약한 참조를 만들었을 때 해당 객체는 ARC에서 필요에 따라 없앨 수 있기 때문이다.
 


[Ch8_arc4.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch8_arc4.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
