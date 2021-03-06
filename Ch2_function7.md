### 5_옵셔널(Optional)과 투플(Tuple) 사용하기


**함수 상자에서 아래쪽 구멍으로 내보내는 값, 즉 반환 값은 항상 한 개여야 한다.**
그리고 함수를 정의할 때는 -> 기호 뒤에 반환 값의 자료형만 명시한다.
함수 내에서 값을 반환하고 싶다면 return 키워드를 사용한다.


옵셔널은 변수에 값이 없는 경우가 있기 때문에 만들어졌다.
예를 들어, 문자열을 정수로 변환할 경우 문자열이 숫자로 변경되지 못하면 nil 값이 반환된다.
**Optional(옵셔널)은 값이 없는 것이 아니라 다른 값을 감싸도록 만들어져서 값이 없는 상황에서도 오류를 발생시키지 않음**

![그림](https://user-images.githubusercontent.com/47494240/54431835-c80e5a00-476a-11e9-8f62-009a11eea5c6.png)

변수를 정의할 때 옵셔널로 만들고 싶다면 물음표(?) 기호를 자료형 뒤에 붙여준다.
```swift
var 변수이름 : 자료형?
```
옵셔널은 일종의 옷을 입혀 놓은 것처럼 값을 감싸고 있는 것일 뿐 값 자체는 아니다. 이것을 래핑(Wrapping) 이라고 한다.
따라서 값을 감싸고 있는 옷을 벗겨야 원래의 값을 사용할 수 있다.

옵셔널 자료형에서 값을 감싸고 있는 옷을 벗겨내는 과정을 언래핑(Unwrapping) 이라고 하고 느낌표(!) 기호를 사용한다.
```swift
변수이름!
```
옵셔널로 감쌌다가 다시 벗겨내는 과정이 번거로울 수 있다.
이 때문에 처음부터 옵셔널로 값을 감싼 것처럼 만들되 그 안에 들어 있는 값을 즉시 참조하여 사용할 수 있는 방법을 제공한다.
자료형 뒤에 느낌표(!)를 붙이면 '암시적 언래핑(Implicit Unwrapping)"이 된다.
다시 말하면 옵셔널처럼 변수에 nil을 할당할 수 있지만 옷을 벗겨낼 필요 없이 그대로 값을 참조할 수 있다.

**암시적 언래핑(Implicit Unwrapping) : 처음부터 옵셔널로 값을 감싼 것처럼 만들되 그안에 들어있는 값을 즉시 참조할수 있는 방법**
```swift
var 변수이름 : 자료형!
```
함수의 파라미터로 전달할 때도 마찬가지이다. 자료형 뒤에 ? 기호를 붙이면 옵셔널이 되고 ! 기호를 붙이면 암시적 언래핑 상태가 된다.
따라서 아래 두가지 형태를 사용할 수 있다.
```swift
옵셔널       외부파라미터이름 내부파라미터이름 : 자료형?
암시적 언래핑  외부파라미터이름 내부파라미터이름 : 자료형!
```
```swift
func show(value1 : String) {
    var value2 : Int?
    value2 = Int(value1)
    print("전달 받은 숫자 -> \(value2!)")
}

show(value1: "10")          // 전달 받은 숫자 -> 10
//show(value1: "안녕!")       // error 출력

출력값) 전달 받은 숫자 -> 10
```
show 함수에는 value1 파라미터가 정의되어 있고, 이 파라미터를 사용해서 문자열을 전달할 수 있다.
이 함수 안에서는 value2 변수를 새로 만들었는데 자료형이 Int이고 그 뒤에 ? 기호를 붙여 Int 옵셔널로 만들었다.
value2 변수에는 value1 파라미터에 들어 있는 값을 정수로 형 변환하여 할당한다.
그리고 value2 변수가 옵셔널이므로 print를 사용해서 value2 변수의 값을 확인할 때는 변수 뒤에 ! 기호를 붙여 옵셔널을 해제했다.

옵셔널을 해제한다는 것은 원래의 Int 자료형으로 변경한다는 의미이다.
그런데 만약 옵셔널 안에 nil 값이 들어 있는 경우에는 옵셔널을 해제할 때 오류가 발생한다.
show 함수를 호출할 때 "10"을 파라미터로 전달하는 경우와 "안녕!"을 파라미터로 전달하는 경우를 각각 확인하기 위해 위의 코드를 다시 살펴본다.
코드를 실행하면 "10"을 전달할 때는 문제가 없고 "안녕!"을 전달할 때는 실행 단계에서 오류가 발생하는 것을 알 수 있다.

변수와 자료형을 살펴볼 때 알아본 내용이지만 숫자 값이 문자열로 되어 있을 때 숫자로 변환하는 과정을 다시 한 번 정리하면 다음과 같다.

![그림](https://user-images.githubusercontent.com/47494240/54431836-c8a6f080-476a-11e9-8da6-fabdb519146a.png)

이 옵셔널 자료형은 별도로 존재하는 것이 아니라 기본 자료형을 감쌀 수 있도록 만들어진 것이다.
따라서 문자열 옵셔널, 불(Bool) 옵셔널 등 기본 자료형에 nil 값이 들어갈 수 있는 경우에는 필요에 따라 만들어 사용할 수 있다.
또한 나중에 살펴볼 객체 자료형도 감쌀 수 있다.

자료형을 사용해 옵셔널을 만드는 대표적인 경우
```swift
var 변수이름 : Int?
var 변수이름 : Float?
var 변수이름 : Double?
var 변수이름 : Bool?
var 변수이름 : String?
```
옵셔널 안에 들어 있는 값이 nil일 때 무조건 옵셔널을 해제하면 실행 시에 오류가 발생하므로 nil인지 여부를 확인한 후 해제하는 것이 필요하다.
옵셔널에 들어 있는 값이 nil인지 아닌지 확인할 때는 if 문을 사용할 수 있다.
```swift
func show2(value1 : String) {
    var value2 : Int?
    value2 = Int(value1)
    
    if value2 == nil {
        print("전달 받은 값은 숫자가 아닙니다.")
    } else {
        print("전달 받은 숫자 -> \(value2!)")
    }
}

show2(value1: "10")             // 전달 받은 숫자 -> 10
show2(value1: "안녕!")            // 전달 받은 값은 숫자가 아닙니다.

출력값) 전달 받은 숫자 -> 10
출력값) 전달 받은 값은 숫자가 아닙니다.
```
if 문은 그 뒤에 조건이 오고 조건 값이 true이면 중괄호 안의 코드가 실행된다.
만약 조건이 true가 아니라면 else 뒤에 있는 중괄호 안의 코드가 실행된다.

![그림](https://user-images.githubusercontent.com/47494240/54431837-c8a6f080-476a-11e9-9b28-22ffa36ad3f4.png)

value2가 Int 자료형의 옵셔널이므로 value2의 값이 nil인지 확인하는 코드를 if 다음에 입력한다.
값이 같은지를 확인할 때는 == 기호를 사용한다.
만약 nil 값이면 "전달 받은 값은 숫자가 아닙니다."라는 메시지를 출력하고 nil 이 아니면 ! 기호를 사용해 옵셔널을 해제한 후 출력한다.
이렇게 하면 show 함수로 전달되는 문자열에 숫자 값이 없어도 오류가 발생하지 않는다.


#### 함수에서 옵셔널로 반환하기


함수에서 값을 반환할 때도 옵셔널 자료형으로 반환할 수 있다. 반환되는 값을 옵셔널로 만들려면 반환 자료형 뒤에 ? 기호를 붙여준다.
```swift
func 함수이름(파라미터이름 : 자료형) -> 반환자료형? { ... }
```
```swift
func show3(value1: String) -> Int? {
    var value2 : Int?
    value2 = Int(value1)
    
    if value2 == nil {
        print("전달 받은 값은 숫자가 아닙니다.")
    } else {
        print("전달 받은 숫자 -> \(value2!)")
    }
    
    return value2
}

var result = show3(value1: "10")
print("show3 함수 호출 결과 -> \(result)")

result = show3(value1: "안녕!")
print("show3 함수 호출 결과 -> \(result)")

출력값) 전달 받은 숫자 -> 10
출력값) show3 함수 호출 결과 -> Optional(10)
출력값) 전달 받은 값은 숫자가 아닙니다.
출력값) show3 함수 호출 결과 -> nil
```
show3 함수에서 반환되는 값의 자료형은 Int? 이다. 즉, 정수 옵셔널로 값을 반환한다는 의미이다.
따라서 이 함수를 호출하여 반환되는 값을 변수로 할당하면 그 변수의 자료형은 '정수 옵셔널'이 된다.
show3 함수는 문자열에서 숫자로 변환한 후 그대로 반환했기 때문에 반환된 값은 정상적인 숫자일 수도 있고 nil일 수도 있다.


Quiz 10

나누기 함수를 하나 만들고 반환되는 값의 자료형은 정수 옵셔널이 되도록 만드세요. 함수의 이름은 divide로 하고 두 번째 파라미터로 전달된 값이 0일 때는 nil이 반환되게 하고, 0이 아닐때는 나누기한 결과를 반환하도록 만듭니다.
```swift
func divide(_ a:Int, _ b:Int) -> Int? {
    if b == 0 {
        return nil
    }
    
    return a / b
}

let result1 = divide(20, 10)
let result2 = divide(20, 0)
print("나누기 결과 : \(result1), \(result2)")

출력값) 나누기 결과 : Optional(2), nil
```


[Ch2_function8.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch2_function8.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
