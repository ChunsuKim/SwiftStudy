# 필요한 기능을 함수로 만들어 사용하기

### 5_옵셔널과 투플 사용하기

#### 함수에서 투플로 반환하기

투플은 여러 개의 값을 하나로 묶어주는 자료형이다.
투플에 들어가는 값은 서로 다른 자료형일 수도 있으며, 자료형만 명시하면 아무 값이나 순서대로 넣을 수 있는 특별한 자료형이다.
투플에 들어가는 데이터의 형태를 보면 변수 이름과 변수 값이 순서대로 들어가도록 되어 있는데 인덱스라는 숫자로 순서를 알 수 있다.
```swift
인덱스값은 (0, 1, 2, 3, 4, 5)

var person:(name:String, age:Int) = ("김진수", 20)

var person:(String, Int)
```
```swift 
let value1 = (10, "안녕!", Float(2.4), true)
print("value1 투플의 값 -> \(value1)")

출력값) value1 투플의 값 -> (10, "안녕!", 2.4, true)


var item1 = value1.0
print("value1 투플의 첫 번째 원소 -> \(item1)")

출력값) value1 투플의 첫 번째 원소 -> 10


let value2 = (x:10, y:20)
var item2 = value2.x
print("value2 투플의 x 원소 -> \(item2)")

출력값) value2 투플의 x 원소 -> 10

var value3 : (Int, Int) = (10, 20)
value3.0 = 30
print("value3 투플의 첫 번째 원소 -> \(value3.0)")

출력값) value3 투플의 첫 번째 원소 -> 30
```

두 개의 정수 값으로 구성된 투플을 x와 y라는 이름을 가진 투플 상수나 변수로 할당할 때 변수나 상수의 이름은 부여하지 않고 원소의 이름만 선언하는 것도 가능함.
앞에서 만든 코드는 아래와 같이 변경할 수 있다.

```swift 
let value4 : (Int, Int) = (10, 10)
let (x, y) = value4
print("투플 안의 x 값 -> \(x)")

출력값) 투플 안의 x값 -> 10
```

투플은 여러 개의 값을 하나로 묶어주는 역할을 하므로 배열(Array)이나 딕셔너리(Dictionary)와 비슷하다.

투플은 배열이나 딕셔너리 안에 들어 있는 원소 중 하나를 꺼냈을 때 각각의 원소에 들어 있는 값이 여러 개이거나 어떤 함수를 실행한 결과에 여러 개의 값이 있을 때 그것들을 보관하기 위한 자료형으로 주로 사용함.


```swift 
func getLocation() -> (x:Int, y:Int) {
    return (10, 10)
}

var location = getLocation()
print("내 위치 -> \(location.x), \(location.y)")

출력값) 내 위치 -> 10, 10
```
getLocation 함수는 두 개의 정수 값이 들어간 투플 데이터를 반환하도록 선언되었음. 그리고 함수 안에서 두 개의 정수를 소괄호로 감싸 투플로 만든 후 반환함.

```swift
func getLocation2() -> (Int, Int) {
    return (20, 20)
}

print("내 위치 -> \(location)")

출력값) 내 위치 -> (x: 10, y: 10)
```

getLocation2 함수는 똑같이 투플 형식으로 결과 값을 반환하지만 투플 안에 들어 있는 값을 이름 없이 넣었다는 것만 다르다. 따라서 함수에서 반환한 투플 안의 값에 접근할 때 인덱스를 사용함.


투플에 ? 기호를 붙여 옵셔널 자료형으로 만들어 반환하는 경우.
투플도 옵셔널로 만들 수 있으며 투플 자료형 뒤에 ? 기호를 붙이면 된다.
> (자료형1, 자료형2)?
>
> 또는
>
> (변수이름1: 자료형1, 변수이름2: 자료형2)?
```swift
func getPerson(value1:String) -> (name:String, age:Int?)? {
    var value2 : Int?
    value2 = Int(value1)
    if value2 == nil {
        print("전달 받은 값은 숫자가 아닙니다.")
        return nil
    } else {
        print("전달 받은 숫자 -> \(value2!)")
        return (name:"김진수", age:value2)
    }
}

var result = getPerson(value1: "20")
print("getPerson 함수 호출 결과 -> \(result)")

출력값) getPerson 함수 호출 결과 -> Optional((name: "김진수", age: Optional(20)))
```
getPerson 함수를 호출하면 투플 자료형으로 반환하므로 그 값은 nil일 수 있다. getPerson 함수에서 nil을 반환한다면 파라미터로 전달한 문자열에 숫자가 들어 있지 않는 경우이다.


함수를 호출할 때 전달하는 파라미터로 투플을 사용할 수도 있음.

다음 코드는 getCount 함수를 호출할 때 투플을 파라미터로 전달하는데 여러 개를 한꺼번에 전달할 수 있도록 가변 파라미터로 정의함.
```swift
func getCount(persons:(name:String, age:Int)...) -> Int {
    var count = 0
    for (_, _) in persons {
        count += 1
    }
    return count
}

var result2 = getCount(persons: ("김진수", 20), ("김진희", 22))
print("getCount 함수 호출 결과 -> \(result2)")

출력값) getCount 함수 호출 결과 -> 2
```
getCount 함수로 전달되는 파라미터를 보면 이름이 persons이고 그 자료형은 가변 파라미터로 정의됨.

가변 파라미터는 ... 기호를 붙여서 설정했으며 그 앞에는 투플 자료형임을 알 수 있는 (name:String, age:Int) 형식의 코드가 들어 있음.

이렇게 정의한 함수를 호출할 때는 여러 개의 투플 데이터를 파라미터로 넣어줄 수 있다.

<kbd>_</kbd>  _ 기호: 변수나 원소의 이름을 사용하지 않고 그 값의 위치만 지정함.


Quiz 11

함수가 투플 자료형으로 된 가변 길이 파라미터를 갖게 만들고 반환되는 값도 투플 자료형이 되도록 정의해 보세요. 
함수의 이름은 getCount로 만들고 파라미터로 전달되는 투플 안에는 name과 mobile이라는 이름의 값이 들어가도록 합니다. 
그리고 그 값들은 nil 값이 될 수 있도록 옵셔널로 만듭니다. 함수 안에서는 name과 mobile의 값이 nil이 아니면 숫자를 세고 nil이면 세지 않으며, 
결과 값은 두 개 만들고 하나의 투플 자료형으로 반환하도록 합니다.
```swift
func getCount(persons:(name:String?, mobile:String?)...) -> (Int, Int) {
    var nameCount = 0
    var mobileCount = 0
    for (value1, value2) in persons {
        if value1 != nil {
            nameCount += 1
        }
        
        if value2 != nil {
            mobileCount += 1
        }
    }
    
    return (nameCount, mobileCount)
}

var result1 = getCount(persons: ("소녀시대", "010-1000-1000"),("걸스데이",nil),(nil,nil))
print("getCount 결과 : \(result1)")

출력값) getCount 결과 : (2, 1)
```


Swift study 02

이름이 calcAge 인 함수를 만드세요. calcAge 함수를 정의할 때는 세 개의 파라미터를 전달 받게 합니다. 첫 번쨰 파라미터는 사람의 이름이고 두 번쨰 파라미터는 사람의 전화번호이며, 세 번째 파라미터는 그사람이 태어난 연도로 지정합니다. 각 파라미터의 자료형은 String, String, Int를 사용합니다.

calcAge 함수 안에서는 세 번째 파라미터로 전달되는 사람이 태어난 연도를 사용해 나이를 계산합니다(나이를 계산하려면 생년월일이 있어야 하지만 여기서는 코드 연습을 위해 연도로만 계산). 함수에서 계산한 결과 값은 투플로 만들어 변환합니다. 투플의 첫 번째 원소는 사람의 이름, 두 번째 원소는 사람의 전화번호, 세 번째 원소는 그 사람의 나이로 합니다.

세 번째 파라미터로 전달되는 나이는 nil이 될 수 있도록 옵셔널로 정의하고, 함수에서 반환하는 투플도 nil이 될 수 있도록 옵셔널로 정의합니다. 마지막으로 함수를 호출하여 반환 받은 투플에서 나이를 가져와 화면에 출력합니다.
```swift
func calcAge(name:String, mobile:String, birth:Int?) -> (String, String, Int)? {
    if birth == nil {
        return nil
    }
    
    let age = 2018 - birth!
    
    return (name, mobile, age)
}

let person = calcAge(name: "김준수", mobile: "010-1000-1000", birth: 1990)
print("나이를 계산한 결과 -> \(person!.2)")

출력값) 나이를 계산한 결과 -> 28
```
