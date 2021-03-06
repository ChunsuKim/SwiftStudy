# 필요한 기능을 함수로 만들어 사용
#### 반복되는 코드를 함수로 만들기

add라는 이름의 더하기 함수를 만드는 코드
```swift
func add(a:Int, b:Int) -> Int {
    return a + b
}
```
함수를 정의하는 부분이 앞부분 보다 복잡해짐. func 키워드 뒤에 함수 이름이 붙고 소괄호, 중괄호가 붙은 것은 동일함.

더하기 함수의 이름은 add이며, add 함수의 가장 기본적인 형태는 다음과 같다.
```swift
func add() { ... }
```
위 함수의 형태는 위쪽에 값을 넣는 구멍과 아래쪽에 결과 값이 나오는 구멍이 있다고 생각할수 있다.
전달된 값을 받아 처리하기 위해 a라는 상수를 *a:Int*라고 정의한다.
두 번째 구멍으로 전달된 값을 받기 위해 *b*라는 상수도 정의한다.
**소괄호 안에 상수 a와 b를 넣어 나열할 때는 콤마(,)를 사용해서 구별한다.**
소괄호 안에 콤마로 구분하면서 이름 붙여준 상수들을 *파라미터(Parameter)* 라고 한다.
파라미터는 함수 상자로 전달된 값을 받기 위해 만든 것이며, 콤마로 구분된 여러 개의 상수를 받을 수 있다.
파라미터의 이름은 마음대로 지정할수 있다. 단, 다른 파라미터의 이름과는 구별되어야 한다.

함수 상자 아래쪽에 있는 구멍으로 나오는 값은 상수를 정의할 필요는 없다. 하지만 그 값의 자료형은 명시해야 한다.
구체적으로 설명해서 함수를 호출했을 때 함수를 실행한 결과 값이 반환되는데 이 결과 값을 받을 변수나 상수는 함수를 호출한 쪽에서 만들어 사용한다.
함수 아래쪽에 있는 구멍의 크기만 정의한다고 생각하면 쉽다.
함수에서 **반환하는 결과 값의 자료형은 소괄호 뒤에 -> 기호를 붙인 후 넣어준다.**

함수를 실행하면 중괄호 안에 있는 코드들이 동작한다.
더하기 함수는 상자로 전달된 두 개의 값을 + 연산자로 더하기만 하면 되니 a + b 형태의 코드가 들어간다.
그리고 앞에 *return*을 붙였기 때문에 *return a + b* 형태의 코드가 되었는데, 여기에서 사용된 *return* 키워드는 결과 값을 함수 상자 아래쪽으로 보내게 된다.
따라서 *return* 키워드 뒤에 있는 값은 이 함수를 실행한 쪽으로 전달된다.

![그림](https://user-images.githubusercontent.com/47494240/54419363-95ed0000-474a-11e9-83a9-076ecc756ec6.png)

```swift
1부터 10까지의 합을 출력하는 함수와 1부터 100까지의 합을 출력하는 함수

func sum(start:Int, end:Int) -> Int {
        var count = 0
    for i in start ..< end {
        count = count + i
        
    }
    
    return count
}

var result = sum(start: 1, end: 11)
print("sum(1, 11) -> \(result)")

출력값: sum(1, 11) -> 55

result = sum(start: 1, end: 101)
print("sum(1, 101) -> \(result)")

출력값: sum(1, 101) -> 5050
```
sum 함수안에 들어 있는 코드를 보면 for 문을 사용해서 start로 전달된 값부터 end로 끝나는 값 이전까지 계속 더해준 후 return 키워드를 사용하여 함수 밖으로 결과 값을 던져준다.
이렇게 만든 sum 함수를 호출할 때는 sum이라는 함수 이름 뒤에 소괄호를 붙이고 그 안에 두 개의 숫자를 넣어준다.
소괄호 안에 값을 넣어줄 때는 **파라미터의 이름과 콜론(:)** 을 같이 붙여주어야 한다. 이것으로 파라미터를 이름으로 구별할 수 있도록 해준다.
```swift
1부터 10까지의 곱을 출력하는 함수

func multiply(begin:Int, finish:Int) -> Int {
        var count1 = 1
    for m in begin ... finish {
        count1 *= m
        
    }

    return count1
}

var result1 = multiply(begin: 1, finish: 10)
print("multiply(1, 10) -> \(result1)")

출력값: multiply(1, 10) -> 3628800
```


#### 파라미터 전달의 원칙

앞에서 만들었던 add 함수를 보면 두 개의 파라미터를 전달하도록 되어 있다. 그리고 파라미터 이름과 콜론 기호 그리고 자료형을 명시해 준다.
```swift
func 함수이름 (파라미터1, 파라미터2, 파라미터n) -> 반환자료형 { ... }
```
소괄호 안에는 여러 개의 파라미터를 넣을 수 있는데 각각의 파라미터를 넣을 때 사용하는 형식은 다음과 같다.
```swift
파라미터이름:자료형
```
파라미터 이름은 내부 파라미터(Local Parameter) 이름과 외부 파라미터(External Parameter) 이름으로 구별된다.
내부 파라미터는 함수 내부에서 사용하는 이름이고 외부 파라미터는 함수를 호출할 때 사용하는 이름이다.

 * 파라미터의 이름을 하나만 쓰면 내부 파라미터의 이름이면서 동시에 외부 파라미터의 이름
 * 파라미터 이름을 두 개 사용하면 첫 번째는 외부 파라미터 이름, 두 번째는 내부 파라미터 이름
```swift
외부파라미터이름 내부파라미터이름:자료형
```
외부 파라미터 이름과 내부 파라미터 이름은 공백으로 구분함.
```swift
func add1(a:Int) {
    print("add1 호출됨 : \(a)")
}

add1(a:10)

출력값) add1 호출됨 : 10
```
add1 함수는 파라미터를 한개만 갖고 있음. 파라미터 이름이 a라는 이름 하나이므로 이 이름이 내부 파라미터 이름이면서 동시에 외부 파라미터 이름이 됨.
```swift
func add2(a:Int, b:Int) {
    print("add2 호출됨 : \(a), \(b)")
}

add2(a: 10, b: 20)

출력값) add2 호출됨 : 10, 20
```
함수를 정의할 때 두 개의 파라미터가 정의됨. 함수를 호출할 때도 두 개의 파라미터 이름과 함께 값을 넣어주어야 함.

파라미터 이름을 명시하지 않는다면 함수를 호출할 때 파라미터의 순서만 갖고 구별하게 됨. 따라서 중간에 있는 파라미터를 생략 할 수 없음.

파라미터 이름을 명시하면 중간에 파라미터를 생략하거나 파라미터의 순서를 바꿔도 문제가 생기지 않음.
```swift
func add3(first a:Int, second b:Int) {
    print("add3 호출됨 : \(a), \(b)")
}
add3(first: 10, second: 20)

출력값) add3 호출됨 : 10, 20
```
add3 함수의 파라미터는 내부, 외부 파라미터가 명시됨.
첫 번쨰 파라미터는 함수 내부에서 a라는 이름으로 값을 참조하고 함수 밖에서 그 함수를 호출할 때는 first라는 이름으로 구별됨.
함수를 호출할 때 first라는 이름을 넣어야 함.

 * 함수를 정의할 때 파라미터에 내부 파라미터 이름과 외부 파라미터 이름을 명시했다면
 * 함수를 호출할 때 외부 파라미터 이름을 명시해야 한다.
 * 함수 내부에서는 내부 파라미터 이름을 사용해야 한다.

함수를 호출할 때 외부에서 호출할 이름을 명시하고 싶지 않다면, 함수를 정의할 때 외부 파라미터 이름에 _ 기호를 붙이면 된다.
```swift
func add4(_ a:Int, _ b:Int) {
    print("add4 호출됨 : \(a), \(b)")
}

add4(10, 20)

출력값) add4 호출됨 : 10, 20
```
함수를 정의할 때 외부 파라미터에 _ 기호를 사용했기 때문에 add4 함수를 호출할 때 첫 번쨰와 두 번째 파라미터 둘다 값만 전달했음.

 * 외부 파라미터 이름에 _ 기호를 사용하면,
 * 함수를 호출할 때 파라미터 이름을 생략한다.

 <kbd>_</kbd>  _ 기호를 사용하면 파라미터의 순서만으로 파라미터를 구별한다.


quiz 08

곱하기 함수를 하나 만들고 이 함수를 호출할 때 파라미터 이름을 명시하지 않도록 만들어 보세요. 함수의 이름은 multiply로 하고 두 개의 파라미터를 전달 받도록 정의합니다. 각 파라미터의 외부 파라미터 이름으로 _ 기호를 사용합니다.
```swift
func multiply( _ a:Int, _ b:Int) -> Int {
    return a * b
}

let result = multiply(10, 10)
print("곱하기 결과 : \(result)")

출력값) 곱하기 결과 : 100
```


[Ch2_function3.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch2_function3.md)



[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
