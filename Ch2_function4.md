#### 내부 파라미터와 외부 파라미터


앞에서 파라미터를 설명할 때 Swift의 함수는 내부 파라미터 이름과 외부 파라미터 이름을 다르게 만들 수 있다고 했다.
이번엔 일반적인 더하기 함수를 정의할 때 외부 파라미터 이름을 지정하는 경우와 그렇지 않은 경우를 비교한다.
```swift
func add(a:Int, b:Int) -> Int {
    return a + b
}

var result = add(a: 10, b: 10)
print("add 함수 호출 결과 -> \(result)")

출력값) add 함수 호출 결과 -> 20
```
add 함수를 정의할 때 소괄호 안에 a와 b라는 이름의 파라미터를 추가했다.
이렇게 하면 파라미터의 이름은 외부 파라미터이면서 내부 파라미터로도 사용할 수 있다.

이제 add2라는 이름의 새로운 더하기 함수를 만들어서 약간 바꾸어 보겠다.
```swift
func add2(firstNum a:Int, secondNum b:Int) -> Int {
    return a + b     // 외,내부 파라미터를 설정했을 경우 함수안은 내부 파라미터로 연산한다.
}

result = add2(firstNum: 20, secondNum: 20)   // 외,내부 파라미터를 설정했을 경우 함수 호출은 외부 파라미터로 호출한다.
print("add2 함수 호출 결과 -> \(result)")

출력값) add2 함수 호출 결과 -> 40
```
add2 함수의 파라미터를 보면 a라는 이름 앞에 firstNum라는 이름을 하나 더 입력했다.
그리고 b라는 이름 앞에는 secondNum라는 이름을 추가했다.
이렇게 하면 함수를 호출할 때 두 개의 파라미터 모두 외부 파라미터의 이름을 지정하면서 값을 넣어주어야 한다.

**외부 파라미터 이름을 지정한 경우에는 함수를 호출할 때 외부 파라미터 이름으로 넣어주어야 한다는 사실을 잊지 말자.**





[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
