# 필요한 기능을 함수로 만들어 사용

### 1_함수란 무엇일까?

함수란 특정한 기능을 따로 만들어 둔 함수 상자와 같다.
함수를 처음 접할 때는 단순히 특정 기능을 만들어 넣은 상자에 이름을 붙인 것이라고 생각하면 쉽다.

![그림](https://user-images.githubusercontent.com/47494240/54354348-ba3cd400-4699-11e9-9fb0-72e978d22234.png)

show라는 이름의 함수 상자가 하나 있다고 가정할때 이 함수 상자에는 값을 전달할 수 있다.
상자로 값을 전달하려면 값이 전달되는 통로가 있어야 한다.
따라서 함수 상자 위쪽에 값이 전달 되는 구멍을 만들고 이 구멍으로 값을 전달하게 된다.
상자의 위쪽 구멍으로 글자가 전달되면 함수 상자에서는 전달 받은 글자를 콘솔에 출력되도록 만들 수 있다.

1. 함수 상자를 만들려면 먼저 함수에 이름을 붙인다.
2. 함수의 위쪽 구멍으로 전달한 값을 받을 수 있는 상수를 함수 뒤의 소괄호 안에 넣어준다.
3. 함수 상자의 이름 앞에는 func 키워드를 붙여준다.
4. 함수는 값을 전달 받아 어떤 기능이 동작하도록 만들어야 하므로 동작을 지시하는 코드를 작성한다.
5. 함수 상자 안에서 동작하는 코드들은 소괄호 뒤에 중괄호를 붙이고 중괄호 안에 입력한다.

![그림](https://user-images.githubusercontent.com/47494240/54354351-ba3cd400-4699-11e9-80e0-981f22489eef.png)

func 뒤에 붙는 함수 이름은 변수의 이름처럼 고유한 이름이어야 하므로 식별자가 사용된다.
함수 이름 뒤의 소괄호 안에는 함수 상자의 위쪽 구멍으로 전달되는 값을 받기 위한 상수를 정해주는데 전달할 값이 없을 때는 소괄호만 붙여준다.
중괄호 안에는 함수 상자가 어떻게 동작하는지 그 내용을 코드로 만들어 넣어준다.

```swift Hello 출력
func show() {
    print("Hello")
}

show()

// 출력값) Hello
```

func 키워드와 show 라는 함수 이름을 조합해서 새로운 함수를 만들었다. 이것을 '함수를 선언한다.(Function Declaration)'라고 한다.
이렇게 한번 만든 함수는 필요할 때마다 실행할 수 있는데 함수를 실행하는 것을 '호출한다.(Function Call)'라고 한다.
함수를 호출할 때는 함수의 이름을 쓰고 그 뒤에 소괄호 두 개를 붙인다.
결국 함수를 만들 때와 함수를 호출할 때 모두 함수의 이름 뒤에 소괄호가 붙는다.
소괄호 뒤에 중괄호가 있으면 함수를 선언, 중괄호가 없으면 함수를 호출

![그림](https://user-images.githubusercontent.com/47494240/54354353-ba3cd400-4699-11e9-9d27-e33cfb58639d.png)

코드가 한 번 실행되는 단위를 문장(Statement)이라고 하며, 보통 문장은 한 줄 또는 여러 줄로 구성된다.

show라는 이름의 함수를 만들고 함수를 실행하는 과정은 다음과 같이 정리할 수 있다.

![그림](https://user-images.githubusercontent.com/47494240/54354354-bad56a80-4699-11e9-81ac-123c6c99bd1b.png)

1. 함수 선언: 함수를 만든다.
2. 함수 호출: 함수를 실행해 달라고 요청.
3. 함수 실행: 함수가 실행되고 결과를 출력.

Quiz 07

showName이라는 이름의 함수를 만들고 함수를 실행했을 때 여러분의 이름이 출력되도록 코드를 만들어 보세요. 먼저 showName이라는 이름으로 함수를 정의합니다. 그리고 함수 안에서 print를 사용해 여러분의 이름이 출력되도록 합니다. 이름을 출력하기 위해 name 상수에 값을 넣어 두었다가 출력 하도록 합니다.
```swift 
func showName() {
    let name : String = "소녀시대"
    print("이름 : \(name)")
}

showName()

// 출력값) 이름 : 소녀시대
```


### 2_Swift program의 형태 살펴보기

![그림](https://user-images.githubusercontent.com/47494240/54354355-bad56a80-4699-11e9-8598-9648659f89f8.png)

함수를 정의할 때는 중괄호로 코드를 감싼다. 이렇게 중괄호로 코드를 분리한 것을 '코드 블록(Code Block)'이라고 한다. 코드 블록은 한 부분을 다른 부분과 분리시키는 역할.

![그림](https://user-images.githubusercontent.com/47494240/54354356-bad56a80-4699-11e9-9b1f-11d7de1e3fd4.png)

함수 상자는 위쪽 구멍으로 어떤 값이 들어가면 함수 상자의 내부가 동작하게 되고 계산한 결과 값은 아래쪽 구멍으로 내보내는 블랙박스라고 생각할 수 있다.

더하기 함수를 예로 들면 아래와 같은 모양을 머릿속으로 그려볼 수 있다.

![그림](https://user-images.githubusercontent.com/47494240/54354357-bad56a80-4699-11e9-8849-e43bc4bac8c0.png)

그림을 보면 함수 상자의 위쪽으로는 두 개의 숫자가 들어가고 함수 상자의 아래쪽으로 하나의 숫자가 나온다.


## 3_함수와 파라미터


#### 1 부터 10까지 더하는 코드 만들기

```swift
func show2() {
    var count = 0
    
    count = count + 1
    count = count + 2
    count = count + 3
    count = count + 4
    count = count + 5
    count = count + 6
    count = count + 7
    count = count + 8
    count = count + 9
    count = count + 10
    
    print("result of adding 1 to 10 : \(count)")
}

show2()

출력값) result of adding 1 to 10 : 55
```
코드의 양이 많아지긴 했지만 중괄호 안에 들어간 각 줄의 코드는 모두 똑같은 모양으로 반복되므로 쉽게 이해할 수 있다.
이 코드에서 func 키워드를 show2 앞에 붙여서 함수를 하나 만들었고 그 아래에서 이 함수를 실행하고 있다.


#### 반복되는 코드를 for 문으로 단순화하기

1부터 10까지는 위와 같이 함수를 만들었지만 1부터 100까지라면 코드 양이 너무 많아지므로 반복문을 사용하여 간결하게 만들수 있다.
for 문으로 간결하게 만들어 보겠다.
```swift
1부터 10까지 더한 값 출력 for in 반복문(loof) 사용

func show3() {
    var count = 0
    
    for i in 1 ..< 11 {
        count = count + i
    }
    
    print("1부터 10까지 더한 결과 : \(count)")
}

show3()

출력값) 1부터 10까지 더한 결과 : 55
```
55라는 결과가 동일하게 나온다. 이렇게 for 문을 사용하면 똑같이 반복되는 코드를 줄일 수 있다.

for 문은 조건을 넣은 후 그 뒤에 오는 중괄호 안에 반복할 코드를 넣는 형식을 가진다.

중괄호 안에 들어 있는 코드가 여러 번 반복되므로 '반복문(Loop)'이라고 부른다.

for 키워드 뒤에 in 이라는 연산자를 사용한다.

![그림](https://user-images.githubusercontent.com/47494240/54357774-24f20d80-46a2-11e9-96bf-dea9e3c9ed3e.png)


[Ch2_function2.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch2_function2.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)


