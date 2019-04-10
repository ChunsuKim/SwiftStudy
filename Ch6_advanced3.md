#### 함수 실행 결과를 함수로 반환 받기

일급 객체로서의 함수가 갖는 세 번 특징은 함수를 실행한 결과를 함수 객체로 만들어 반환할 수 있다는 것이다.
```swift
func add(first a:Int, second b:Int) -> Int {
    return a + b
}

func subtract(first a:Int, second b:Int) -> Int {
    return a - b
}

func selectCalc(index:Int) -> ((Int, Int) -> Int)? {
    if index == 1 {
        print("add 계산기를 선택했습니다.")
        return add
    } else if index == 2 {
        print("subtract 계산기를 선택했습니다.")
        return subtract
    } else {
        print("알 수 없는 계산기입니다.")
        return nil
    }
}
```
이 코드는 함수를 호출하면서 숫자를 전달하면 그 숫자의 값에 따라 서로 다른 계산 기능을 반환하도록 만든 것이다. 먼저 더하기 함수는 add로, 빼기 함수는 subtract라는 이름으로 정의했다.
그리고 selectCalc 함수는 이 두 가지 함수 중에서 하나를 선택하는 함수이다.
selectCalc 함수를 호출하면서 1을 파라미터로 전달하면 더하기 함수가 반환되고 2를 전달하면 빼기 함수가 반환된다.

여기에서 selectCalc 함수를 정의한 부분을 보면 -> 기호 다음에 함수의 자료형이 사용되었다.
즉 selectCalc 함수에서 반환하는 함수는 (Int, Int) -> Int로 되어 있어 두 개의 정수 값을 받고 하나의 정수 값을 반환하는 것으로 정의되었다.
그리고 그 뒤에 물음표(?)를 붙여 반환하는 함수가 nil이 될 수도 있다는 것을 알려주고 있다.

selectCalc 함수 안에서는 if ~ else if ~ else 구문을 사용해서 파라미터로 전달된 정수 값을 비교한다.

이렇게 만든 selectCalc 함수를 호출하기 위해 다음 코드를 추가로 입력한다.
```swift
var addCalc = selectCalc(index: 1)!
var result = addCalc(20, 20)
print("add 함수 실행 결과 : \(result)")

var result2 = selectCalc(index: 2)!(100, 10)
print("subtract 함수 실행 결과 : \(result2)")

출력값) add 계산기를 선택했습니다.
      add 함수 실행 결과 : 40
      subtract 계산기를 선택했습니다.
      subtract 함수 실행 결과 : 90
```
selectCalc 함수를 호출했을 때 반환되는 함수는 옵셔널이다. 따라서 함수를 호출했을 때 반환되는 함수를 addCalc 변수에 할당할 때 느낌표(!)를 붙여 옵셔널을 해제한다.
그러면 addCalc 변수가 더하기 함수를 가리키므로 뒤에 소괄호를 붙여 호출할 수 있다.

두 번째로 selectCalc 함수를 호출할 때는 파라미터로 2를 전달하여 빼기 함수를 반환 받는다. 그런데 이번에는 반환 받는 함수를 옵셔널에서 해제하면서 바로 소괄호를 붙여 실행한다.
이렇게 하면 함수 이름 뒤에 소괄호, 느낌표, 소괄호가 순서대로 나오게 된다. 아주 복잡해 보인다.
가끔 소괄호를 하나가 아니라 여러 개 붙이는 경우를 볼 수 있는데 이것은 첫 번째 호출한 함수에서 함수를 반활할 때 그 반환된 함수를 바로 호출하기 때문이다.

코드를 실행하면 위의 출력값 같은 결과를 볼 수 있다.

Quiz 28

1부터 10까지의 숫자를 더하는 함수를 하나 만든 후 그 결과를 콜백 함수로 전달하도록 만들어 보세요. sum이라는 이름으로 함수를 만들고 세 개의 파라미터를 전달하도록 합니다.
첫 번째는 시작 숫자, 두 번째는 끝 숫자로 하고 세 번째는 콜백 함수로 만들어 결과를 받아 출력하도록 합니다.
```swift
func sum(start:Int, end:Int, callback:((Int) -> Void)) {
    var total = 0
    for i in start...end {
        total += i
    }
    
    callback(total)
}

var start = 1
var end = 10

func callback(result:Int) -> Void {
    print("결과 : \(result)")
}

sum(start: start, end: end, callback: callback)

출력값) 결과 : 55
```


[Ch6_advanced4.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch6_advanced4.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
