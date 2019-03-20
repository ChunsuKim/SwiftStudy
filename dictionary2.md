딕셔너리에 들어 있는 원소의 값을 바꿀 때는 updateValue 메소드를 사용할 수도 있다.
```swift
mutating func updateValue(value: Value, forKey: Key) -> Value?
```
딕셔너리 안에 들어 있는 원소를 삭제할 때는 removeValue 메소드를 사용할 수 있다.
```swift
mutating func removeValue(forKey: Key) -> Value?
```
딕셔너리 안에는 Int나 String과 같은 기본 자료형뿐만 아니라 객체가 들어갈 수도 있다. 예를 들어, Person 클래스를 정의한 후 Person 클래스에서 인스턴스 객체를 만들어 딕셔너리에 추가할 수 있다.
물론 각각의 인스턴스 객체를 넣을 때는 키를 함께 지정해야 한다.

그러면 먼저 Person 클래스를 정의한다.
Person 클래스 안에는 name, age, mobile 이라는 이름을 가진 속성을 추가하고 각각 이름, 나이, 전화번호를 저장할 수 있도록 한다.
Person 클래스를 정의한 후에 이 클래스로부터 인스턴스 객체를 만들 때 사용할 데이터는 names, ages, mobiles 변수에 넣어두되 딕셔너리 자료형으로 선언한다.
```swift
var names : [Int:String] = [1:"소녀시대", 2:"걸스데이", 3:"티아라"]
var ages : [Int:Int] = [1:20, 2:22, 3:24]
var mobiles : [Int:String] = [1:"010-1000-1000", 2:"010-2000-2000", 3:"010-3000-3000"]

class Person {
    var name : String?
    var age : Int?
    var mobile : String?
    init(name:String?, age:Int?, mobile:String?) {
        self.name = name
        self.age = age
        self.mobile = mobile
    }
}
```
names, ages, mobiles 변수에 할당된 딕셔너리에 들어가는 원소의 키는 1, 2, 3처럼 1부터 시작하는 숫자를 넣었다.
Person 클래스 안에는 name, age, mobile 속성이 옵셔널로 선언되어 있다. 그리고 초기화 함수인 init 안에서는 전달 받은 파라미터를 속성에 할당한다.

이렇게 정의한 Person 클래스로부터 새로운 인스턴스 객체를 만든 후 객체들을 담아둘 변수도 딕셔너리로 선언해 보겠다.
```swift
var persons : [String:Person] = [:]
var person1 = Person(name: names[1], age: ages[1], mobile: mobiles[1])
persons[names[1]!] = person1
var person2 = Person(name: names[2], age: ages[2], mobile: mobiles[2])
persons[names[2]!] = person2
var person3 = Person(name: names[3], age: ages[3], mobile: mobiles[3])
persons[names[3]!] = person3
print("persons 딕셔너리의 원소 개수 : \(persons.count)")

출력값) persons 딕셔너리의 원소 개수 : 3
```
새로운 Person 객체는 Person 클래스 이름 뒤에 소괄호를 붙인 후 그 안에 names, ages, mobiles 변수에 들어 있는 값을 하나씩 전달하여 만들어 낸다.
persons 변수는 키가 문자열이고 값이 Person 자료형인 딕셔너리로 선언했으며 세 개의 인스턴스 객체를 만들어 persons 딕셔너리에 추가했다.
코드를 실행하면 위의 출력값 같이 딕셔너리 안에 세 개의 인스턴스 객체가 들어간 것을 확인할 수 있다.
