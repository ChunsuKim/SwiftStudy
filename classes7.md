### 7_enum으로 열거형 만들기

열거형(Enumeration)은 선택할 수 있는 범위의 값을 이름으로 정의한 자료형이다.
예를 들어, 사람 객체를 만들 때 여자는 1, 남자는 2로 구분할 수도 있지만 여자를 Female, 남자는 Male로 구분하면 훨씬 직관적으로 이해할 수 있고 읽기도 좋은 코드가 된다.
이때 Female 과 Male 이라는 값을 한꺼번에 담고 있는 것이 열거형이다.

스위프트에서 열거형은 enum과 case 키워드를 사용해서 선언한다.
```swift
enum Gender {
    case Female
    case Male
}
```
enum으로 선언한 열거형은 변수를 만들 때 자료형으로 사용할 수 있으며, enum 안에 선언된 각각의 값은 점(.)을 사용해 접근할 수 있다.
여기서는 사람 객체를 만들고 그 안에 성별을 구별할 수 있는 변수를 추가해 보겠다.
```swift
enum Gender {
    case Female
    case Male
}
```
enum 키워드를 사용해서 남자와 여자를 구별할 수 있는 Gender 열거형을 만들었다. 이렇게 만든 열거형은 그다음 코드에서 성별을 구별하는 데 사용된다.
다음과 같이 Person 클래스를 만들고 그 안에 name과 gender라는 이름의 변수를 선언한다.
```swift
class Person {
    var name : String!
    var gender : Gender!
```

name 변수는 문자열 자료형으로 선언되었으며 nil 값을 가질 수 있도록 느낌표(!) 기호를 붙였다.
gender 변수는 열거형으로 선언되었으며 마찬가지로 nil값을 가질 수 있도록 느낌표(!) 기호를 붙였다.
이 두 개의 변수가 가지는 값을 초기화하는 초기화 함수와 메소드를 다음 코드처럼 추가한다.
```swift
    init() {
    
    }

    init(name: String, gender: Gender) {
        self.name = name
        self.gender = gender
    }

    func getGender() -> Gender {
        return self.gender
    }
}
```
하나는 아무런 파라미터도 받지 않는 초기화 함수이고 나머지 하나는 이름과 성별 값을 전달 받은 후 self 키워드를 사용해 클래스 안에 정의한 name과 gender 변수에 값을 할당하는 초기화 함수이다.
그리고 그 아래에는 성별을 확인할 수 있는 getGender 메소드를 추가한다.

이제 이 Person 클래스를 사용해 인스턴스 객체를 만들고 성별이 무엇인지 확인하는 코드를 추가한다.
```swift
var person1:Person = Person(name: "소녀시대", gender: Gender.Female)
```
person1 변수는 Person 자료형으로 선언한 후 Person과 소괄호를 사용해 Person 인스턴스 객체를 만들어 할당했다.
name이라는 파라미터에는 사람 이름을 값으로 넣었고, gender라는 이름의 파라미터에는 Gender.Female이라는 값을 넣었다. 이처럼 열거형 안에 정의한 값은 점(.) 연산자를 사용해 접근할 수 있다.

이렇게 속성으로 할당된 열거형 변수의 값을 확인하고 싶다면 if 문이나 switch 문을 사용할 수 있다. switch 문은 나중에 다시 살펴볼 것이므로 여기에서는 if 문으로 확인한다.
```swift
if person1.gender == .Female {
    print("여자입니다.")
} else if person1.gender == .Male {
    print("남자입니다.")
}

출력값) 여자입니다.
```
if 문의 첫 번쨰 조건으로 person1 객체의 gender 속성 값이 Female인지 확인한다.
그런데 비교 연산자인 == 기호로 비교하는 부분을 보면 오른쪽에 있어야 할 Gender.Female 코드가 .Female로 되어있다.
열거형 안에 정의된 값은 if 문이나 switch 문처럼 연속된 코드 블록을 사용할 때 열거형의 이름을 생략하고 바로 점(.)만 붙여서 시작할 수 있다. 따라서 다음 두 코드는 같다.
```swift
if person1.gender == Gender.Female { ... }
if person1.gender == .Female { ... }
```
실제 코드를 작성할 때는 두 번째 줄에 있는 것처럼 열거형 이름을 생략하는 경우가 많다.
if 뒤에 오는 조건에서는 Female인지 비교한 다음 맞으면 '여자입니다.'라는 글자를 출력한다.
이것은 if 문이 여러 가지 조건을 비교할 수 있으며 if ~ else, if ~ else if 와 같은 형태로 사용할 수 있기 때문에 가능하다.
따라서 열거형 안에 정의한 값이 여러 개일 경우 각각의 값을 연속해서 비교할 수 있다.

