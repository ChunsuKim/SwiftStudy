 #### 강한 순환 참조
 
 '강한 순환 참조(Strong Reference Cycles)'는 두 클래스가 서로 참조하는 경우에 만들어진다. 강한 순환 참조는 ARC에 의해 해제되지 않기 때문에 프로그램이 종료될 때까지 계속 유지된다.
 
```swift
class Person {
    var name: String!
    var age: Int!
    var team: Team!
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        print("\(name)이 만들어졌습니다.")
    }
    
    deinit {
        print("\(name!)가 메모리에서 해제되었습니다.")
    }
}

class Team {
    var person : Person!
    
    init(person:Person) {
        self.person = person
        print("Team이 만들어졌습니다.")
    }
    
    deinit {
        print("Team 객체 해제됨.")
    }
}
```
 Person 클래스는 앞에서 만들었던 것을 그대로 사용하되 init 함수 안에서 인스턴스 객체가 만들어졌다는 것을 알 수 있도록 한다. 즉, init 함수 안에서 콘솔에 글자가 출력되도록 약간 수정한다.
 그리고 Team 클래스의 인스턴스 객체를 할당할 수 있는 team이라는 변수를 추가한다.
 Team 클래스는 그 안에 Person 변수를 속성으로 갖도록 했으며, 객체를 만들 때 Person 객체를 파라미터로 전달 받을 수 있도록 init 함수를 만들었다.
 
 이렇게 만든 클래스를 사용해 객체를 만들고 각각 person1 변수와 team1 변수에 할당한다. Person 객체 안에 있는 team 속성에는 Team 클래스로부터 만든 인스턴스 객체를 할당한다.
 
```swift
var person1 : Person! = Person(name: "소녀시대", age: 22)
var team1 : Team! = Team(person: person1)
person1.team = team1

//해제하는 코드 시작
person1.team = nil
team1.person = nil
//해제하는 코드 끝

person1 = nil
team1 = nil

//출력값: 소녀시대이 만들어졌습니다.
//      Team이 만들어졌습니다.
```
 이렇게 하면 Person 객체 안에 있는 변수가 Team 객체를 가리키고 Team 객체 안에 있는 변수가 Person 객체를 가리키게 된다. 이것이 '상호 참조'이다.
 이렇게 상호 참조를 하면 강한 순환 참조 상태가 되며, person1 과 team1 변수에 nil을 할당해도 객체는 해제되지 않는다.
 코드를 실행하면 위의 출력값 같이 메모리에서 해제되었다는 메시지를 볼 수 있다.
 
 이것을 해제하려면 속성에 직접 nil을 할당해야 한다. 위의 //해제하는 코드 시작부터 //해제하는 코드 끝 코드처럼 속성으로 들어 있는 변수들에 nil을 할당한 후 person1과 team1 변수를 nil로 만들어 보겠다.
 
```swift
//출력값: 소녀시대가 메모리에서 해제되었습니다.
//      Team 객체 해제됨.
```
 코드를 실행하면 위의 출력값 같이 객체가 메모리에서 해제되었음을 알 수 있다.
 
 강한 순환 참조는 객체들을 메모리에 계속 유지시켜 메모리가 증가하는 현상을 만들 수 있으므로 주의해야 한다.
 
