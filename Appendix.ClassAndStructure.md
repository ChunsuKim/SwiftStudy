
 # 클래스와 구조체 (Classes and Structures)
 
 클래스와 구조체는 프로그램의 코드를 조직화 하기 위해 일반적으로 사용한다. OOP를 위한 필요 요소 이기도 함.
 Swift는 다른 프로그래밍 언어와 다르게 interface 파일과 implementation 파일을 분리해서 만들지 않아도 된다.
 하나의 파일에 구조체나 클래스를 정의하면, Swift가 자동으로 알아서 해당 클래스와 구조체를 사용할 수 있는 인터페이스를 생성해 준다.
 
 ## 클래스와 구조체의 비교 (Comparing Classes and Structures)
 
 Swift에서 클래스와 구조체는 많은 공통점이 있다. 클래스와 구조체 둘다 다음과 같은 기능이 가능하다.
 
 * 값을 저장하기 위한 프로퍼티 정의
 * 기능을 제공하기 위한 메소드 정의
 * subscript 문법을 이용해 특정 값을 접근할 수 있는 subscript 정의
 * 초기 상태를 설정할 수 있는 initializer 정의
 * 기본 구현에서 기능 확장
 * 특정한 종류의 표준 기능을 제공하기 위한 프로토콜 순응 (conform)
 
 구조체로는 가능하지 않고 클래스만 가능한 기능
 
 * 상속 (Inheritance): 클래스의 여러 속성을 다른 클래스에 물려 줌
 * 타입 캐스팅 (Type casting): 런타임에 클래스 인스턴스의 타입을 확인
 * 소멸자 (Deinitializers): 할당된 자원을 해제(free up) 시킴
 * 참조 카운트 (Reference counting): 클래스 인스턴스에 하나 이상의 참조가 가능
 
 Note : 구조체는 다른 코드로 전달될 때 항상 복사되서 전달되고, 참조 카운트(Reference counting)를 사용하지 않는다.
 
 ### 선언 문법 (Definition Syntax)
 
 클래스와 구조체 둘다 비슷한 선언 문법을 갖고 있다. 클래스는 class 키워드를, 구조체는 struct 키워드를 이름앞에 적어서 선언할 수 있다.
```swift 
class SomeClass {
    // 클래스 내용은 여기에
}

struct SomeStructure {
    // 구조체 내용은 여기에
}
```

 Note : 새로운 클래스나 구조체를 선언할 때마다 Swift 에서 완전히 새로운 타입을 선언하는 것이다.
 그래서 이름을 다른 표준 Swift 타입(String, Int, Bool)과 같이 UpperCamelCase 이름(SomeClass, SomeStructure 등)으로 선언한다.
 반대로 프로퍼티나 메소드는 lowerCamelCase(frameRate, incrementCount 등)으로 선언한다.
 
 아래는 각각 구조체 선언과 클래스 선언의 예시이다.
 ```swift
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution() // 위 Resolution 구조체를 값으로 사용
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
```

 구조체 Resolution 의 프로퍼티 width 와 height 는 초기 값으로 0을 할당했기 때문에 Swift 의 타입추론에 의해 자동으로 Int 형을 갖게 된다.
 
 ### 클래스와 구조체 인스턴스 (Class and Structure Instances)
 
 클래스와 구조체 이름 뒤에 빈 괄호를 적으면 각각의 인스턴스를 생성할 수 있다.
```swift
let someResolution = Resolution()   // 구조체 인스턴스 생성
let someVideoMode = VideoMode()     // 클래스 인스턴스 생성
```

 ### 프로퍼티 접근 (Accessing Properties)

```swift
// 점(dot) 문법을 통해 클래스와 구조체 인스턴스의 프로퍼티에 접근할 수 있다.

print("The width of someResolution is \(someResolution.width)")
// 출력값: The width of someResolution is 0

// 하위레벨 프로퍼티도 점(.)을 이용해 접근할 수 있다.

print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// 출력값: The width of someVideoMode is 0

// 점을 이용해 값을 할당할 수 있다.

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// 출력값: The width of someVideoMode is now 1280
```

 ### 구조체형의 맴버 초기화 (Memberwise Initializers for Structure Types)
 
 모든 구조체는 초기화시 프로퍼티를 선언할 수 있는 초기자를 자동으로 생성해 제공한다.
 아래와 같은 맴버의 초기화는 구조체 안에 width와 height 프로퍼티만 정의했다면 자동으로 사용 가능하다는 의미이다.
 ```swift
let vga = Resolution(width: 640, height: 480)
```

 ## 구조체와 열거형은 값 타입 (Structures and Enumerations Are Value Types)
 
 값 타입이라는 뜻은, 이것이 함수에서 상수나 변수에 전달될 때 그 값이 *복사되서 전달* 된다는 의미이다.
 Swift에서 모든 구조체와 열거형 타입은 값 타입이다.
 ```swift
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
```

 위 코드의 첫 줄에서 Resolution 구조체의 인스턴스 hd 를 선언한다. 그리고 hd 를 cinema 라는 변수에 할당했다.
 그러면 이 cinema 와 hd 는 같을까? 위에서 설명한 것과 같이 할당하는 순간 복사(copy)되기 때문에 cinema 와 hd 는 같지 않고 완전히 다른 인스턴스다. 
 예제를 보겠다.
 
 ```swift
// cinema 인스턴스의 width 프로퍼티에 2048을 할당한다.

cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
// 출력값: cinema is now 2048 pixels wide

// cinema 의 width 값을 보니 2048이다.

print("hd is still \(hd.width) pixels wide")
// 출력값: hd is still 1920 pixels wide
/*
하지만 원본이었던 hd 의 width 값은 여전히 원래 값인 1920을 갖고 있는 것을 볼수 있다.
이것은 두 인스턴스가 완전히 다른 개체로 다른 주소 공간에 저장되어 사용된다는 것을 보여준다.
*/
```

열거형에서의 동작도 마찬가지이다.
```swift
enum CompassPoint {
    case north, south, east, west
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection = .east
if rememberedDirection == .west {
    print("The remembered direction is still .west")
}
// 출력값: The remembered direction is still .west
```

 현재 방향 currentDirection 에 west 를 할당하고 기억한 방향 rememberedDirection 에 현재 방향 currentDirection 을 저장한다. 
 그리고 나서 현재 방향 currentDirection 을 east 로 변경한다. 
 그리고 기억하고 있는 인스턴스 rememberedDirection 을 살펴보면 여전히 원본을 복사할 때의 값 west 를 갖고 있는 것을 확인할 수 있다. 
 즉, 다른 인스턴스의 변화는 그 인스턴스에만 영향을 끼치고 그것과 다른 인스턴스에는 아무런 영향도 없다는 것을 알 수 있다.
 
 
 ## 클래스는 참조 타입 (Classes Are Reference Types)
 
 값 타입과 달리 참조 타입은 변수나 상수에 값을 할당하거나 함수에 인자로 전달할 때 그 값이 복사되지 않고 참조된다.
 참조된다는 의미는 그 값을 갖고 있는 메모리를 바라보고 있다는 뜻이다. 예제를 보겠다.
 
 ```swift
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

// tenEighty 라는 VideoMode 클래스 인스턴스를 생성하고 각 프로퍼티에 값을 할당한다.

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

/*
alsoTenEighty 라는 상수를 만들고 위에서 선언한 tenEighty 클래스의 인스턴스를 할당한다.
그리고 alsoTenEighty 의 frameRate 값을 30으로 변경한다. 위에서 이 값은 25로 선언했었다.

이제 최초에 할당한 tenEighty.frameRate 의 값을 보겠다.
*/
 
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// 출력값: The frameRate property of tenEighty is now 30.0
```

 가장 처음에 tenEighty.frameRate = 25.0 에서 할당한 25.0이 아니라 나중에 alsoTenEighty.frameRate = 30.0 에서 변경한 30이 결과 값으로 출력되었다.
 그 이유는 let alsoTenEighty = tenEighty 코드에서 alsoTenEighty 상수가 tenEighty 인스턴스를 복사한 것이 아니라 참조한 것이기 때문이다.
 그래서 실제로 alsoTenEighty 는 tenEighty 가 바라보고 있는 메모리 주소를 동일하게 바라보고 참조하고 있는 것이다.
 여기서 한가지 더 의아하게 생각할수 있는 부분은 let alsoTenEighty.frame = 30.0 같이 값을 변경할 수 있을까? 이다.
 이것은 alsoTenEighty 자체를 변경하는 것이 아니라 그것이 바라보는 값을 변경하는 것이기 때문에 가능하다.
 
 
 ### 식별 연산자 (Identity Operators)
 
 클래스는 참조 타입이기 때문에 여러 상수와 변수에서 같은 인스턴스를 참조할 수 있다. 상수와 변수가 같은 인스턴스를 참조하고 있는지 비교하기 위해 식별 연산자를 사용한다.
 
 * === : 두 상수나 변수가 같은 인스턴스를 참조하고 있는 경우 참
 * !== : 두 상수나 변수가 다른 인스턴스를 참조하고 있는 경우 참
 
 ```swift
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// 출력값: tenEighty and alsoTenEighty refer to the same VideoMode instance.
```

 위 예제의 경우 tenEighty 와 alsoTenEighty 가 같은 인스턴스를 참조하고 있어서 print 가 실행된다.
 
 식별 연산자(===)는 비교 연산자(==)와 같지 않다. 식별 연산자는 참조를 비교하는 것이고, 비교 연산자는 값을 비교한다.
 
 
 ## 클래스와 구조체의 선택 (Choosing Between Classes and Structures)
 
 클래스와 구조체 모두 프로그램의 코드를 조직화하고 특정 타입을 선언하는데 사용된다. 그리고 앞서 설명했던 것처럼 클래스 인스턴스가 인자로 사용될 때는 참조가 넘어가고 구조체는 값이 넘어간다고 했다. 그럼 언제 클래스를 사용하고 언제 구조체를 사용해야 할까?
 
 일반적으로 다음의 조건중 1개 이상을 만족하면 구조체를 사용하는 것을 고려해 볼 수 있다.
 
 * 구조의 주 목적이 관계된 간단한 값을 캡슐화(encapsulate) 하기 위한 것인 경우
 * 구조의 인스턴스가 참조되기 보다 복사되기를 기대하는 경우
 * 구조에 의해 저장된 어떠한 프로퍼티가 참조되기 보다 복사되기를 기대하는 경우
 * 구조가 프로퍼티나 메소드 등을 상속할 필요가 없는 경우
 
 
 ## String, Array, Dictionary 의 할당과 복사 동작 (Assignment and Copy Behavior for Strings, Arrays, and Dictionaries)
 
 Swift 에서는 String, Array, Dictionary 같은 기본 데이터 타입이 구조체로 구현되어 있다.
 그렇다는 의미는 이 값을 다른 상수나 변수에 할당하거나 함수나 메소드에 인자로 넘길 때 이 값이 복사된다는 것이다.
 반면 Foundation 의 NSString, NSArray, NSDictionary 는 클래스로 구현되어 있다.
 그래서 이 데이터들은 항상 할당되거나 전달될 때 복사되지 않고 참조가 사용된다.
 
 Note: 위에서 String, Array, Dictionary 는 할당되거나 전달될 때 복사된다고 설명했다.
 하지만 실제로 Swift 에서는 최적의 성능을 위해 실제 필요할 때만 데이터가 복사된다.
 
