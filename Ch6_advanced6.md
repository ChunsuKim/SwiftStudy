#### 클로저를 변수에 할당하거나 함수에서 반환하기

이번에는 변수에 할당된 클로저의 모양을 살펴보도록 하겠다.
```swift
let show = { () -> () in
    print("show 함수 호출됨.")
}

show()

출력값) show 함수 호출됨.
```
show라는 상수에 할당된 것은 클로저 표현식으로 만들어진 함수이며 클로저 표현식에는 함수 이름이 없으므로 사실상 show 라는 상수 이름이 함수 이름으로 동작한다.
이렇게 클로저 표현식을 사용해 만든 함수는 show 라는 상수 이름 뒤에 소괄호를 붙여 실행한다는 것을 이미 잘 알고 있다.

이 코드에서 반환 자료형으로 쓰인 소괄호는 Void로 바꿀 수 있다. 대소문자를 잘 구분하면서 다음 코드를 입력한다.
```swift
let show2 = { () -> Void in
    print("show2 함수 호출됨.")
}

show2()

출력값) show2 함수 호출됨.
```
같은 함수를 만든 것이지만 in 앞에 있는 반환 자료형이 Void로 바뀐 것에 주목해야 한다. 왜냐하면 실제 코드에서는 이렇게 Void를 사용하는 경우가 많기 때문이다.
아무래도 () 기호보다는 Void 키워드를 사용했을 때 더 쉽게 코드를 읽고 해석할 수 있다. 이번에는 같은 코드를 상수에 할당하지 않고 바로 실행하도록 한다,
```swift
({ () -> Void in
    print("즉시 실행 함수 호출됨.")
})()

출력값) 즉시 실행 함수 호출됨.
```
클로저를 위한 중괄호를 소괄호로 감싼 후 그 뒤에 소괄호를 붙였다. 이렇게 하면 클로저가 만들어지면서 바로 실행된다. 클로저를 만들자마자 실행하면 이 함수는 한 번 실행된 후 사라진다.
이런 함수를 '즉시 실행 함수'라고 부른다. 만약 즉시 실행 함수에서 반환하는 값이 있다면 그 값을 상수나 변수에 할당할 수도 있다.
Void를 반환하는 함수이긴 하지만 show3라는 상수를 만들어 그 상수에 할당하도록 다음과 같이 입력한다.
```swift
let show3 : Void = ({ () -> Void in
    print("즉시 실행 함수 호출됨.")
})()

print("show3의 값 : \(show3)")

출력값) 즉시 실행 함수 호출됨.
      show3의 값 : ()
```
지금까지 입력한 코드들을 실행해보면 모두 문제없이 실행될 것이다. 이번에는 함수 안에서 새로운 함수를 만들 때 클로저 표현식으로 만든 후 반환해 보겠다. 다음 코드를 입력한다.
```swift
func getCalc(index:Int) -> ((Int, Int) -> Int)? {
    if index == 1 {
        return { (a:Int, b:Int) -> Int in
            return a + b
        }
    } else {
        return nil
    }
}

let add = getCalc(index: 1)!
var result = add(20, 20)
print("반환 받은 더하기 함수 실행 결과 : \(result)")

출력값) 반환 받은 더하기 함수 실행 결과 : 40
```
getCalc 함수는 숫자 값을 하나 전달 받은 후 그 값이 1이면 더하기 함수를 반환한다. 이때 return 키워드 뒤에서 만들어지는 함수는 클로저 표현식으로 만들어진 더하기 함수이다.
앞에서 여러 가지 형태로 클로저 표현식을 만드는 방법을 알아보았으니 이 코드를 다른 형태로 바꿀 수 있다는 것을 잘 알고 있을 것이다.
getCalc 에서 반환하는 함수가 nil 일 수 있으므로 반환 자료형은 옵셔널로 선언한다.
이렇게 만든 getCalc 함수를 호출하여 더하기 함수를 반환 받은 후 더하기 함수를 실행하면 위에 출력값과 같은 결과가 출력된다.

그 외에도 클로저는 클래스의 속성으로 사용될 수도 있다.
```swift
class MyClass {
    var property : (() -> Int)!
}
```
지금까지 입력해 본 코드의 형태처럼 클로저를 사용하는 형태가 다양하다는 것을 기억하기 바란다.

Quiz 29

함수를 파라미터로 전달 받아 필요한 계산을 한 후 새로운 함수를 만들어 반환하는 함수를 만들어 보세요.
계산 기능을 담당하는 doCalc라는 이름의 함수를 만들고 이 함수를 호출할 때 곱하기 연산을 하는 함수를 파라미터로 전달하게 합니다.
doCalc 함수 안에서 곱하기한 결과를 화면에 출력하는 기능의 함수를 내부 함수로 만든 후 결과 값으로 반환합니다.
```swift
func doCalc(a:Int, b:Int, calc:(Int,Int) -> Int) -> (() -> Void) {
    let result = calc(a, b)
    
    func showResult() {
        print("결과 : \(result)")
    }
    
    return showResult
}

let show4 = doCalc(a: 10, b: 10, calc:{(a:Int, b:Int) -> Int in
    return a * b
})

show4()

출력값) 결과 : 100
```


[Ch7_inheritance1.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch7_inheritance1.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
