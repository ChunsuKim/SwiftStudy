#### 딕셔너리에 전화번호부 데이터 넣기

앞에서 전화번호부에 친구 그룹과 가족 그룹을 배열로 만들어 넣었지만 각각의 그룹이 어떤 이름으로 되어 있는지는 넣지 않았다.
딕셔너리를 사용하면 그룹의 이름까지 같이 넣을 수 있으니 전화번호 데이터를 넣어 두는 형태가 좀 더 명확하게 보인다.
```swift
var phonebook : [String:[String]] = [:]

var family : [String] = ["엄마", "아빠", "오빠"]
phonebook["가족"] = family

var friends : [String] = ["소녀시대", "걸스데이", "티아라"]
phonebook["친구"] = friends

print("전화번호부의 그룹 개수 : \(phonebook.count)")

for (group, names) in phonebook {
    print("전화번호부 그룹 이름 : \(group)")
    print("\(group) 그룹의 이름들 : \(names)")
}

출력값) 전화번호부의 그룹 개수 : 2
출력값) 전화번호부 그룹 이름 : 가족
출력값) 가족 그룹의 이름들 : ["엄마", "아빠", "오빠"]
출력값) 전화번호부 그룹 이름 : 친구
출력값) 친구 그룹의 이름들 : ["소녀시대", "걸스데이", "티아라"]
```
phonebook 변수는 딕셔너리 자료형인데 키는 String 자료형, 값은 String의 배열로 선언되었다. 이 딕셔너리에 원소를 추가하기 위해 먼저 family라는 이름의 배열 객체를 만든다.
그리고 '가족'이라는 키와 함께 phonebook 딕셔너리에 추가한다. friends 변수에는 친구들의 이름을 넣어 배열을 만든 후 할당한다. 그리고 '친구'라는 키와 함께 phonebook 딕셔너리에 추가한다.

그 아래에서는 딕셔너리 안에 들어 있는 원소들을 모두 출력해 보기 위해 for ~ in 구문을 사용했다. 이 구문은 phonebook 안에 있는 원소들을 하나씩 꺼내어 투플로 만든 후 for 문의 중괄호안에 있는 코드를 실행한다.
for 키워드 뒤에 있는 소괄호 안에는 group과 names라는 이름의 상수가 들어 있으며, group에는 '가족', '친구'와 같은 키가 할당되고 names에는 배열 객체가 할당된다.

딕셔너리 안에 있는 원소들을 모두 확인할 때는 enumerated 메소드를 사용할 수도 있다.
for ~ in 구문의 in 뒤에 딕셔너리 객체만 넣는 것이 아니라 enumerated 메소드를 호출하여 반환된 객체를 넣어주면 in 앞에 있는 두 변수에는 인덱스와 원소가 들어간다.
enumerated 메소드를 사용해 보기 위해 다음 코드를 추가한다.
```swift
for (index, elem) in phonebook.enumerated() {
    print("전화번호부 그룹 인덱스 : \(index)")
    print("각 그룹 : \(elem)")
}

출력값) 전화번호부 그룹 인덱스 : 0
출력값) 각 그룹 : (key: "가족", value: ["엄마", "아빠", "오빠"])
출력값) 전화번호부 그룹 인덱스 : 1
출력값) 각 그룹 : (key: "친구", value: ["소녀시대", "걸스데이", "티아라"])
```
코드를 실행하면 phonebook 딕셔너리 안에 들어 있는 각각의 원소를 인덱스 값과 함께 확인할 수 있어 출력한 순서를 구별하기 좋게 결과가 출력된다.

딕셔너리 객체 안에 들어 있는 원소들의 키들만 배열로 뽑아내거나 값들만 배열로 뽑아내고 싶을 때는 keys와 values 속성을 사용한다. 다음 코드를 추가한다.
```swift
let keys = [String](phonebook.keys)
let values = [[String]](phonebook.values)

print("전화번호부 키 배열 : \(keys)")
print("전화번호부 값 배열 : \(values)")

for group in phonebook.keys.sorted().reversed() {
    print("전화번호부 그룹 이름 : \(group)")
}

출력값) 전화번호부 키 배열 : ["가족", "친구"]
출력값) 전화번호부 값 배열 : [["엄마", "아빠", "오빠"], ["소녀시대", "걸스데이", "티아라"]]
출력값) 전화번호부 그룹 이름 : 친구
출력값) 전화번호부 그룹 이름 : 가족
```
원소들의 키는 배열로 만들어져 keys 상수에 할당되었으며 값은 배열로 만들어져 values 상수에 할당되었다. 각 원소의 값은 배열이므로 대괄호 안에 대괄호가 들어간 형태로 선언되어야 한다.
배열의 경우에도 sorted 메소드를 호출할 수 있으며 내림차순으로 정렬하고 싶다면 reversed 메소드를 다시 호출한다.

지금까지 전화번호부의 그룹 이름과 각각의 그룹 안에 들어 있는 사람 이름들을 딕셔너리에 넣어 관리하는 방법을 알아보았다. 이름으로 무언가를 찾을 수 있고 빨리 찾아볼 수 있다는 점은 딕셔너리의 가장 큰 장점이다.

Quiz 25

가족 구성원의 이름을 넣은 딕셔너리를 만든 후 가족 구성원의 이름을 모두 출력해 보세요. 딕셔너리를 만들 때 아빠의 이름은 OOO처럼 '아빠'라는 글자를 키로 하고 실제 이름이 값이 되도록 만듭니다.
그리고 이렇게 만든 딕셔너리의 원소를 모두 출력합니다.
```swift
var members:[String:String] = [:]
members["아빠"] = "김진수"
members["엄마"] = "한수희"
members["오빠"] = "김현수"
members["누나"] = "김선희"
members["나"] = "김현민"

print("가족 구성원의 수 : \(members.count)")

for (key, value) in members {
    print("구성원 " + key + " -> " + value)
}

출력값) 가족 구성원의 수 : 5
출력값) 구성원 아빠 -> 김진수
출력값) 구성원 오빠 -> 김현수
출력값) 구성원 엄마 -> 한수희
출력값) 구성원 나 -> 김현민
출력값) 구성원 누나 -> 김선희
```

[Ch5_set1.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch5_set1.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
