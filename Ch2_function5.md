### 가변 파라미터

일반적으로 함수의 파라미터 개수는 함수를 정의할 때 미리 정한다.
하지만 경우에 따라 함수를 정의할 때가 아니라 함수를 호출할 때 파라미터의 개수를 바꾸고 싶을 수도 있다.
특히 연속된 값을 여러 개 받아 처리하도록 만들고 싶은데 몇 개의 값이 전달될지 예측할 수 없는 경우에 **'가변 파라미터(Variadic Parameter)'** 를 사용한다.
가변 파라미터로 만들려면 **파라미터 이름 뒤에 ... 연산자를 추가** 하면 된다.
```swift
func 함수이름(파라미터이름 : 자료형 ...) -> 반환자료형 { ... )
```
이렇게 전달된 값을 함수 안에서 사용할 때는 **for ~ in** 문을 사용할 수 있다.
즉, 전달된 가변 파라미터 안에 들어 있는 여러 개의 값을 in 뒤에 써 주면 그 안에 들어 있는 값을 하나씩 꺼내어 처리할 수 있다.
```swift
func sum(values : Int ...) -> Int {
    var total = 0
    
    for value in values {
        total += value
    }
    
    return total
}

var result = sum(values: 10, 20, 30, 40, 50)
print("sum 함수 호출 결과 -> \(result)")

출력값) sum 함수 호출 결과 -> 150
```
sum 함수는 values라는 파라미터를 갖고 있는데 Int 자료형을 입력한 후 ... 연산자 기호를 함께 붙여서 가변 파라미터로 지정했다.
이렇게 하면 여러 개의 정수 값을 values 파라미터로 전달 받을 수 있다.

sum 함수 안에서는 for 문을 사용하고 있는데 values 파라미터 안에 있는 값을 in 연산자로 하나하나 확인하면서 중괄호 안의 코드를 반복 실행한다.

중괄호 안에서는 value 값을 total 변수의 값과 더하여 다시 total 변수에 넣어준다.

마지막으로 return 키워드를 사용해 함수 상자 밖으로 값을 던져준다.
이렇게 만든 sum 함수를 호출할 때는 소괄호 안에 values라는 파라미터 이름을 지정한 후 원하는 개수만큼 숫자를 넣어줄 수 있다.



[Ch2_function6.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch2_function6.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
