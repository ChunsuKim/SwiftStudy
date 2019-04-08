### 6_조건문과 반복문 정리하기

우리가 일상생활에서 대화를 할 때는 '나'나 '우리'와 같은 주어 뒤에 '간다', '온다'와 같은 동사를 붙여서 말하기 때문에 좀 더 자연스럽게 대화할 수 있다.
이렇게 일상의 대화처럼 프로그래밍 언어도 여러 가지 키워드들이 모여 하나의 흐름을 만든다. 그중에서 대표적인 것이 바로 if 문이나 for 문이다.
이번 단락에서는 프로그램의 흐름을 자연스럽게 만들어 주는 조건문이나 반복문에 대해 살펴보겠다.

앞에서 if 문과 for 문은 이미 여러 번 사용해 보았다.
**if 문은 '~라면'이라는 조건을 주고 그 조건이 맞으면 중괄호 안의 코드가 실행되도록 만드는 문장인데 이런 문장을 '조건문(Conditional Statement)'이라고 한다.**


#### if 문

조건문 중에서 가장 대표적인 것이 if 문이다. if 문의 가장 간단한 형태는 다음과 같다.

![그림](https://user-images.githubusercontent.com/47494240/54821353-4035cc00-4ce5-11e9-8dda-9f2eb608dd91.png)

이미 사용해 보았던 것처럼 if 키워드 뒤에 == 또는 != 과 같은 조건 연산자가 올 수 있다. 그밖에도 true 또는 false 결과가 나올 수 있는 것은 모두 조건으로 들어갈 수 있다.
두 개의 값을 비교하는 가장 간단한 코드는 다음과 같다.
```swift
var i = 2
var j = 3

if i < j {
    print("if 문의 조건 : true")
}

출력값) if 문의 조건 : true
```
변수 i와 j에 들어 있는 숫자를 if 문에서 비교하고 있다. j의 값이 더 크므로 if 문의 중괄호 안에 있는 코드가 실행된다.
조건으로 들어가는 것 중의 하나로 열거형을 들 수 있는데 if ~ else if ~ else if ~ else 와 같은 형태를 사용해 열거형 값을 순서대로 비교할 수 있다.
```swift
enum Blood {
    case A
    case B
    case O
    case AB
}

var myblood = Blood.B
if myblood == Blood.A {
    print("혈액형은 A형입니다.")
} else if myblood == Blood.B {
    print("혈액형은 B형입니다.")
} else if myblood == Blood.O {
    print("혈액형은 O형입니다.")
} else if myblood == Blood.AB {
    print("혈액형은 AB형입니다.")
} else {
    print("알 수 없는 혈액형입니다.")
}

출력값) 혈액형은 B형입니다.
```
Blood라는 이름의 열거형은 혈액형 정보를 순서대로 가지고 있다. 그리고 나의 혈액형이 B형이라면 Blood.B라는 값을 변수에 할당한 후 if 문에서 비교할 수 있다.
if 문에서는 myblood 라는 변수에 들어 있는 값이 열거형의 값 중에서 어떤 값과 동일한지 비교한다. else는 앞에 나오는 어떤 조건에도 해당하지 않는 경우 그다음에 나오는 중괄호 안의 코드를 실행한다.

비교해야 할 조건이 하나가 아니라 여러 개라면 if로 비교하는 조건 다음에 else if 를 추가할 수 있다. 이 else if 는 원하는 만큼 개수를 추가할 수 있지만 항상 if 와 else 사이에 있어야 한다.

![그림](https://user-images.githubusercontent.com/47494240/54821354-4035cc00-4ce5-11e9-80f1-c46a10298e8f.png)

열거형이 사용된 경우에는 myblood 변수의 자료형이 Blood임을 유추할 수 있으므로 Blood.B와 비교할 때 .B처럼 열거형의 이름을 생략할 수 있다. 다음은 열거형 이름인 Blood를 생략한 코드이다.
```swift
var myblood = Blood.B
if myblood == .A {
    print("혈액형은 A형입니다.")
} else if myblood == .B {
    print("혈액형은 B형입니다.")
} else if myblood == .O {
    print("혈액형은 O형입니다.")
} else if myblood == .AB {
    print("혈액형은 AB형입니다.")
} else {
    print("알 수 없는 혈액형입니다.")
}
```
변수나 상수의 갑과 열거형의 값을 비교할 때 열거형의 이름이 생략되면 좀 더 단순하게 보이는 효과가 있다.


#### if 문에서 바인딩 사용하기

if 문에는 어떤 함수를 실행한 결과 값을 상수로 받아 사용할 수도 있다. 이렇게 if 문에서 상수에 값이 할당되는 방식을 '바인딩(Binding)'이라고 한다.
이 상수는 if 문의 조건 부분에 들어가는데 상수에 값이 할당되면 중괄호 안의 코드가 실행된다. 다음 코드를 추가한다.
```swift
func checkBlood(type:String) -> String? {
    if type == "A" || type == "O" {
        return "OK"
    }
    return nil
}

if let result = checkBlood(type: "O") {
    print("혈액 검사 결과 : \(result)")
} else {
    print("혈액 검사 결과는 nil입니다.")
}

출력값) 혈액 검사 결과 : OK
```
checkBlood 함수는 혈액형 정보를 파라미터로 받은 후 그 결과를 알려주는 기능을 간단하게 만든 것이다. 만약 A형이거나 O형이면 'OK'라는 글자를 반환하도록 하고 그렇지 않은 경우에는 nil을 반환하도록 한다.
함수에서 반환하는 값이 nil일 수 있으므로 함수에서 반환하는 값의 자료형은 옵셔널로 만들었다. 함수 안에 들어 있는 조건을 보면 두 가지를 비교하고 있다. 이것을 '다중 비교(Multiple Comparison)'라고 한다.

함수의 아래에는 이 함수를 호출하여 사용하는 if 문이 사용되었는데 if 키워드 뒤에서 함수를 호출하고 있다.
이렇게 함수를 호출한 결과는 result라는 상수에 할당되었고 이 상수에 nil이 아닌 값이 들어 갔을 때 중괄호 안의 코드가 실행된다.
else 문이 같이 있으므로 혈액형이 A형이나 O형인 경우에는 if 문 안에 있는 코드가 실행되고 그렇지 않은 경우에는 else 문 안에 있는 코드가 실행된다.

if 키워드 뒤에서 바인딩 방식을 사용하는 경우 두 개의 상수를 사용할 수도 있다. 이때는 함수가 두 번 실행된 결과가 모두 nil이 아닌 경우에 if 뒤에 있는 중괄호 안의 코드가 실행된다.
```swift
var sources = ["A", "B"]
if let result1 = checkBlood(type: sources[0]), let result2 = checkBlood(type: sources[1]) {
    print("혈액 검사 결과 : \(result1), \(result2)")
} else {
    print("혈액 검사 결과는 nil 입니다.")
}

호출값) 혈액 검사 결과는 nil 입니다.
```
sources 변수는 배열이며 비교할 혈액형 정보를 담고 있다. 이 배열 안에 들어 있는 두 개의 혈액형 정보를 if 문 안에서 한꺼번에 확인하고 싶은 경우에는 checkBlood를 두 번 호출하는데 이때 콤마(,)로 구분한다.
result1과 result2 상수에 할당된 함수 호출 결과가 모두 nil이 아닐 때 if 키워드 뒤의 중괄호 부분이 실행된다. 코드를 실행하면 출력값 같이 else 뒤의 중괄호 안에 있는 코드가 실행된 것을 볼 수 있다.

if 문에서 함수를 실행한 결과를 확인한 후 nil이 아닐 경우 코드가 실행되도록 하면 if 문 이전에 실행해야 할 함수가 if 문 안에 들어갈 수 있어 코드의 양을 줄일 수 있다.



[Ch5_for1.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch5_for1.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
