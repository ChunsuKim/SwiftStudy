 #### 컬렉션의 소유권
 
 배열처럼 여러 개의 객체를 담아둘 수 있는 컬렉션에 객체를 넣어둘 때는 소유권이 어떻게 될까? 컬렉션은 그 안에 들어 있는 객체를 소유하기 때문에 ARC의 레퍼런스 개수에 영향을 미친다.
 밑에 코드처럼 Person 클래스와 함께 Person 객체를 담아 둘 수 있는 배열 객체를 만든다.
 
```swift
class Person {
    var name: String!
    var age: Int!
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        print("\(name)이 만들어졌습니다.")
    }
    
    deinit {
        print("\(name!)가 메모리에서 해제되었습니다.")
    }
}

var persons = [Person]()
```
 그리고 Person 객체를 하나 만들어 person1 변수에 할당한 후 persons 배열에 person1 을 추가한다. 그런 다음 person1 변수에 nil 을 할당한다.
 
```swift
var person1 : Person! = Person(name: "소녀시대", age: 22)
persons.append(person1)
print("person1을 배열에 추가했습니다.")

person1 = nil

//출력값: 소녀시대이 만들어졌습니다.
//      person1을 배열에 추가했습니다.
```
 코드를 실행하면 person1 변수는 메모리에 만들어진 Person 객체를 더 이상 가리키지 않지만 그 객체가 해제되었다는 메시지는 출력되지 않는다.
 이것은 persons 배열이 그 안에 들어 있는 Person 객체를 소유하고 있기 때문이다. 만약 Person 객체를 해제하고 싶다면 그 객체를 배열에서 제거해야 한다. 다음 코드처럼 배열에서 Person 객체를 제거하도록 remove 메소드를 호출한다.
 
```swift
persons.remove(at: 0)
person1 = nil

//출력값: 소녀시대가 메모리에서 해제되었습니다.
```

 코드를 실행하면 person1 변수도 Person 객체를 가리키지 않고 배열에서도 그 객체를 소유하지 않으므로 메모리에서 사라졌다는 메시지가 출력된다.
 
 지금까지 객체를 만든 후에 어떻게 메모리에서 사라지는지 알아보았다. 아이폰 앱을 만들 때도 weak 키워드를 자주 볼 수 있으며 강한 순환 참조를 사용할 것인지 아니면 약한 참조를 사용할 것인지를 물어보기도 한다. 따라서 스위프트에서 메모리에 만든 객체를 어떻게 관리하는지 이해하면서 코드를 살펴보는 것이 좋다.
 
 Quiz 34
 
 Human 클래스로부터 인스턴스 객체를 만든 후 세 개의 변수에 차례로 할당했다가 변수가 nil을 가리키도록 합니다. 그리고 해당 인스턴스 객체가 메모리에서 해제되는지 확인합니다. Human 클래스를 정의하고 이 클래스로부터 인스턴스 객체를 만든 후 변수에 할당합니다. 이렇게 만든 변수들이 순서대로 다시 nil을 가리키도록 바꾸어 인스턴스 객체가 언제 메모리에서 해제되는지 확인해 보세요.
 
```swift
class Human {
    var name: String!
    var age: Int!
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
        print("\(name)이 만들어졌습니다")
    }
    
    deinit {
        print("\(name)가 메모리에서 해제되었습니다.")
    }
}

var human1: Human? = Human(name: "김현수", age: 20)
var human2: Human? = human1
var human3: Human? = human2

human1 = nil
print("human1에 nil 할당함.")

human2 = nil
print("human2에 nil 할당함.")

human3 = nil
print("human3에 nil 할당함.")

//출력값: 김현수이 만들어졌습니다
//      human1에 nil 할당함.
//      human2에 nil 할당함.
//      Optional("김현수")가 메모리에서 해제되었습니다.
//      human3에 nil 할당함.
```


