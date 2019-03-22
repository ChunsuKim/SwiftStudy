셋에 들어 있는 모든 데이터는 모두 다른 값을 가직 있어야 한다. 따라서 같은 값을 insert 메소드로 자루 속에 넣게 되면 두 개의 값이 존재하는 것이 아니라 새로운 값이 기존 값을 덮어쓰게 된다.
또한 셋은 집한 연산을 할 수 있도록 도와준다. 집합 연산으로는 다음과 같은 것들이 있다.
```swift
intersection          -> 교집합
union                 -> 합집합
symmetricDifference   -> 여집합
subtracting           -> 차집합
```
집합 연산을 해보기 위해 다음 코드를 입력한다.
```swift
var names1 : Set<String> = ["소녀시대", "걸스데이", "티아라"]
var names2 : Set<String> = ["걸스데이", "애프터스쿨"]

names2.insert("애프터스쿨")
print("names2 셋의 원소 개수 : \(names2.count)")

var output = names1.intersection(names2)
print("intersection 결과 : \(output)")

output = names1.union(names2)
print("union 결과 : \(output)")

output = names1.symmetricDifference(names2)
print("symmetricDifference 결과 : \(output)")

output = names1.subtracting(names2)
print("subtracting 결과 : \(output)")

출력값) names2 셋의 원소 개수 : 2
출력값) intersection 결과 : ["걸스데이"]
출력값) union 결과 : ["티아라", "소녀시대", "걸스데이", "애프터스쿨"]
출력값) symmetricDifference 결과 : ["소녀시대", "티아라", "애프터스쿨"]
출력값) subtracting 결과 : ["소녀시대", "티아라"]
```
names1 변수에는 세 개의 이름이 셋(Set)에 담겨서 할당되었으며 names2 변수에는 두 개의 이름이 셋(Set)에 담겨 할당되었다. 두 개의 셋(Set)에 들어 있는 이름 중에서 하나는 중복된다.

먼저 insert 메소드를 호출하여 names2 셋에 새로운 이름을 추가한다. 그런데 이 이름은 이미 그 셋에 들어 있다. 이렇게 동일한 이름을 추가해도 names2 셋의 원소 개수는 변하지 않는다.
그 아래에는 intersection, union, symmetricDifference, subtracting 메소드를 호출하여 집합 연산을 수행한 결과를 output 변수에 넣어 출력하도록 한다.

지금까지 여러 개의 데이터를 담아둘 수 있는 배열과 딕셔너리 그리고 셋에 대해 알아보았다. 세 가지 자료형 모두 여러 개의 데이터를 한꺼번에 담고 있어 코드가 복잡하게 만들어지는 것처럼 보인다.
하지만 객체에 들어 있는 속성이나 메소드의 이름이 비슷하고 객체를 다루는 방법도 비슷하기 때문에 하나의 자료형에만 익숙해지면 나머지는 쉽게 이해될 것이다.

Quiz 26

가족 구성원의 이름을 넣은 셋(Set)을 만든 후 가족 구성원의 이름을 모두 출력해 보세요. 셋을 만들 때는 가족 구성원의 이름을 사용해 만듭니다. 그리고 이렇게 만든 셋의 원소를 모두 출력합니다.
```swift
var members:Set<String> = []
members.insert("아빠")
members.insert("엄마")
members.insert("오빠")
members.insert("누나")
members.insert("나")

print("가족 구성원의 수 : \(members.count)")

var index = 0
for name in members {
    print("가족 구성원 #" + String(index) + " -> " + name)
    index += 1
}

출력값) 가족 구성원의 수 : 5
출력값) 가족 구성원 #0 -> 오빠
출력값) 가족 구성원 #1 -> 나
출력값) 가족 구성원 #2 -> 누나
출력값) 가족 구성원 #3 -> 엄마
출력값) 가족 구성원 #4 -> 아빠
```
