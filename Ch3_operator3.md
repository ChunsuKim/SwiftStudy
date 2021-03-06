### 4_범위 연산자 알아보기


범위 연산자는 연속된 숫자 값을 일정한 범위로 알려주는 기능을 한다, 특히 1, 2, 3, 4, 5와 같이 순서대로 값을 입력할 때 유용하게 사용될 수 있다.
범위 연산자는 보통 for ~ in 구문과 함께 사용된다.
이런 범위 연산자는 두 종류가 있는데 하나는 '닫힌 범위 연산자(Closed Rage Operator)'이고 또 다른 하나는 '반 닫힌 범위 연산자(Half-closed Range Operator)'이다.

닫힌 범위 연산자의 형식은 다음과 같다. 1, 2, 3, 4, 5라는 연속된 숫자 값이 있다고 가정했을 때 범위 연산자로 표현하면 1...5가 된다.

이 ... 기호는 그 앞과 뒤에 있는 값을 모두 포함하는 연속된 숫자를 나타낸다.
```swift
시작숫자 ... 끝숫자
```
반 닫힌 범위 연산자의 형식은 다음과 같다. 예를 들어 1, 2, 3, 4, 5라는 연속된 숫자 값을 반 닫힌 범위 연산자로 표현하면 1..<6이 된다.
이 ..< 기호는 뒤에 있는 값을 포함하지 않고 이전 값까지 연속된 숫자를 나타낸다.
```swift
시작숫자 ..< 끝숫자
```
범위 연산자는 보통 for ~ in 구문과 함께 사용된다고 했는데 가장 대표적인 것이 sum 함수이다.
```swift
func sum(start:Int, end:Int) -> Int {
    var total = 0
    for i in start ..< end {
        total += i
    }
    
    return total
}

var result = sum(start: 1, end: 11)
print("sum(start:1, end:11)의 결과 -> \(result)")

출력값) sum(start:1, end:11)의 결과 -> 55
```
sum 함수는 두 개의 정수형 파라미터를 전달 받는데 이 두 개의 값은 시작과 끝을 나타낸다.
따라서 for ~ in 구문에서 in 다음에 start ..< end 라고 넣으면 start 파라미터의 값부터 시작하여 1씩 증가하는 연속된 값을 end 파라미터의 값 이전까지 하나씩 꺼내게 된다.
꺼낸 값은 in 앞에 있는 i 변수에 할당되고 for 문의 중괄호 안에 있는 코드가 반복 실행되면서 total 변수에 더해진다.
여기서 i 변수는 여러분이 직접 선언하지 않고 변수 이름만 넣어도 된다는 점에 주의하자.
start ..< end 대신에 start ... end 라는 코드를 넣을 수도 있는데 이렇게 수정하면 end 값까지 모두 포함한 값을 더한다.
sum 함수를 호출하여 1부터 10까지 더해주고 싶다면 파라미터의 값을 1과 11로 만들어 전달한다. 입력한 코드를 실행하면 위의 출력값을 볼 수 있다.
범위 연산자는 C나 자바와 같은 언어에서는 보기 힘든 연산자이므로 잘 기억해야 한다.

지금까지 알아본 다양한 연산자들 이외에도 as 연산자, 또는 점(.) 연산자 등이 있다.
특히 if 문이나 for 문을 사용할 때 연산자가 같이 사용된다는 것도 알게 되었다.

 Quiz 15

for 문을 사용해 200부터 500까지 숫자를 더한 후 그 결과를 출력해 보세요. for ~ in 구문을 사용할 때 범위 연산자를 함께 사용하고 for 문이 끝난 후 결과 값을 출력하도록 합니다.
```swift
let start:Int = 200
let end:Int = 500

var total = 0
for i in start...end {
    total += i
}

print("200부터 500까지 더한 값 : \(total)")

출력값) 200부터 500까지 더한 값 : 105350
```


[Ch3_operator4.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch3_operator4.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
