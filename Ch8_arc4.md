 이번에는 unowned를 사용해 보겠다. unowned 는 weak 와 같이 약한 참조를 만들지만 자동으로 nil 이 할당되지 않기 때문에 변수나 상수를 옵셔널로 선언하지 않는다.
 weak 키워드는 두 객체가 서로 독점적으로 존재할 수 있는 경우에 사용하기 적당하며, unowned 는 하나의 클래스가 다른 클래스에 완전히 종속되었을 때 사용하면 좋다.
 
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
    unowned var person : Person
    
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

 weak 키워드를 unowned로 변경했으며 물음표(?)를 없애서 옵셔널이 아닌 Person 자료형으로 만들었다. 코드를 실행하면 weak 키워드를 사용했을 때와 동일한 결과가 출력된다.
 즉, 상호 참조하고 있는 객체들의 변수에 nil을 할당하여 가리키지 않게 하면 그 안에 들어 있는 객체도 같이 해제된다. 그렇다면 weak 와 unowned 는 변수나 상수를 선언할 때만 다른 걸까?
 만약 person1 = nil 이라는 코드 아래 부분에서 team1.person 객체를 참조하려 하면 오류가 발생한다.
 이렇게 변수가 가리키는 곳에 객체가 없는 상태가 된 것을 '댕글링 포인터(dangling pointer)'라고 부른다.
 
 ![오류그림](https://user-images.githubusercontent.com/47494240/56080685-10d73280-5e3f-11e9-959e-954c9dcb05d5.png)
 
 unowned 를 사용할 때는 변수가 nil 이 될 수 없으므로 이런 오류가 발생할 수 있다는 점에 주의해야 한다.
 
