 # 메모리 관리와 예외 처리하기
 
 ### 1_자동으로 메모리 관리하기
 
 스위프트에서 메모리를 관리하는 역할은 'ARC(Automatic Reference Counting)'가 담당한다.
 이것은 객체를 가리키는 레퍼런스의 숫자를 관리한다는 의미를 가지고 있으며, 실제로도 레퍼런스 숫자를 관리한다.
 여기에서 객체를 가리키는 레퍼런스의 숫자가 매우 중요하다. 왜 중요할까?
 
 
 #### 객체 소유하기
 
 레퍼런스 숫자는 클래스로부터 만들어진 인스턴스 객체에만 적용되는 개념이다. 따라서 Int, String과 같은 기본 자료형이나 구조체(struct), 열거형(enum)에는 적용되지 않는다.
 그러면 클래스로부터 만들어진 인스턴스 객체를 참조하는 방식을 먼저 살펴보겠다.
 
```swift
class Person {
    var name: String!
    var age: Int!
    
    init (name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    deinit {
        print("\(name!)가 메모리에서 해제되었습니다.")
    }
}
```
 Person 클래스는 지금까지 만들어 보았던 클래스의 형태와 크게 다르지 않다. name과 age 변수가 속성으로 추가되었으며 init 함수 안에서 name과 age 변수의 값을 초기화하고 있다.
 init 함수로 전달되는 파라미터가 두 개이므로 이 초기화 함수를 사용해 Person 객체를 만들 때는 이름과 나이를 파라미터로 전달하면 된다.
 deinit은 이 Person 클래스로부터 만들어진 인스턴스 객체가 메모리에서 해제될 때 호출된다. deinit의 형식을 보면 파라미터가 없고 단지 중괄호 안에 필요한 코드를 넣으면 된다.
 ```swift
 deinit { ... }
 ```
 deinit의 중괄호 안에 입력한 코드를 보면 단순히 name 속성의 값과 함께 메모리에서 해제되었다는 글을 디버그 영역에 출력하도록 되어 있다.
 
 이렇게 만든 Person 클래스로부터 인스턴스 객체를 하나 만든 후 변수에 할당하도록 다음 코드를 추가한다.
 
```swift
var person1 : Person! = Person(name: "소녀시대", age: 20)
```
 이렇게 하면 메모리에 만들어진 Person 객체를 person1 변수가 가리키게 된다. 이 person1 변수의 자료형은 Person!로 만든다. 이렇게 !를 붙이면 nil이 할당될 수 있다.
 이때 ARC에서 관리하는 Person 객체의 레퍼런스 숫자는 1이 된다.
 
 ![그림](https://user-images.githubusercontent.com/47494240/56080576-c1dccd80-5e3d-11e9-9b50-ccfa1ce3f466.png)
 
 이렇게 ARC에서 레퍼런스 숫자를 관리하고 있는 상태에서 레퍼런스 숫자의 값이 0이 되면 그 객체는 메모리에서 해제된다. 즉, 객체가 메모리에서 없어지는 것이다.
 레퍼런스는 변수 또는 상수가 인스턴스 객체를 가리키는 것을 의미한다.
 따라서 person1 변수가 Person 객체를 더 이상 가리키지 않도록 nil 값을 할당하면 ARC에서 관리하는 Person 객체의 레퍼런스 숫자는 0이 된다.
 다음 코드를 추가한다.
 
```swift
person1 = nil

//출력값: 소녀시대가 메모리에서 해제되었습니다.
```
 person1 변수에 nil을 할당했다. 이제 코드를 실행하면 위의 출력값 같이 메모리에서 해제되었다는 메시지가 출력되는 것을 볼 수 있다.
 
 Person 객체를 가리키던 person1 변수에 nil을 할당했으므로 person1 변수는 더 이상 메모리에 있는 Person 객체를 가리키지 않는다.
 따라서 Person 객체는 어디에서도 사용하지 않게 되고 ARC는 그 객체를 메모리에서 즉시 제거한다.
 
 이번에는 하나의 변수가 아니라 두 개의 변수가 인스턴스 객체를 가리키도록 해 보겠다. 다음 코드를 추가로 입력한다.
 
```swift
var person2 : Person! = Person(name: "걸스데이", age: 22)
var person3 = person2
```
 새로운 인스턴스 객체를 만든 후 person2 변수에 할당했다. 그리고 다시 person3 변수를 만들어 할당하면 person2와 person3가 모두 그 객체를 가리키게 된다.
 
 ![그림](https://user-images.githubusercontent.com/47494240/56080577-c1dccd80-5e3d-11e9-8f58-7eb1ce8fbd2d.png)
 
 Person 클래스로부터 만들어진 인스턴스 객체를 두 개의 변수가 가리키고 있으므로 ARC에서 관리하는 레퍼런스 숫자의 값은 2가 된다.
 따라서 다음과 같이 person2 변수에 nil을 할당하더라도 person3가 가리키는 레퍼런스는 사라지지 않아서 객체는 해제되지 않는다.
 
```swift
person2 = nil
```
 결국 ARC에서 관리하는 레퍼런스 개수가 0이 되어야 객체가 해제되므로 person2와 person3 모두 nil 값이 할당되었을 때 그 객체가 해제된다.
 만약 자바라를 경험해 보았다면 이렇게 레퍼런스만 없애도 객체가 메모리에서 바로바로 사라지는 것을 대단하게 생각할 수 있다.
 그만큼 프로그램을 효율적으로 만들려면 ARC로 메모리를 잘 관리하는 것이 중요하다.
 
 
 #### 변수의 유효 범위
 
 변수는 변수가 선언된 범위(Scope)를 벗어나면 자동으로 사라진다. 이것을 변수의 '유효 범위'라고 한다. 변수가 사라지면 변수가 가리키는 객체의 레퍼런스 개수에 변화가 생긴다.
 따라서 유효 범위에 관심을 가져야 한다.
 
 일반적으로 중괄호로 만들어진 코드 블록 안에 변수를 선언하면 그 변수는 '지역 변수(Local Variable)'가 된다.
 대표적인 코드 블록이 함수인데, 함수 안에서 지역 변수를 만들면 그 지역 변수는 해당 함수 안에서만 유효하다. 다음 코드를 추가한다.
 
```swift
func createPerson(name: String, age: Int) {
    let person4 : Person! = Person(name: name, age: age)
    print("person4 변수 만들어짐. \(person4.name!)")
}

createPerson(name: "티아라", age: 24)

//출력값: person4 변수 만들어짐. 티아라
//      티아라가 메모리에서 해제되었습니다.
```
 createPerson 함수를 하나 정의했다. 이 함수 안에서는 Person 객체를 하나 만들어 person4 상수에 할당한다.
 따라서 createPerson 함수를 호출하면 person4 상수가 Person 객체를 가리키지만 이 상수는 함수의 실행이 끝나면 메모리에서 사라지므로 Person 객체의 레퍼런스 개수는 0이 된다.
 코드를 실행하면 위의 출력값 같이 객체가 메모리에서 해제되었음을 알 수 있다.
 
 여기에서 확인한 것처럼 함수 안에 지역 변수로 만들어진 변수나 상수가 인스턴스 객체를 가리키는 경우, 함수 실행이 끝나면 변수나 상수가 사라지고 ARC에서 자동으로 인스턴스 객체를 해제한다는 것을 이해하기 바란다.
 만약 지역 변수가 아니라 클래스의 속성으로 선언했다면 이 클래스로부터 만들어진 인스턴스 객체가 메모리에 존재하는 동안 객체도 사라지지 않는다.
 그리고 속성을 가지고 있는 인스턴스 객체가 해제되어야 속성으로 할당된 객체도 사라진다.
 
 다음 코드처럼 Team 이라는 새로운 클래스를 하나 만들고 그 안에 Person 자료형의 속성을 하나 추가한다.
 
```swift
class Team {
    var person : Person!
    
    init() {
        person = Person(name: "애프터스쿨", age: 23)
    }
    func show() {
        print("Team 안의 Person 객체 : \(person.name!)")
    }
}
```
 Team 클래스 안에 추가된 person 변수는 init 함수 안에서 초기화된다. 결국 Team 이라는 클래스에서 Person 자료형으로 된 객체를 참조하는 모양이 된다.
 show 메소도를 호출하면 어떤 사람인지를 콘솔에 출력한다. 이제 다음 코드를 추가한다.
 
```swift
var team1 : Team! = Team()
team1.show()
team1 = nil

//출력값: Team 안의 Person 객체 : 애프터스쿨
//      애프터스쿨가 메모리에서 해제되었습니다.
```
 Team 클래스로부터 인스턴스 객체를 하나 만들어 team1 변수에 할당한다. 그리고 show 메소드를 호출한 후 nil을 할당한다.
 코드를 실행하면 위의 출력값 같이 team1 객체가 해제되면서 그 안에 속성으로 들어 있던 person 객체도 해제되었음을 알 수 있다.
 
 그런데 ARC가 객체들을 관리하면서 필요할 때마다 자동으로 메모리에서 객체를 없애주는데 왜 굳이 이런 내용들을 살펴봐야 할까? 이제부터 설명할 강한 순환 참조와 약한 참조 때문이다.


[Ch8_arc2.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch8_arc2.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
