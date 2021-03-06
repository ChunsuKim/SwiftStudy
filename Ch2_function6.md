### 상수로 정의된 파라미터와 inout 파라미터


함수를 호출할 때 전달되는 파라미터에는 숫자 10이나 문자열인 "안녕!"과 같은 값을 직접 넣어줄 수도 있고 값이 들어 있는 변수를 지정하여 전달할 수도 있다.
그런데 이렇게 전달한 파라미터의 값은 함수 내부에서 참조할 때 복사하여 참조한다.
**다시 말해, 함수를 호출할 때 전달했던 값이 복사되어 함수 내부에서 사용된다.**

이렇게 전달된 값은 함수 내부에서 참조할 때 상수로 참조한다.

```swift
func show(message : String) {
    print("전달 받은 메세지 -> \(message)")
}

show(message: "안녕!")        //전달 받은 메세지 -> 안녕!

출력값) 전달 받은 메세지 -> 안녕!
```
코드를 살펴보면 show 함수는 message 파라미터를 전달 받도록 되어 있다.
그런데 show 함수에는 지금까지 했던 방식과 다르게 변수 앞에 var이나 let을 붙이지 않았다.

그러면 message 파라미터는 함수 내부에서 변수로 정의되었을까? 상수로 정의되었을까?

message라는 파라미터의 이름만 적어 놓았다면 그 앞에 let이 생략된 것이다.
따라서 상수 파라미터라고 할 수 있으며 실제로는 let을 붙인 것이라고 생각하면 된다.

만약 값을 변수에 넣어 사용하고 싶다면 함수 안에 변수를 하나 새로 선언하고 그 변수에 파라미터로 전달된 값을 넣은 후 사용해야 한다.
따라서 다음과 같은 코드를 사용할 수 있다.
```swift
예제)
func show1(message:String) {
    var title = message
    title = "타이틀 : " + title
    print("title -> (title)")
}
```
함수로 전달한 파라미터의 값을 함수 안에서 변경했을 때 변경된 값을 함수 밖에서 다시 참조하는 방법은 없을까?
Swift는 inout 키워드를 사용해서 함수에 변수를 전달하고 다시 그 변수를 참조할 수 있도록 한다.
inout 파라미터를 사용하는 함수를 만들기 위해 다음 코드를 추가해보자.
```swift
func show2(message : inout String) {
    print("전달 받은 메세지 -> \(message)")
    message = "OK."
}

var greeting = "안녕하세요!"
show2(message:&greeting)

print(greeting)

출력값) 전달 받은 메세지 -> 안녕하세요!
출력값) OK.
```
show2 함수의 message 파라미터의 자료형 앞에 inout 키워드가 붙어 있다. 그리고 show2 함수를 호출할 때는 미리 만들어둔 변수를 전달한다.
그런데 함수를 호출할 때 전달하는 파라미터 앞에 & 기호를 붙이면 이 변수의 포인터, 즉 메모리에서의 위치를 전달한다.
이렇게 하면 함수 내부에서 파라미터를 참조할 때 그 변수를 가리키게 된다.
inout 파라미터의 사용법을 정리하면 다음과 같다.

> * 함수를 정의했을 때 파라미터의 자료형 앞에 inout을 붙인다.
>
> * 함수를 호출했을 때 전달하는 변수 앞에 &를 붙인다.

이렇게 하면 함수 내부에서는 파라미터로 전달된 변수를 가리키게 되므로 그 변수의 값을 다른 것으로 바꿔도 함수 밖에서 참조할 수 있다.

**inout 파라미터는 함수를 호출하기 전에 미리 변수를 만들어 두었다가 함수 실행이 끝난 후 변경된 값을 참조하기 위해 사용된다는 것을 기억하자.**


Quiz 09

더하기 함수를 하나 만들고 세 개의 파라미터가 전달되도록 해 보세요. 함수의 이름은 add로 하고 첫 번째와 두 번째 파라미터로 전달된 값을 더한 후 세 번째 파라미터로 결과 값을 다시 전달 받도록 정의 합니다. 함수에서 반환되는 값이 없도록 return 키워드는 사용하지 않습니다.
```swift
func add(_ a:Int, _ b:Int, _ result: inout Int) {
    result = a * b
}

var result = 0
add(10, 10, &result)
print("더하기 결과 : \(result)")

출력값) 더하기 결과 : 100
```


[Ch2_function7.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch2_function7.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
