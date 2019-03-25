#### 제네릭

스위프트는 타입 기반 언어(Type based Language)이다. 따라서 변수를 만들 때 타입(자료형)을 명시해야 하며 자료형이 무엇이냐에 따라 다른 코드를 입력해야 한다.
예를 들어, 더하기 함수를 만들때에도 정수를 파라미터로 전달하는지 아니면 실수를 파라미터로 전달하는지에 따라 다른 함수가 만들어진다.
하지만 더하기 함수에 정수가 전달될 수도 있고 실수가 전달될 수도 있다면 두 개의 함수를 각각 만들어야 하는 문제가 생긴다.
이런 경우에 '제네릭(Generic)'을 사용하면 좀 더 편리하다. 제네릭은 데이터의 자료형에 의존하지 않고 프로그램을 만들 수 있는 방법을 제공한다.

제네릭은 꺽쇠 기호(<>)를 사용한다. 다음 코드를 입력한다.
```swift
class ShoppingList<Element> {
    var list = [Element]()
    func add(newElement: Element) -> Int {
        list.append(newElement)
        return list.count
    }
    func get(index: Int) -> Element {
        return list[index]
    }
    func remove(at: Int) -> Element {
        return list.remove(at: at)
    }
}
```
ShoppingList 클래스 안에서는 Element라는 자료형이 사용되었다. 그런데 이 Element라는 자료형은 우리가 미리 정의한 것이 아니다. 바로 클래스의 이름 뒤에 꺽쇠 표시를 하고 그 안에 넣어준 것이다.
이렇게 클래스 뒤에 명시한 제네릭 이름은 그 클래스 안에서 자료형으로 사용될 수 있다.

ShoppingList 클래스는 마트에서 장을 보기 전에 사야 할 물건들을 넣어두기 위한 것이다. 따라서 그 안에는 배열을 하나 만들고 필요한 값을 추가할 것이다.
그런데 이 배열에 추가되는 원소는 문자열일 수도 있고 ShoppingItem과 같은 새로운 클래스를 정의한 후 그 클래스로부터 만든 객체일 수도 있다.
이 때문에 String 자료형으로 된 배열을 만들지, 또는 ShoppingItem 자료형으로 된 배열을 만들지 미리 정하지 않은 것이다.
쇼핑할 물건을 추가할 때는 add 메소드를 호출하고 확인할 때는 get 메소드를 호출하도록 한다. 그리고 remove 메소드도 추가했다.
이 클래스를 사용해 인스턴스 객체를 만들 때는 다음 코드처럼 제네릭의 자료형을 명시한다.
```swift
var mylist = ShoppingList<String>()
var count = mylist.add(newElement: "양배추")
print("쇼핑 리스트에 추가했습니다. : \(count)")

출력값) 쇼핑 리스트에 추가했습니다. : 1
```
여기에서는 String 자료형을 꺽쇠 기호 안에 넣어 문자열로 쇼핑할 물건들의 정보를 넣을 것이라고 알려준다. 코드를 실행하면 '양배추'라는 항목이 ShoppingList 객체 안에 추가된 것을 확인할 수 있다.

이번에는 ShoppingList 클래스로부터 인스턴스 객체를 만들 때 제네릭이 명시된 위치에 String과 같은 기본 자료형이 아니라 ShoppingItem 클래스로부터 만들어진 인스턴스 객체를 사용해 보겠다.
```swift
class ShoppingItem {
    var name: String
    var price: Int
    
    init(name:String, price:Int) {
        self.name = name
        self.price = price
    }
}

var mylist2 = ShoppingList<ShoppingItem>()
var count2 = mylist2.add(newElement: ShoppingItem(name: "양배추", price: 1000))
print("ShoppingItem 객체를 쇼핑 리스트에 추가했습니다. : \(count2)")

출력값) ShoppingItem 객체를 쇼핑 리스트에 추가했습니다. : 1
```
ShoppingItem 클래스는 쇼핑할 물건의 이름과 가격 정보를 담고 있다. 이 클래스를 먼저 정의한 후 이 클래스로부터 ShoppingList 객체를 만들었다.
새로 만든 인스턴스 객체는 add 메소드를 호출하여 추가한다. 코드를 실행하면 위의 출력값과 같이 ShoppingList 객체에 ShoppingItem 객체가 정상적으로 추가된 것을 확인할 수 있다.

이번에는 제네릭을 사용해 함수를 만들어 보겠다. show 함수를 다음과 같이 정의한다.
```swift
func show<T>(data: T) -> T {
    print("데이터 : \(data)")
    return data
}

show(data: "안녕하세요")
show(data: 10.1)

출력값) 데이터 : 안녕하세요
      데이터 : 10.1
```
show 함수는 이름 뒤에 꺾쇠 기호를 입력했는데 그 안에 T라는 단어가 들어 있다. T는 제네릭을 의미하며 그다음에 오는 파라미터나 반환 자료형 그리고 중괄호 안의 코드에서 사용된다.
이 함수는 단순히 화면에 데이터를 출력하고 return 키워드를 사용해 값을 반환하는 기능을 가지고 있다.

이 함수를 호출하는 부분에서는 파라미터에 String 자료형의 데이터를 넣을 수도 있고 Int 자료형의 데이터를 넣을 수도 있다. 코드를 실행하면 위의 출력값 같은 결과를 확인할 수 있다.

제네릭을 사용해 함수를 만들면 함수를 호출할 때 다양한 자료형의 값을 사용할 수 있는 장점이 있다. 지금까지 하나의 클래스에서 다른 클래스를 만들 때 상속하여 만드는 방법을 알아보았다.
그리고 상속이라는 것을 사용했기 때문에 알아야 하는 형 변환과 Any, AnyObject, 제네릭 등에 대해서도 살펴보았다. 이를 통해 스위프트에서 사용하는 다양한 코드 형태에 조금 더 익숙해졌다.

Quiz 32

Person을 상속한 Student 클래스를 만든 후 새로운 인스턴스 객체를 만들고 Person 자료형의 변수에 할당합니다. 그리고 이 객체를 사용할 때 Student 자료형으로 형 변환을 해 보세요.
Person 클래스에는 사람 이름과 전화번호를 속성으로 넣고 walk 함수도 넣어 둡니다. Student 클래스는 Person 클래스를 상속하도록 한 후 walk 함수를 재정의합니다.
Student 클래스로부터 새로운 인스턴스 객체를 만든 후 Person 자료형으로 된 변수에 할당하고 walk 함수를 호출합니다. 그리고 다시 Student 자료형으로 형 변환한 후 walk 함수를 호출해 봅니다.
```swift
class Person {
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

class Student : Person {
    override func walk() {
        print("학생 \(self.name)이(가) 걸어갑니다.")
    }
}

var person1:Person = Student(name: "김현수", mobile: "010-1000-1000")
person1.walk()

var student1 = person1 as? Student
student1?.walk()

출력값) 학생 김현수이(가) 걸어갑니다.
      학생 김현수이(가) 걸어갑니다.
```

