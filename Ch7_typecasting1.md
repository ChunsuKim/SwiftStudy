### 3_객체의 형 변환

10이라는 숫자와 "안녕"이라는 글자를 각각 변수나 상수에 넣어 두려면 자료형이 Int 와 String 인 변수를 선언해야 한다.
이와 마찬가지로 인스턴스 객체도 그 객체를 생선한 틀에 해당하는 클래스를 자료형으로 하는 변수나 상수를 선언해야 그 변수에 할당할 수 있다.
그러면 특정 객체를 가리키는 변수가 있을 때 이 변수만으로 어떤 자료형의 객체인지를 알 수 있을까? 그리고 다른 클래스에서 상속한 경우에는 어떤 자료형이라고 말할 수 있을까?


#### 객체의 자료형 확인

어떤 인스턴스 객체가 어떤 클래스로부터 만들어진 것인지 알고 싶다면 is 연산자를 사용할 수 있다. 다음과 같은 구조의 is 연산자를 사용해 보기 위해 다음 코드를 입력한다.
```swift
인스턴스객체 is 객체자료형
```
```swift
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Baby : Person {
    func cry() {
        print("아기가 웁니다.")
    }
}

var person1 = Person(name: "소녀시대", age: 20)
var baby1 = Baby(name: "걸스데이", age: 22)

if baby1 is Baby {
    print("baby1의 자료형은 Baby가 맞습니다.")
}

if baby1 is Person {
    print("baby1의 자료형은 Person이 맞습니다.")
}

출력값) baby1의 자료형은 Baby가 맞습니다.
      baby1의 자료형은 Person이 맞습니다.
```
Person 클래스는 name 과 age 속성을 갖고 있으며 Baby 클래스는 Person 클래스를 상속하여 만들었다. 이 두 개의 클래스는 이전에도 계속 만들어 보았으므로 해석이 어렵지 않을 것이다.
두 개의 클래스로부터 각각 인스턴스 객체를 만든 후 person1 과 baby1 변수에 할당한다.
그런 다음 if 문을 사용해 baby1 변수가 가리키는 객체가 Baby 자료형이 맞는지, 그리고 Person 자료형이 맞는지 확인한다.

코드를 실행하면 위의 출력값 같이 baby1 변수가 가리키는 객체는 Baby 자료형이기도 하고 Person 자료형이기도 하다는 것을 알 수 있다.

이것은 Baby 클래스가 Person 클래스를 상속했기 때문에 나온 결과이다.
Baby 클래스로부터 만들어진 인스턴스 객체는 그 클래스가 상속한 부모 클래스의 속성을 그대로 가지고 있으므로 is 연산자를 사용할 경우 부모 클래스의 자료형과 비교했을 때도 true 값을 반환한다.

is 연산자는 나중에 설명할 '프로토콜(Protocol)'을 확인할 때도 사용할 수 있다.
아직 프로토콜은 살펴보지 않았지만, is 연산자는 인스턴스 객체와 직접적으로 관련된 부모 클래스나 프로토콜에 대해 true 값을 반환한다고 생각하면 된다.


#### 객체의 자료형을 바꾸기

Baby 클래스가 Person 클래스를 상속한 것이므로 Baby는 Person이라고 말할 수 있다. 그렇다면 다음과 같이 Person 자료형으로 선언된 변수에 Baby 클래스로부터 만들어진 인스턴스 객체를 할당해 보겠다.
```swift
var person2 : Person = Baby(name: "티아라", age: 22)
```
person2 변수의 자료형이 Person이지만 Baby 클래스에서 만들어낸 인스턴스 객체를 할당해도 아무런 문제가 생기지 않는다.
이것은 Person이라는 자료형으로 만든 변수는 Baby 인스턴스 객체를 가리킬 수 있기 때문이다.

![그림](https://user-images.githubusercontent.com/47494240/54890438-c3753e80-4eec-11e9-8473-5b16deddcd11.png)

그런데 person2 변수의 자료형이 Person이므로 Baby 클래스 안에 정의한 cry 메소드는 호출할 수 없다. person2.cry()라는 코드를 입력하면 다음 결과 화면처럼 오류가 표시된다.

![오류그림](https://user-images.githubusercontent.com/47494240/54890440-c3753e80-4eec-11e9-8aef-0c59b9ad517b.png)

자료형이 Person이므로 실제 인스턴스 객체가 Baby라고 하더라도 cry 메소드를 호출할 수 없다.

![그림](https://user-images.githubusercontent.com/47494240/54890441-c3753e80-4eec-11e9-83cb-763e5657b268.png)

다시 말해, 실제 객체가 Baby로부터 만들어졌더라도 Person 자료형으로 된 변수가 그 객체를 가리킬 때는 그 자료형 안에 정의된 속성이나 메소드만 사용할 수 있다.
따라서 이 인스턴스 객체의 자료형을 Baby로 바꿔서 cry 메소드를 호출하고 싶을 때도 있을 수 있다. 이것을 형 변환 또는 '타입 캐스팅(Type Casting)'이라고 부른다.
어떤 인스턴스 객체의 형 변환은 일반적으로 상속 관계에 있는 자료형 사이에서 허용된다.

타입 캐스팅은 변환되기 전의 자료형고 변환된 후의 자료형이 상속 관계에서 위에 있는지 또는 아래에 있는지에 따라 '업 캐스팅(Up Casting)'과 '다운 캐스팅(Down Casting)'으로 나뉜다.
```swift
업 캐스팅 -> 자식 클래스 자료형을 부모 클래스 자료형으로 변환하는 경우
다운 캐스팅 -> 부모 클래스 자료형을 자식 클래스 자료형으로 변환하는 경우
```
Person 자료형으로 된 person2 변수를 Baby 자료형으로 변환하는 것은 다운 캐스팅에 해당한다. 그런데 다운 캐스팅은 변환 과정에서 오류가 발생할 가능성이 있으므로 nil이 반환될 수 있다.
이런 문제 때문에 옵셔널 캐스팅과 강제 캐스팅을 사용한다.

**형 변환을 할 때는 as 연산자를 사용하는데 다음과 같은 유형으로 나뉜다.**
```swift
as -> 업 캐스팅에 사용됨
      인스턴스객체 as 변환할자료형

as? -> 다운 캐스팅 중에 옵셔널 자료형으로 변환할 때 사용됨
      인스턴스객체 as? 반환할자료형

as! -> 다운 캐스팅 중에서 강제로 일반 자료형으로 변화할 때 사용됨
```
그러면 앞에서 만든 person2 변수를 Baby 자료형으로 변환할 때는 어떠 연산자가 사용되어야 할까? 다음과 같이 as? 연산자를 사용해 보겠다.
```swift
let baby2 = person2 as? Baby
if baby2 != nil {
    print("person2 변수의 자료형이 Baby로 변환되었습니다.")
}

출력값) person2 변수의 자료형이 Baby로 변환되었습니다.
```
person2 변수의 자료형이 Baby 자료형으로 변환된 후 baby2 상수에 할당되었다. 코드를 실행하면 정상적으로 변환된 것을 확인할 수 있다.

baby2는 옵셔널 자료형이므로 if 문에서 nil이 아닌지 확인하는 과정을 거친다. 그런데 이렇게 if 문을 사용할 때는 다음 코드처럼 if 문 안에서 바인딩하여 사용하는 경우가 많다.
```swift
if let baby3 = person2 as? Baby {
    print("\(baby3.name)는 Baby 자료형으로 형 변환되었습니다.")
}

출력값) 티아라는 Baby 자료형으로 형 변환되었습니다.
```
person2 변수의 객체를 Baby 자료형으로 형 변환한 후 baby3 상수에 할당했다. if 문 안에 상수를 바인딩했으므로 baby3 상수의 값이 nil이 아니면 if 문의 중괄호 안에 있는 코드가 실행된다.
as? 대신 as! 를 사용할 수도 있다.
```swift
let baby4 = person2 as! Baby
print("\(baby4.name)는 Baby 자료형으로 형 변환되었습니다.")

출력값) 티아라는 Baby 자료형으로 형 변환되었습니다.
```
as! 연산자를 사용하면 옵셔널 자료형으로 반환되지 않으므로 속성이나 메소드를 바로 사용할 수 있다. 그렇지만 잘못 변환될 경우 오류가 발생할 수 있다는 점에 주의해야 한다.


#### Any와 AnyObject

형 변환을 할 때는 상속 관계에 있는 클래스들끼리만 가능하다고 했는데 Any와 AnyObject는 예외적으로 사용된다.
Any는 어떤 자료형에나 들어갈 수 있는 범용 자료형이며, AnyObject는 클래스들이 상속 받는 가장 상위 클래스이다. 따라서 어떤 클래스든 AnyObject로 형 변환할 수 있다.

Any와 AnyObject 자료형으로 변수를 선언하고 Person과 Baby로부터 인스턴스 객체를 만들어 할당해 보겠다.
```swift
var person3 : Any = Person(name: "애프터스쿨", age: 24)
var baby5 : AnyObject = Baby(name: "여자친구", age: 23)
let person4 = person3 as? Person
let baby6 = baby5 as? Baby

if person4 != nil {
    print("Any에서 Person으로 형 변환되었습니다.")
}

if baby6 != nil {
    print("AnyObject에서 Baby로 형 변환되었습니다.")
}

출력값) Any에서 Person으로 형 변환되었습니다.
      AnyObject에서 Baby로 형 변환되었습니다.
```
Person 클래스로부터 만들어진 인스턴스 객체는 Any 자료형으로 선언된 person3 변수에 할당되었다. 그리고 Baby 클래스로부터 만들어진 인스턴스 객체는 AnyObject 자료형으로 선언된 baby5 변수에 할당되었다.
이 두 개의 변수는 각각 Person 과 Baby 자료형으로 형 변환되었다. 코드를 실행하면 위의 출력값 같이 잘 변환된 것을 확인할 수 있다.

Any의 경우에는 인스턴스 객체뿐만 아니라 정수나 문자열처럼 어떤 값이든 할당할 수 있는 자료형이다.
이 때문에 배열을 선언할 때 Any 자료형으로 된 원소들이 들어갈 수 있도록 선언하면 배열 안에는 어떤 것이든 원소로 들어갈 수 있다.
AnyObject에는 정수나 문자열과 같은 기본 자료형은 들어갈 수 없지만 클래스로부터 만들어진 인스턴스 객체는 어떤 것이든 들어갈 수 있다.

다음은 AnyObject 자료형으로 배열을 만든 경우와 Any 자료형으로 딕셔너리를 만들었을 때의 코드이다.
```swift
var array1 = [AnyObject]()
array1.append(person1)
array1.append(baby1)
print("array1의 크기 : \(array1.count)")

var dict1 = [String:Any]()
dict1["1"] = person1
dict1["2"] = baby1
dict1["3"] = 10
print("dict1의 크기 : \(dict1.count)")

출력값) array1의 크기 : 2
      dict1의 크기 : 3
```
array1 변수는 AnyObject가 원소로 들어갈 수 있도록 선언되었다. 그리고 person1 객체와 baby1 객체가 추가되었다.
dict1 변수는 딕셔너리로 만들어졌는데 키는 String, 값은 Any 자료형으로 선언되었다. 그러면 이 딕셔너리에는 person1 객체나 baby1 객체뿐만 아니라 10과 같은 숫자도 들어갈 수 있다.
코드를 실행하면 위의 출력값 같이 배열과 딕셔너리가 정상적으로 만들어진 것을 확인할 수 있다.

Any나 AnyObject 자료형을 배열이나 딕셔너리를 선언할 때 사용하면 편리한 점이 많다. 하지만 너무 자주 사용하면 매번 형 변환을 해야 할 수 있으므로 상황에 맞게 사용하는 것이 좋다.
