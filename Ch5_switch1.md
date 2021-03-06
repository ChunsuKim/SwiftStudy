#### switch 문

switch 문은 앞에서 사용했던 if ~ else if ~ else 구문을 대체할 수 있다. 앞에서 혈액형을 비교했던 코드를 switch 문으로 변경한 코드는 다음과 같다.
```swift
enum Blood {
    case A
    case B
    case O
    case AB
}

var myblood = Blood.B
switch myblood {
case .A:
    print("혈액형은 A형입니다.")
case .B:
    print("혈액형은 B형입니다.")
case .O:
    print("혈액형은 O형입니다.")
case .AB:
    print("혈액형은 AB형입니다.")
}

출력값) 혈액형은 B형입니다.
```
switch 뒤에는 비교할 혈액형 정보가 들어 있는 변수를 넣어준다. 그리고 중괄호 안에는 여러 개의 case 키워드가 있는데 모두 각각의 값들을 비교하기 위한 비교 대상이 들어간다.
case와 비교 대상을 넣은 후 그 뒤에 콜론(:)을 붙여준다. 이렇게 하면 각 case 다음에 나오는 코드들이 실행된다.
Blood라는 열거형 이름은 생략하고 .A나 .B와 같은 값을 case 뒤에 넣어주었다. 코드를 실행하면 if ~ else if ~ else 구문을 사용했을 때와 똑같은 결과가 출력된다.

switch 문을 만들 때 어떤 모양으로 만드는지 잘 기억해 두길 바란다. 왜나하면 이제부터 비교 대상이 약간씩 바뀌면서 조금 복잡한 코드처럼 보일 수 있기 때문이다.
switch 문의 비교 대상에는 여러개의 값이 들어갈 수 있고, 범위 값이 들어갈 수도 있다.
```swift
var age = 10
switch age {
case 0, 1, 2:
    print("유아")
case 3..<13:
    print("소아")
case 13..<19:
    print("청소년")
default:
    print("성인")
}

출력값) 소아
```
age 변수에는 10이 들어 있고 이 변수의 값을 switch 문에서 비교한다. case로 지정한 비교 대상을 살펴보면 첫 번쨰는 0,1,2 처럼 콤마(,)로 구분된 여러 개의 값이 들어 있다.
그리고 그다음에는 3..<13과 같은 범위 값이 들어 있다. 만약 age 변수에 들어갈 수 있는 값이 case 키워드 뒤에서 모두 비교되지 못한다면 default 키워드를 사용해 나머지 경우를 어떻게 처리할지 알려준다.

이번엔 투플로 만들어진 갑을 비교해 보겠다. 다음 코드를 입력한다.
```swift
var score = (2, 2)
switch score {
case (1, 1):
    print("점수가 1, 1입니다.")
case (1, 2):
    print("점수가 1, 2입니다.")
case (2, _):
    print("점수가 2, _입니다.")
default:
    print("알 수 없는 점수입니다.")
}

출력값) 점수가 2, _입니다.
```
score 변수는 투플로 만들어졌으며 (2, 2)라는 값을 가지고 있다. switch 문에서는 이 score 변수에 들어 있는 값을 비교하는데 case 뒤에 온 값을 보면 (1, 1), (2, 2)와 같은 투플 값이 들어 있다.
이렇게 입력하면 case (1, 1): 은 score 변수에 들어 있는 값이 (1, 1)인지를 비교한다. (2, _)의 경우에는 앞에 있는 값만 비교한다.

만약 case 키워드 뒤에서 비교하는 대상의 값을 상수로 바인딩하여 사용하고 싶다면 다음과 같은 코드를 사용할 수 있다.
```swift
switch score {
case (1, let y):
    print("점수가 1, \(y)입니다.")
case (2, let y):
    print("점수가 2, \(y)입니다.")
case (let x, let y):
    print("점수가 \(x), \(y)입니다.")
}

출력값) 점수가 2, 2입니다.
```
case (1, let y): 코드를 사용하면 투플의 첫 번쨰 값이 1인 경우에 두 번째 값을 상수 y에 넣은 후 그 아래에 있는 코드를 실행한다.
만약 이것보다 더 나아가 투플의 두 개 값을 모두 상수로 바인딩하여 사용하고 싶다면 다음과 같이 where 조건을 함께 사용할 수 있다.
```swift
switch score {
case let (x, y) where x > 0:
    print("x가 0보다 크고 \(x), \(y)입니다.")
case let (x, y) where x <= 0:
    print("x가 0보다 작거나 같고 \(x), \(y)입니다.")
default:
    print("x, y 판단할 수 없습니다.")
}

출력값) x가 0보다 크고 2, 2입니다.
```
case 뒤에 들어 있는 비교 대상을 보면, score 변수에 있는 투플의 값을 비교하여 첫 번째 값이 0보다 크면 (x, y)로 바인딩하도록 하였다.
코드를 실행하면 위의 출력값 같은 결과를 볼 수 있다.


[Ch5_guard1.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch5_guard1.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
