#### while 문

지금까지 살펴본 for 문과 달리 while 문은 코드를 무작정 반복한다. 즉, 조건을 주고 그 조건이 맞으면 반복하고 아니면 중괄호 밖으로 나가는 방식이다.
따라서 잘못하면 무한 반복되어 빠져나올 수 없는 경우가 발생한다. 이런 문제 때문에 while 문을 사용할 때는 while 문을 빠져나올 수 있는 조건을 꼭 넣어주어야 한다.

![그림](https://user-images.githubusercontent.com/47494240/54860867-e3c5c180-4d63-11e9-8dbc-af5399ba95de.png)

```swift
var i = 0
while i < 5 {
    print("while 반복문 #\(i)")
    i += 1
}

출력값) while 반복문 #0
      while 반복문 #1
      while 반복문 #2
      while 반복문 #3
      while 반복문 #4
```
코드를 실행하면 중괄호 안의 코드가 다섯 번 반복되는 것을 알 수 있다. 만약 중괄호 안에서 밖으로 빠져나오고 싶을 떄는 break 키워드를 사용한다.
그리고 continue 키워드를 사용하면 그다음 코드들을 실행하지 않고 다시 중괄호 안의 코드 처음부터 실행한다.

while 문의 조건을 나중에 확인하고 싶을 때는 repeat ~ while 구문을 사용할 수 있다.
```swift
i = 0
repeat {
    print("repeat ~ while 반복문 #\(i)")
    i += 1
    
    if (i > 5) {
        break
    }
} while true

출력값) repeat ~ while 반복문 #0
      repeat ~ while 반복문 #1
      repeat ~ while 반복문 #2
      repeat ~ while 반복문 #3
      repeat ~ while 반복문 #4
      repeat ~ while 반복문 #5
```
while 뒤에는 true가 있어 중괄호 안의 코드는 무한 반복된다.
하지만 repeat ~ while 구문이 시작되기 전에 i 변수의 값을 0으로 초기화시키고 중괄호 안에서 i 변수의 값을 1씩 증가시키다가 i 변수의 값이 5보다 커지면 break 키워드를 사용해 중괄호를 빠져나가게 설정했으므로 여섯 번만 반복된다.


[Ch5_switch1.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch5_switch1.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
