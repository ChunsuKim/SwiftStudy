# 여러 데이터를 논리에 맞게 처리하기 - 배열, 딕셔너리, 셋

### 1_여러 데이터를 한꺼번에 넣어두기

코드를 입력하다 보면 하나의 문자열이 아니라 여러 개의 문자열을 한꺼번에 담아두어야 할 때가 많다.
예를 들어, 사람을 나타내는 Person 클래스를 만들고 그 안에 name 변수를 선언했다면 클래스를 만들 때마다 각 사람 객체의 이름을 지정해야 한다.
그리고 이름을 변수에 미리 넣어 두었다면 객체의 숫자만큼 변수를 만들었다가 할당해야 한다.
그런데 Person 객체를 만들 때 필요한 이름이 열 명 이상인 경우, 이 사람들 이름을 미리 변수에 보관해 두고 싶다면 어떻게 하는 것이 좋을까?
간단히 생각할 수 있는 방법은 여러 개의 변수를 만들고 그 안에 이름을 넣어두는 것이다.


#### 여러 데이터를 각각의 변수에 넣기
```swift
class Person {
    var name : String?
    
    init(name:String) {
        self.name = name
    }
}
```
Person 클래스에는 이름을 넣어둘 수 있는 name 변수가 하나 선언되어 있다. name 변수는 nil이 들어갈 수 있도록 물음표(?)를 붙여 옵셔널 자료형을 만든다.
그리고 그 밑에는 초기화 함수인 init 함수를 만들어 사람 객체를 만들 때 그 사람의 이름을 파라미터로 전달 받아 name 변수에 할당할 수 있도록 했다.
이 Person 클래스는 이전 장에서 다루었던 클래스의 가장 기본적인 형태이므로 어렵지 않게 만들 수 있다.

입력한 코드 아래에는 사람 객체를 몇이나 만들었는지 알 수 있도록 count 변수를 하나 선언하고 사람 객체를 만드는 creatPerson 함수도 추가한다.
그리고 name 변수 대신에 name1 부터 name5 까지 다섯 개의 상수를 선언하여 다섯 명의 사람 이름을 넣을 수 있도록 수정한다.
```swift
var count = 0
let name1 = "소녀시대"
let name2 = "걸스데이"
let name3 = "여자친구"
let name4 = "티아라"
let name5 = "애프터스쿨"

func createPerson() -> Person {
    var person : Person!
    if count == 0 {
        person = Person(name: name1)
    } else if count == 1 {
        person = Person(name: name2)
    } else if count == 2 {
        person = Person(name: name3)
    } else if count == 3 {
        person = Person(name: name4)
    } else if count == 4 {
        person = Person(name: name5)
    }
    count += 1
    return person
}
```

다섯 명의 이름을 알고 있다고 전제하고 다섯 개의 상수를 만든 후 사람 이름을 각각 상수에 넣어둔다. 그리고 createPerson 함수를 호출할 때마다 반복하여 사람 객체를 만들게 한다.
사람 객체를 만들 때마다 count 변수의 값을 1씩 증가시킬 것이므로 count 변수는 createPerson 함수 밖에 선언해서 사용한다.

createPerson 함수 안에서는 if 문을 사용해 함수가 몇 번 호출되었는지 확인한 후 사람 객체를 만들도록 한다.
//따라서 함수가 호출될 때마다 count 변수의 값을 하나씩 더해주면 매번 함수가 호출될 때마다 count 변수의 값이 달라지기 때문에 그다음 이름으로 사람 객체를 만들게 된다.

코드의 양이 많아 보이지만 잘 보면 똑같은 내용으로 만들어진 두 줄의 코드가 계속 반복되고 있다. 처음 버튼이 눌려질 때는 count 변수의 값이 0이므로 if count == 0 이라는 조건에 맞게 된다.
즉, count 변수에 들어 있는 값이 0일 때라는 조건이 들어가고 그 안에서 name1 변수에 들어 있는 사람 이름을 사용해서 person1 객체를 만든다.
```swift
var person1 : Person
person1 = createPerson()
print("만들어진 사람 객체 : \(person1.name!)")

person1 = createPerson()
print("만들어진 사람 객체 : \(person1.name!)")

person1 = createPerson()
print("만들어진 사람 객체 : \(person1.name!)")

출력값) 만들어진 사람 객체 : 소녀시대
출력값) 만들어진 사람 객체 : 걸스데이
출력값) 만들어진 사람 객체 : 여자친구
```
person1 변수는 Person 자료형으로 선언되었으며 createPerson 함수를 호출하여 반환된 객체를 할당했다.
이렇게 여러 번 creatPerson 함수를 호출하면서 Person 객체 안에 들어 있는 name 속성의 값을 확인해 본다.

여러 사람의 이름을 여러 개의 상수에 넣어 두었다가 함수를 호출할 때마다 사람 객체를 만드는 코드를 만들어 보았다. 이전 장까지 잘 따라서 익혔다면 코드에서 어려운 부분은 별로 없을 것이다.
그런데 코드를 잘 보면 if 문 안에서 비교하는 과정이 여러 번 중복된다. 만약 사람 객체를 100명 정도 만들고 싶다면 100개의 상수를 선언하고 if 문 안에서 100번씩이나 비교해야 할까?


[Ch5_array2.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch5_array2.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
