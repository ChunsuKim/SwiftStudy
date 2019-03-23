#### guard 문

함수는 그 안에 들어 있는 코드의 실행이 완료되면 종료되고 반복문의 경우에는 반복 횟수가 끝나면 종료된다. 이때 모든 과정이 끝나기 전에 중간 종료되는 것을 '조기 종료(Early Exit)'라고 한다.
조기 종료는 함수 내에서 return 문이 중간에 사용되거나 반복문에서 break 키워드가 사용될 때 일어난다.

guard 문은 이러한 조기 종료를 좀 더 쉽게 처리하도록 만들어졌다. guard 문은 guard 뒤에 조건이 오고 그 뒤에 else가 오는 형식을 취한다.
```swift
guard 조건 else {
}
```
이 guard 문은 if 문과 비슷하지만 사용법이 약간 다르다.
guard 문은 어떤 조건이 아닐 때 실행하는 것이 목적이라서 guard 키워드 뒤에 조건을 두고 다시 그 뒤에 else를 두어 '어떤 조건에 해당하지 않을 때' 실행되도록 한다.
```swift
var ages = [20, 23, 21, 17, 25]

for item in ages {
    guard item > 19 else {
        break
    }
    print("성인 나이 : \(item)")
}

출력값) 성인 나이 : 20
      성인 나이 : 23
      성인 나이 : 21
```
ages는 배열로 만들어져 있고 그 안에 다섯 개의 정수 값이 들어 있다. 각각의 정수 값은 나이를 의미하는데 그중에 19보다 큰 숫자만 for 문에서 출력하고 싶다면 for 문 안에서 guard 문을 사용할 수 있다.
guard 문을 보면 각 원소의 값이 19보다 크지 않을 때 for 문을 빠져나오도록 break 키워드를 사용했다.

그러면 if 문을 사용할 때보다 guard 문을 사용하면 어떤 장점이 있을까? guard 문은 예외적인 경우를 먼저 걸러낼 때 사용하면 좋다.
예를 들어, 사용자가 입력한 나이가 숫자가 아닌 경우를 확인해야 할 때 guard 문을 사용하면 숫자가 아닌 경우에 어떻게 할 것인지를 미리 처리할 수 있다.
이렇게 하면 예외적인 경우를 guard 문으로 확인할 수 있는 장점이 생긴다.

guard 문의 비교 조건에서도 함수를 호출하여 반환된 결과를 상수로 바인딩하여 사용할 수 있다. 다음 코드를 추가한다.
```swift
func checkBlood(type:String) -> String? {
    if type == "A" || type == "O" {
    return "OK"
    }
    return nil
}

func checkBloodTest(myblood:String) {
    guard let result = checkBlood(type: myblood) else {
        print("혈액 검사 결과는 nil입니다.")
        return
    }
    print("result 결과 : \(result)")
}

checkBloodTest(myblood: "O")
checkBloodTest(myblood: "B")

출력값) result 결과 : OK
      혈액 검사 결과는 nil입니다.
```
checkBlood 함수는 if 문을 살펴볼 때 만들었던 함수와 똑같다. 그 아래에는 이 함수를 호출하는 기능을 가진 checkBloodTest 함수를 만들었다.
이 함수는 두 번 호출되는데 한번은 혈액형 O, 또 한 번은 혈액형 B를 확인한다. checkBloodTest 함수 안에서는 전달 받은 혈액형 정보를 guard 문에서 비교한다.
checkBlood 함수를 호출한 결과가 nil일 경우에 else 뒤에 있는 코드가 실행되므로 nil일 때는 return 키워드 때문에 함수를 빠져나온다.
그런데 guard 문 아래에 있는 print 문을 보면 guard의 조건 부분에서 바인딩한 result 상수가 사용되고 있다.
이것은 guard 문의 특성인데, guard 문 안에서 바인딩된 상수의 값이 nil이 아닌 경우 guard 문이 끝나고 실행되는 그다음 코드에서도 참조할 수 있다.
코드를 실행하면 위의 출력값 같은 결과가 출력된다.

지금까지 if, switch, guard 를 사용하는 조건문과 for 나 while 을 사용하는 반복문에 대해 알아보았다. 이 문장들은 앞으로도 필요할 때마다 사용될 것이다.
이번 단락에서는 각 구문들을 형태 위주로 정리해 본 것이므로 어떤 모양으로 사용되는지를 잘 보고 익숙하게 만들어야한다. 그래야 실제 코드를 만들 때 코드의 흐름을 잘 이해할 수 있다.

Quiz 27

if 문을 사용할 때 조건문에서 바인딩 상수를 사용하도록 만들어 보세요. Dog 클래스를 만들고 이 클래스를 사용해 실제 강아지 객체를 만드는 createDog 메소드를 정의합니다.
그리고 if 문의 조건에서 createDog 메소드를 호출하여 상수에 할당합니다. createDog 메소드의 결과가 nil이 아니면 if 문의 중괄호 안에 있는 코드가 실행되도록 합니다.
```swift
class Dog {
    var name:String?
    var age:Int?
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
}

func createDog(name:String, age:Int) -> Dog? {
    return Dog(name: name, age: age)
}

if let dog1 = createDog(name: "미미", age: 1) {
    print("만들어진 강아지 객체 : \(dog1.name!)")
}

출력값) 만들어진 강아지 객체 : 미미
```

