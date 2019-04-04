### 2_배열 다루기

배열을 한 번 만들고 그 안에 여러 개의 값을 넣어 두었다면 그 배열 안에 있는 원소들을 하나씩 꺼내어 사용하거나 그 배열에 원소를 추가하는 경우가 자주 생기게 된다.
스위프트는 배열을 다룰 수 있는 다양한 속성과 메소드를 제공하므로 배열에 원소를 추가하거나 삭제하는 것이 가능하다.


#### 배열의 크기 확인하기

사람의 이름을 여러 개의 변수에 나누어 넣었던 것을 하나의 배열에 넣어 두는 방식으로 바꿔도 같은 결과가 출력된다는 것을 확인했다.
그런데 count 변수의 값을 1씩 증가시키면서 createPerson 함수를 계속 호출하다보면 count 변수의 값이 5보다 커지게 되는데 그 순간에 오류가 발생한다.

배열은 크기가 정해져 있고 정해진 크기 이상의 데이터 공간을 갖고 있지 않으므로 배열 내에 원소가 들어갈 수 있는 공간의 개수 이상으로 인덱스의 값을 크게 만들면 오류가 발생한다.
이 때문에 배열을 만들어 사용할 때는 항상 인덱스의 값이 배열의 크기보다 커지지 않게 확인하는 것이 필요하다.

배열의 크기는 배열 객체의 속성 중에서 count 속성을 사용하면 확인할 수 있다.
```swift
class Person {
    var name : String?
    var age : Int = 0
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
}

var count = 0
let names = ["소녀시대","걸스데이","여자친구","티아라","애프터스쿨"]
let ages = Array<Int>([20,23,22,20,21])

func createPerson() -> Person? {
    var person : Person?
    if count < names.count {
        person = Person(name:names[count], age:ages[count])
    } else {
        print("인덱스 \(count)에 사람 이름이 없습니다.")
    }
    
    count += 1
    return person
}
```
createPerson 함수에서 반환하는 객체의 자료형을 Person?으로 수정했다. 이것은 createPerson 함수에서 nil을 반환할 수도 있기 때문이다.
그 안에 선언한 person 변수의 자료형도 Person?으로 수정한다. 사람 객체를 만들 때는 if 문을 사용해 count 변수의 값이 names 배열의 크기보다 작은지 비교하도록 했다.
그리고 배열 안에 사람 이름이 있으면 사람 객체를 만들고 이름이 없으면 사람 이름이 없다는 메시지만 화면에 출력한다.

createPerson 함수를 호출하는 코드 부분도 다음 코드처럼 수정한다.
```swift
var person1 : Person?
person1 = createPerson()
print("만들어진 사람 객체 : \(person1!.name!)")

person1 = createPerson()
print("만들어진 사람 객체 : \(person1!.name!)")

person1 = createPerson()
print("만들어진 사람 객체 : \(person1!.name!)")

person1 = createPerson()
person1 = createPerson()
person1 = createPerson()

출력값) 만들어진 사람 객체 : 소녀시대
출력값) 만들어진 사람 객체 : 걸스데이
출력값) 만들어진 사람 객체 : 여자친구
출력값) 인덱스 5에 사람 이름이 없습니다.
```
createPerson 함수에서 반환하는 객체가 nil이 될 수 있으므로 person1 변수의 자료형도 Person? 으로 수정한다.
그리고 person1 변수에서 가리키는 객체 안에 들어 있는 name 속성을 참조할 때는 느낌표(!) 기호를 사용해 옵셔널을 해제한다.

코드를 실행하면 배열 원소가 없을 때도 오류를 발생시키지 않는 것을 확인할 수 있다.

배열에 들어 있는 원소가 하나도 없는 경우도 있다. 만약 배열이 비었는지 확인하고 싶다면 isEmpty 속성을 사용하면 된다.
배열이 비어 있다면 isEmpty 속성에 true 값이 들어간다.
```swift
if names.isEmpty { ... }
```
여러 데이터를 배열에 저장하니 코드가 많이 줄어들어 효율적이라는 생각이 들 것이다.
하지만 코드가 줄어든 만큼 인덱스 값을 계산하거나 변수에 들어 있는 값이 몇 번째 값인지 머릿속으로 잘 기억하고 있어야 오류가 없는 코드를 만들 수 있다.
따라서 배열을 사용하는 코드를 잘 해석해 보고 반복적으로 연습해서 익숙해지는 것이 좋다.


[Ch5_array4.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch5_array4.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
