
 # 문자열과 시간 다루기
 
 변수에 문자열을 넣는 것은 쉽지만 그 형식은 여러분이 원하는 형태로 구성하기 어려울 때도 많다. 특히 한 명이 아닌 여러 사람의 이름을 콤마(,)로 구분해서 하나의 문자열로 넣거나 특수 기호와 함께 넣었다면 그중에서 필요한 글자만 따로 잘라내어 사용해야 한다. 이때 그 사용 방법을 모르면 한참을 헤맬 수도 있다.
 
 아이폰 앱이나 맥북에서 동작하는 프로그램을 만들 때 추가적으로 사용할 수 있는 SDK가 있고 그 안에 여러 가지 기능이 들어 있다. 그중에서 가장 기본이 되는 것이 '파운데이션 프레임워크(Foundation Framework)'이다. 파운데이션 프레임워크는 데이터 처리나 파일 처리와 같은 필수 기능을 제공하므로 파운데이션 프레임워크를 사용해 문자열이나 시간 등을 다루게 된다. 따라서 이 장에서는 문자열을 어떻게 처리해야 하는지 살펴본다. 또한 날짜와 시간을 표시해야 하는 경우도 자주 생기므로 날짜와 시간을 원하는 형식으로 바꾸는 방법도 알아본다.
 
 
 ### 1_파운데이션 프레임워크
 
 스위프트를 어느 정도 이해했다고 하더라도 iOS나 macOS 응용 프로그램을 바로 만들 수 있는 것은 아니다. 앱이나 프로그램을 만들 때는 사진 찍기와 같은 멀티미디어 기능을 사용하거나 단말의 센서 다루기 또는 데이터를 가공하는 등의 기능이 함께 사용될 때가 많기 때문이다. 앱을 만들 때 필요한 기능은 애플에서 미리 만들어 SDK로 제공하는데 그 안에는 프레임워크라고 불리는 라이브러리들이 있다.
 
 여러 프레임워크 중에서 'UIKit 프레임워크'는 사용자가 눈으로 볼 수 있는 화면을 구성하며, 이벤트를 처리할 때 필요한 기능을 제공한다. 그리고 UI를 보여주면서 시작되는 클래스도 제공된다. 프로그램을 실행했을 때 처음부터 화면이 보이는 경우가 많으니 이 프레임워크를 사용할 때가 많겠다. UIView, UIImage는 UIKit에서 제공되는 클래스들로 클래스 이름 앞에 UI를 붙여 구별한다. 이 외에도 지도를 다루는 데 필요한 'MapKit 프레임워크', 멀티미디어 기능을 제공하는 'AVFoundation 프레임워크'등이 있다. 그중에서 가장 기본이 되고 다른 프레임워크가 의존하고 있는 것이 '파운데이션 프레임워크'이다.
 
 파운데이션 프레임워크는 데이터 처리, 네트워크 처리, 파일 처리와 같은 필수 기능을 제공한다. 파운데이션 프레임워크에서 제공하는 클래스는 이름 앞에 NS를 붙인다. 예를 들어, NSData, NSArray, NSURL은 파운데이션 프레임워크에서 제공하는 클래스들이다.
 
 파운데이션 프레임워크를 사용할 때는 프로그램의 상단에 import 문을 입력한다. 이 한 줄만 입력하면 파운데이션 프레임워크를 사용할 수 있게 된다.
 ```swift
 import Foundation
 ```
 
 NSObject 클래스는 파운데이션 프레임워크의 가장 기본이 되는 클래스로서 다른 클래스의 부모 클래스가 된다. 파운데이션 프레임워크에서 제공하는 기능을 사용하는 새로운 클래스를 만들 때는 NSObject를 상속해야 하는 경우가 있다. NSObject가 제공하는 주요 기능으로는 '객체 비교', '셀렉터(Selector)'등이 있다.
 
 
 #### isEqual을 사용해 객체 비교하기
 
 먼저 객체 비교 기능은 === 연산자의 기능과 크게 다르지 않다. 하지만 NSObject를 상속하고 isEqual 메소드를 구현하면 두 객체를 비교할 내용을 좀 더 구체적으로 지정할 수 있다. 다음 코드를 입력한다.
 
```swift
import Foundation

class Person : NSObject {
    var name : String
    var age : Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? Person {
            return self.name == other.name && self.age == other.age
        }
        return false
    }
}

let person1 = Person(name: "소녀시대", age: 22)
let person2 = Person(name: "소녀시대", age: 22)
let person3 = Person(name: "걸스데이", age: 20)

if person1.isEqual(person2) {
    print("person1과 person2는 같습니다.")
}

if person1 != person3 {
    print("person1과 person3은 다릅니다.")
}

출력값) person1과 person2는 같습니다.
      person1과 person3은 다릅니다.
```

 isEqual 메소드를 구현하면 이 메소드를 사용해 두 개의 객체를 비교하게 된다. === 연산자를 사용할 때도 내부적으로 isEqual 메소드를 호출하므로 동일한 결과를 만들어낸다. 하지만 isEqual 메소드 안에서는 파라미터로 전달된 객체를 형 변환한 후 그 객체 안에 들어 있는 속성 중에서 어떤 것을 비교할지 지정할 수 있다. 따라서 필요에 따라 비교 기능을 수정할 수 있다.
 


[Ch9_foundation2.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch9_foundation2.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
