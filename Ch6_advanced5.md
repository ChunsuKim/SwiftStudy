#### 스위프트 클로저

클로저가 무엇인지 잘 이해했다면 이제 스위프트에서 클로저를 어떻게 다루는지 알아본다. 스위프트는 앞 단락에서 설명한 일반적인 개념의 클로저보다 좀 더 넓은 의미로 클로저를 사용한다.
다음은 대표적인 두 가지 클로저이다.
```swift
* 중첩 함수에서의 클로저
 -> 내부 함수이면서 외부 함수의 값을 캡처할 수 있는 클로저

* 클로저 표현식
 -> 함수의 이름이 없고 주변 환경으로부터 값을 캡처할 수 있는 클로저
```
여기에서 캡처(Capture)란 외부 함수 안에 있는 변수를 저장하여 사용하는 것을 말한다.
원래는 다른 함수 안에 있어 그 함수에서만 접근할 수 있지만 클로저에서 사용하기 위해 다른 함수의 컨텍스트가 사라져도 계속 저장하여 사용할 수 있게 된 것을 의미한다.
앞 단락의 내용에서 설명한 내용과 같기 때문에 잘 이해가 되지 않는다면 앞 단락의 내용을 다시 확인해보길 바란다.

두 번째 클로저는 이름이 없는 '익명 함수(Anonymous Function)'이면서 하나의 코드 블록이 객체처럼 다루어지는 것을 의미한다.
클로저 표현식은 일회용 함수와 비슷하며 다음과 같은 형식을 가진다.
```swift
{(파라미터)} -> 반환자료형 in
  코드
}
```
이런 형식을 처음 보면 굉장히 생소할 수 있다. 그러나 잘 살펴보면 함수의 이름이 생략되면서 만들어진 형태라는 것을 알 수 있다. 더하기 함수를 예로 들면 더하기 함수의 원래 형태는 다음과 같다.
```swift
<코드 1>
func add(a:Int, b:Int) -> Int {
  return a + b
}
```
여기에서 add라는 함수의 이름을 빼면 다음과 같은 형태가 된다.
```swift
<코드 2>
func (a:Int, b:Int) -> Int {
  return a + b
}
```
그런데 함수의 이름이 없어졌으니 함수 전체를 중괄호로 감싸서 이 부분이 함수라는 것을 알려주는 것이 더 좋을 수 있다. func 키워드를 없애고 중괄호로 감싸면 다음과 같은 형태가 된다.
```swift
<코드 3>
{(a:Int, b:Int) -> Int {
  return a + b
}}
```
원래 있던 중괄호가 함수의 기능을 구현하는 코드 부분인데 이 부분이 새로 만든 중괄호 안에 있어 중괄호가 중첩된다. 이렇게 되면 가독성이 떨어지므로 원래 있던 중괄호를 없애고 in 키워드로 변경한다.
```swift
<코드 4>
{(a:Int, b:Int) -> Int in
    return a + b
}
```
이렇게 변형되는 과정을 보니 가장 처음에 보았던 add 함수의 원래 모양이 이렇게도 바뀔 수 있다는 것이 이해되는가?
결국 함수의 이름을 없앤 클로저 표현식이라는 것은 중괄호로 코드 블록을 만들어 하나의 객체로 다루는 것을 말한다. 그리고 이 클로저는 다른 함수의 파라미터로 전달할 수 있다.
그리고 in 키워드를 사용하면서 앞에는 파라미터와 반환 자료형을 명시하고 뒤에는 구현 코드를 넣어준다.
그러면 더하기 함수를 파라미터로 전달 받아 더하기 연산을 한 후 그 결과를 반환하는 함수를 만들어 보겠다.
```swift
func doCalc(first a:Int, second b:Int, _ calc: (Int, Int) -> Int) -> Int {
    let output = calc(a, b)
    return output
}
```
doCalc 함수는 두 개의 정수 값을 파라미터로 받을 뿐만 아니라 세 번째 파라미터로 더하기 함수를 함께 전달 받도록 한다.
더하기 함수뿐만 아니라 빼기나 곱하기, 나누기를 구현한 함수도 이런방식으로 만들어서 함께 파라미터로 받으면 doCalc 함수를 수정하지 않고도 다른 연산을 할 수 있다는 장점이 생긴다.
더하기 함수의 자료형은 (Int, Int) -> Int가 되었으며 세 번째 파라미터는 _ calc라는 이름을 붙여주었으므로 외부 파라미터 이름이 없고 내부 파라미터 이름이 calc인 더하기 함수를 의미한다.

doCalc 함수의 내부에서는 전달 받은 calc 함수를 실행한 후 그 결과를 반환한다. 이제 add 함수를 하나 만들고 doCalc 함수를 호출하면서 add 함수를 파라미터로 전달한다.
```swift
func add(a:Int, b:Int) -> Int {
    return a + b
}

var result = doCalc(first: 10, second: 10, add)
print("add 함수를 파라미터로 전달하여 실행한 결과 : \(result)")

출력값) add 함수를 파라미터로 전달하여 실행한 결과 : 20
```
doCalc 함수를 호출하면서 first 파라미터의 값은 10, second 파라미터의 값은 10, 그리고 마지막 세 번째 파라미터에는 add 함수의 이름을 넣어준다. 이 코드를 실행하면 20이라는 결과 값을 확인할 수 있다.

이 코드는 앞에서 이미 만들어 본 것과 크게 다르지 않다. 그러면 이제 함수를 호출할 때 전달하는 add 함수를 미리 정의하지 않고 클로저 표현식으로 만들어 전달하도록 수정해 보겠다. 다음 코드를 추가한다.
```swift
var result2 = doCalc(first: 10, second: 10, {(a:Int, b:Int) -> Int in
    return a + b
})
print("클로저 표현식을 파라미터로 전달하여 실행한 결과 : \(result2)")

출력값) 클로저 표현식을 파라미터로 전달하여 실행한 결과 : 20
```
세 번째 파라미터는 더하기 함수를 클로저 표현식으로 만든 것이다. 클로저 표현식은 중괄호로 감싼 형태라고 했으므로 중괄호 블록 안에 파라미터와 반환 자료형 그리고 구현 코드를 넣었다.
이렇게 함수를 호출할 때 사용하는 클로저 표현식의 형태는 잘 기억해야 한다. 입력한 코드 아래에 다음 코드를 추가한다.
```swift
var result3 = doCalc(first: 10, second: 10, {(a, b) -> Int in
    return a + b
})
print("클로저 표현식의 파라미터 자료형을 생략한 경우 : \(result3)")

출력값) 로저 표현식의 파라미터 자료형을 생략한 경우 : 20
```
클로저 표현식에서 파라미터의 자료형이 생략되었다. 어떻게 이런 형태가 가능할까? 이미 doCalc 함수를 정의할 때 어떤 함수가 전달될지 자료형을 명시했기 때문에 파라미터의 자료형은 생략할 수 있다.
이번에는 다음 코드를 추가한다.
```swift
var result4 = doCalc(first: 10, second: 10, {(a, b) -> Int in a + b})
print("클로저 표현식의 구현 코드가 반환용 한 줄 코드인 경우 : \(result4)")

출력값) 로저 표현식의 구현 코드가 반환용 한 줄 코드인 경우 : 20
```
클로저 표현식에서 in 다음에 오는 구현 코드가 return 키워드를 사용하는 한 줄짜리 코드라면 return 키워드를 생략할 수 있다.
이렇게 하니 여러 줄로 만들어지던 클로저 표현식이 한 줄로 크게 줄어든 것을 볼 수 있다. 이번에는 다음 코드를 추가한다
```swift
var result5 = doCalc(first: 10, second: 10, {$0 + $1})
print("클로저 표현식의 파라미터를 선언 없이 직접 참조한 경우 : \(result5)")

출력값) 클로저 표현식의 파라미터를 선언 없이 직접 참조한 경우 : 20
```
클로저 표현식에 사용된 파라미터는 $0, $1, $2와 같은 기호를 사용해 순서대로 참조할 수 있다. 따라서 파라미터 선언 부분이 생략될 수 있다.
이렇게 하면 클로저 표현식의 중괄호 부분은 더 많이 축약된다. 마지막으로 다음 코드를 추가한다.
```swift
var result6 = doCalc(first: 10, second: 10) {$0 + $1}
print("클로저 표현식을 파라미터 외부에 넣은 경우 : \(result6)")

출력값) 클로저 표현식을 파라미터 외부에 넣은 경우 : 20
```
doCalc 함수의 파라미터 중에서 마지막 파라미터가 클로저 표현식인데 이런 경우에는 doCalc 함수를 호출하기 위해 함수 이름 뒤에 사용한 소괄호가 끝난 후 클로저 표현식을 명시할 수 있다.
이것을 '클로저 트레일링(Closure Trailing)'이라고 한다. 말 그대로 클로저가 함수 뒤에 있다는 의미이다.
코드를 이렇게 수정하면 클로저 표현식에 해당하는 코드가 분리되므로 코드의 가독성이 훨씬 좋아진다. 이런 방식으로 클로저 표현식을 사용할 때 클로저의 파라미터가 하나라면 괄호를 없앨 수도 있다.

똑같은 기능을 실행하는 코드를 여러 가지 형태로 만들 수 있다. 이것은 스위프트가 개발자에게 가장 좋은 형태의 코드를 선택하여 사용할 수 있도록 배려한 것이다.
다만 이렇게 다양한 코드 형태가 만들어질 수 있기 때문에 오히려 더 복잡하게 보일 수 있다. 따라서 코드를 만들 때는 이중에서 한 가지 유형을 선택하여 일관성 있게 사용해야 만든 코드를 해석할 때 혼동되지 않는다.
지금까지 입력한 코드를 실행하면 위의 출력값들 처럼 모두 문제없이 실행되면서 동일한 결과를 출력하는 것을 확인할 수 있다.

지금까지 클로저를 아주 다양한 형식으로 바꾸어 사용하는 것을 보았다.
이런 코드 형식은 클로저를 최대한 축약하여 코드를 단순화하려고 만든 것이므로 실제로 사용해 보면 편리함을 느낄 수 있지만 처음 볼 때는 오히려 더 복잡하게 느껴질 수 있다.
따라서 코드의 형태를 유심히 살펴보고 여러 번 입력하면서 익숙해져야한다.



[Ch6_advanced6.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch6_advanced6.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
