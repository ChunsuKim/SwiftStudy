### 5_if 문 이해하기


조건문 중에 가장 대표적인 것이 if 문이다. if 문의 가장 간단한 형태는 다음과 같다.

![그림](https://user-images.githubusercontent.com/47494240/54474721-acb75380-482b-11e9-8daa-ab79f19c7b79.png)

이미 입력해 보았던 코드처럼 조건문 안에 == 연산자를 두고 변수에 들어 있는 값이 지정한 값과 같은지를 비교한 후 같으면 코드가 실행되도록 만드는 것이 가장 흔한 형태이다.

![그림](https://user-images.githubusercontent.com/47494240/54474722-acb75380-482b-11e9-8b6d-3bc2ccc48132.png)

if 문 뒤에 오는 조건이 true이면 그 안에 있는 코드가 실행되고, false이면 if 문 바깥으로 그냥 나와 if 문 다음 코드가 실행된다.
따라서 if 문의 중괄호 안에 들어 있는 코드들은 조건이 true일때만 실행된다.
다시 말해, 밑에 그림처럼 조건이 true일 때는 코드 1을 실행하고 false일 때는 코드 2가 실행된다.

![그림](https://user-images.githubusercontent.com/47494240/54474723-ad4fea00-482b-11e9-9366-a03bc96a2d31.png)

if 다음에 오는 조건이 아닌 경우를 처리할 때는 else를 사용한다. 이렇게 하면 어떤 경우라도 if 키워드 뒤의 중괄호 또는 else 키워드 뒤의 중괄호 안에 있는 코드 중 하나가 실행된다.
예를 들어, if 문의 조건에서 == 연산자를 사용할 경우 변수에 들어 있는 값이 같을 때 실행될 코드를 넣으면서 동시에 같지 않을 때 실행될 코드도 함께 넣으려면 밑에 그림과 같이 만들 수 있다.

![그림](https://user-images.githubusercontent.com/47494240/54474724-ad4fea00-482b-11e9-8e2e-e60219245d72.png)

만약 비교해야 할 조건이 하나가 아니라 여러 개라면 if로 비교하는 조건과 else 사이에 else if 를 추가할 수 있다.
이 else if 는 원하는 만큼 추가할 수 있지만 항상 if와 else 사이에 있어야 한다.

![그림](https://user-images.githubusercontent.com/47494240/54474725-ad4fea00-482b-11e9-89e4-50f73924e5e0.png)

**if 문 다음에 else if가 두 번 사용되었다면 이 if 문에서 사용된 조건은 세 가지이다.**
각 조건에 맞는 코드는 해당 조건 다음에 나오는 중괄호 안에서 실행되며 마지막에 else가 있을 경우에는 앞에 나왔던 모든 조건들이 모두 false일 때 실행된다.

여러 개의 조건을 검사하는 if 문을 만들어 보겠다.
```swift
func compare(value:Int) -> Int {
    if value < 0 {
        return -1
    } else if value == 0 {
        return 0
    } else {
        return 1
    }
}

var result = compare(value: 10)
print("compare(value:10)의 결과 -> \(result)")

출력값) compare(value:10)의 결과 -> 1
```
compare 함수는 정수 값 하나를 파라미터로 전달 받아 0보다 작은지, 0과 같은지 또는 0보다 큰지를 검사한다.
검사 결과는 각각 -1, 0, 1이 되는데 이런 값을 반한하기 위해 if 문이 사용된다.

이번에는 if 문의 조건에서 0보다 작거나 0인 경우를 한꺼번에 비교하도록 바꿔 보겠다. 앞에서 입력했던 compare 함수와 비슷하게 compare2 함수를 추가한다.
```swift
func compare2(value:Int) -> Int {
    if value < 0 || value == 0 {
        return -1
    } else {
        return 1
    }
}

result = compare2(value: 10)
print("compare2(value:10)의 결과 -> \(result)")

출력값) compare2(value:10)의 결과 -> 1
```
 || 연산자가 사용되었으니 두 개의 조건을 한꺼번에 검사하고 둘 중의 하나라도 true이면 true가 되도록 한다는 의미이다.

이제 마지막으로 ! 연산자를 사용하여 if 조건의 값을 '~가 아닌 것'으로 변경해 본다. 밑에 코드와 같이 수정하면 조건을 검사할 때 앞에서 작성한 코드와 반대로 해석한다.
```swift
func compare3(value:Int) -> Int {
    if !(value < 0 || value == 0) {
        return -1
    } else {
        return 1
    }
}

result = compare3(value: 10)
print("compare3(value:10)의 결과 -> \(result)")

출력값) compare3(value:10)의 결과 -> -1
```

Quiz 16

상수에 들어 있는 값이 10보다 작거나 같은지 또는 큰지를 확인하는 코드를 만들어 보세요. 상수에 숫자 하나를 할당한 후 if ~ else 구문을 사용합니다.
if 문의 조건에서는 10보다 작거나 같은지 확인하고 10보다 작거나 같다면 '숫자 값이 10보다 작습니다.'라는 글자를 출력하도록 합니다. 그리고 그렇지 않을 경우에는 다른 결과를 출력하도록 만듭니다.
```swift
let value:Int = 12

if value <= 10 {
    print("숫자 값이 10보다 작습니다.")
} else {
    print("숫자 값이 10보다 큽니다.")
}

출력값) 숫자 값이 10보다 큽니다.
```
