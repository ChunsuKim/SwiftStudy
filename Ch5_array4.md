#### 배열의 원소를 확인하거나 추가하기

배열에 들어 있는 원소를 확인하려면 대괄호 안에 인덱스 값을 숫자로 넣으면 된다. 그런데 이 값들을 하나씩 확인하지 않고 차례대로 넘어가면서 모두 확인하고 싶다면 for 문을 사용하면 된다.

이번에는 배열의 원소들을 차례대로 확인하는 코드를 만들어 보겠다.
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

var persons : Array<Person> = Array<Person>()

for i in 0..<5 {
    print("인덱스 \(i)의 사람이름 : \(names[i])")
    let person = createPerson()!
    persons.append(person)
    print("만들어진 사람 객체 : \(person.name!)")
}

출력값) 인덱스 0의 사람이름 : 소녀시대
출력값) 만들어진 사람 객체 : 소녀시대
출력값) 인덱스 1의 사람이름 : 걸스데이
출력값) 만들어진 사람 객체 : 걸스데이
출력값) 인덱스 2의 사람이름 : 여자친구
출력값) 만들어진 사람 객체 : 여자친구
출력값) 인덱스 3의 사람이름 : 티아라
출력값) 만들어진 사람 객체 : 티아라
출력값) 인덱스 4의 사람이름 : 애프터스쿨
출력값) 만들어진 사람 객체 : 애프터스쿨
```
사람 이름을 사용해 만든 사람 객체들은 배열 객체에 넣을 것이다. Person 객체를 담을 수 있는 배열의 자료형은 Array<Person>으로 하고 빈 배열 객체를 만들어 persons 변수에 할당한다.
앞에서도 설명했지만 빈 배열 객체를 만들 때는 Array<Person>() 코드를 사용한다는 것을 기억해야 한다.

그 아래에도 for 문이 있으며 ()부터 시작해서 5보다 작은 숫자일 때 중괄호 안의 코드가 반복 실행 되도록 한다.
중괄호 안에는 i 변수의 값을 사용해 names 배열에 들어 있는 각각의 원소를 출력하고 이 이름으로 Person 객체를 만들어 배열에 추가한다. 배열에 원소를 추가할 때는 다음 메소드를 사용할 수 있다.
```swift
append(newElement: Element)
```
만약 배열 중간에 값을 추가하고 싶다면 insert 메소드를 사용하면 된다.
```swift
insert(newElement: Element, at: Int)
```
어떤 일을 반복적으로 수행할 때 사용하는 것이 for 문인데 for 문은 그 안에 들어 있는 조건이 맞을 때까지 반복하여 기능을 실행하게 한다.

![그림](https://user-images.githubusercontent.com/47494240/54599537-2d6d8e00-4a7e-11e9-86da-2a43eef3ddf6.png)

이번에는 배열에 여러 개의 원소를 한꺼번에 추가한 후 그 중 하나의 원소를 삭제하는 방법을 알아보겠다. 배열에 배열을 추가할 때는 + 연산자를 사용할 수 있다.
예를 들어, ages라는 배열에 두 개의 숫자를 더하고 싶다면 다음과 같은 코드를 사용한다.
```swift
ages += [32, 33]
```
만약 특정 위치에 있는 원소를 제거하고 싶다면 remove 함수를 호출하면 된다.
```swift
remove(at: Int) -> T
```
```swift
참고) remove 함수의 API 문서에서 T는 무엇을 의미할까?
remove 함수를 표시할 때 반환하는 결과 값의 자료형으로 T가 표시되어 있다. 이것은 어떤 자료형도 될 수 있다는 표시이다.
예를 들어, Person 자료형의 값을 반환할 수도 있고 String 자료형의 값을 반환할 수도 있다는 의미이다.
```
보통 append 함수를 호출하여 배열의 마지막 부분에 원소를 추가하고 나면 그 원소를 다시 제거해야 할 때도 많다. 이때는 removeLast 함수를 호출하여 제거한다.
```swift
removeLast() -> T
```
다음 코드를 추가하여 names 배열에 두 개의 이름을 더 추가하고 맨 앞에 있는 원소를 하나 삭제한다. 그리고 for 문을 사용해 배열 안의 모든 원소를 사람 객체로 만든다.
```swift
var names2 = ["소녀시대", "걸스데이", "여자친구", "티아라", "애프터스쿨"]
let ages2 = Array<Int>([20, 23, 22, 20, 21])

names2.append("에어핑크")
names2.remove(at: 0)
names2.removeLast()
print("names2의 크기 : \(names2.count)")

for i in 0..<names2.count {
    print("인덱스 \(i)의 사람이름 : \(names2[i])")
    let person = Person(name: names2[i], age: ages2[i])
    persons.append(person)
    print("만들어진 사람 객체 : \(person.name!)")
}

출력값) names2의 크기 : 4
출력값) 인덱스 0의 사람이름 : 걸스데이
출력값) 만들어진 사람 객체 : 걸스데이
출력값) 인덱스 1의 사람이름 : 여자친구
출력값) 만들어진 사람 객체 : 여자친구
출력값) 인덱스 2의 사람이름 : 티아라
출력값) 만들어진 사람 객체 : 티아라
출력값) 인덱스 3의 사람이름 : 애프터스쿨
출력값) 만들어진 사람 객체 : 애프터스쿨
```
다섯 명의 사람 이름이 names2 배열에 들어 있다. 이 배열의 append 함수를 호출하여 하나의 사람 이름을 추가한 후 remove 메소드를 호출하여 첫 번째 사람 이름을 삭제한다.
remove 메소드에는 인덱스 값이 파라미터로 전달되어야 하므로 소괄호 안에 파라미터 이름인 at과 콜론(:) 그리고 숫자 0을 넣는다. removeLast 메소드를 한 번 더 호출하면 새로 추가했던 이름이 삭제된다.

for 문에서는 in 연산자 뒤에 0부터 names2 배열 크기보다 작을 때까지의 범위를 지정한다. 그리고 중괄호 안에서는 Person 객체를 만들 때 names2와 ages2 배열에서 가져온 원소를 파라미터로 전달한다.

만약 배열 안에 원하는 원소가 들어 있는지 확인하고 싶다면 contains 함수를 사용한다.
```swift
contains(Element)
```
contains 함수는 전달된 파라미터 값과 배열 안의 특정 원소가 일치할 경우 true를 반환한다.
배열 안에 원하는 원소 값이 있을 때 코드를 실행하도록 하는 경우가 많으므로 다음 코드처럼 contains 함수와 if 문이 함께 사용될 때가 많다.
```swift
var animals: [String] = ["bird", "tiger"]

if animals.contains("bird") {
      print(true)
}
```
index 함수는 특정 원소의 인덱스 값을 알고 싶을 떄 사용한다.
```swift
index(of: Element)
```
contains 함수와 index 함수를 사용해 보기 위해 다음 코드를 추가한다.
```swift
let target = "티아라"
if names2.contains(target) {
    var index = names2.index(of:target)
    print("\(target)의 인덱스 값 : \(index!)")
}

출력값) 티아라의 인덱스 값 : 2
```
찾으려는 사람의 이름은 target 상수에 넣어 두었다. if 문을 사용해 names2 배열 안의 target 상수에 들어 있는 이름과 같은 이름이 있는지 확인하기 위해 contains 함수가 호출되었다.
만약 들어 있다면 중괄호 안의 코드가 실행된다. 이때 그 안에서는 names2 배열에서 target 상수의 값이 몇 번째 인덱스에 있는지 확인한다.

**원소를 추가하거나 삭제할 때 배열의 끝부분에 추가한 후 필요할 때마다 끝부분에 있는 값을 꺼내어 확인하는 경우가 많다. 이것을 '스택(Stack)'이라고 한다.**
배열에는 append 함수와 함께 popLast 함수가 있어 스택처럼 사용할 수 있도록 한다.
```swift
append(Element)
popLast() -> Element
```
배열 이름 뒤에 대괄호를 붙이고 그 안에 인덱스를 넣으면 값을 수정할 수도 있다. 예를 들어, 다음처럼 ages라는 이름의 배열 안에 들어 있는 정수 값을 바꿀 수 있다.
```swift
ages[2] = 28
```
범위를 사용해 배열의 원소를 수정할 수도 있다. 다음은 ages라는 이름의 배열 안에 들어 있는 여러 개의 정수 값을 바꿀 때 사용하는 코드이다.
```swift
ages[1..<3] = [29, 31]
```
배열 객체에 값을 넣거나 빼는 경우가 많으므로 지금까지 살펴보았던 append나 insert 함수들에 익숙해져야 합니다. 따라서 코드와 친해질 때까지 여러 번 입력해 보길 바란다.


[Ch5_array5.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch5_array5.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
