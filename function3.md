### 4_함수를 좀 더 자세히 알아보기


#### 파라미터 기본 값 지정하기

```swift
func show(message:String, terminator:String="\n") {
    print("메시지 : \(message)", terminator:terminator)
}

show(message: "안녕!", terminator: "\n")
show(message: "안녕하세요!")

출력값) 메시지 : 안녕!
출력값) 메시지 : 안녕하세요!
```
show 함수에는 두 개의 파라미터가 전달됩니다. 첫 번째는 message라는 이름의 파라미터로 화면에 출력할 문자열을 전달함.
두 번째는 terminator라는 이름의 파라미터이며, print를 사용할 때 terminator 파라미터로 전달할 문자열임.

show 함수를 정의할 때 두 번째 파라미터인 terminator에 = 기호와 함께 "\n" 문자열을 넣었음
이렇게 하면 show 함수를 호출할 때 terminator 파라미터를 생략할 수 있으며, 파라미터가 생략되었을 때의 기본 값이 "\n" 문자열이 됨.
만약 이 기본 값이 지정되어 있지 않다면 이 함수를 호출할 때 항상 두 개의 파라미터 값을 전달해야 함. 하지만 기본 값이 있기 때문에 파라미터를 하나만 입력해도 됨.

```swift
func show2(message:String, newline:Bool=true) {
    print(message, newline)
}

show2(message:"반갑습니다.")

출력값) 반갑습니다. true
```
show2 함수는 불(Bool) 자료형으로 된 두 번째 파라미터의 값을 전달 받고 있으며, 파라미터의 이름은 newline으로 지정했다.
이 값은 그 함수 안에서 print를 사용할 때 마지막 파라미터로 전달됨.
show2 함수를 호출하는 코드를 실행하면 "반갑습니다."라는 코드가 출력된다.

> 불(Bool) 자료형이란?

> 불 자료형은 0 또는 1, 참 또는 거짓과 같이 두 개의 값 중 하나만 가질 수 있는 자료형입니다.

> 불 자료형으로 만들어진 변수 안에 들어가는 값은 구별하기 쉽도록 true 또는 false로 표시합니다.
