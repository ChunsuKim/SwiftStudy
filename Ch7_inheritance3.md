### 2_메소드 재정의와 메소드 추가하기

Person 클래스를 상속하여 만든 Baby 클래스에는 필요할 때 속성이나 함수를 추가할 수 있다. 또한 부모 클래스인 Person 클래스에 만들어 둔 함수를 다시 새로운 기능으로 만들 수 있다.
이것을 '메소드 재정의(Overriding)'라고 한다. 메소드를 재정의할 때는 함수 앞에 override 키워드를 붙인다.
```swift
override func 함수이름 (파라미터) -> 반환자료형 { ... }
```
다음 코드처럼 Baby 클래스에서 Person 클래스의 메소드를 재정의한다.
```swift
class Person {
    var name : String
    var age : Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func walk(duration: Int) -> Int {
        return duration * 10
    }
}

class Baby : Person {
    override func walk(duration: Int) -> Int {
        return duration * 5
    }
// cry 메소드 추가
    func cry() {
        print("아기가 웁니다.")
    }
// cry 메소드 추가 끝
}

var person1 = Person(name: "소녀시대", age: 20)
print("person1 걸어간 거리 -> \(person1.walk(duration:10))")

var baby1 = Baby(name: "걸스데이", age: 22)
print("baby1 걸어간 거리 -> \(baby1.walk(duration:10))")

출력값) person1 걸어간 거리 -> 100
      baby1 걸어간 거리 -> 50
```
Person 클래스 안에 정의한 walk 메소드는 사람이 걸어간 시간을 파라미터로 전달 받은 후 걸어간 거리를 반환한다.
Baby 클래스에서는 이 메소드를 재정의하였으며 walk 메소드 안에서 시간에 10을 곱하는 것이 아니라 5를 곱하도록 수정하였다.
Person 클래스와 Baby 클래스로부터 사람 객체와 아기 객체를 만든 후 파라미터 값으로 10을 전달하면서 walk 메소드를 호출하면 서로 다른 결과가 출력되는 것을 확인할 수 있다.

이번에는 Baby 클래스에 cry 메소드를 추가해 보겠다. 위의 // cry 메소드 추가 주석을 참고하기 바란다.

일반적인 함수 추가와 같으므로 이상하게 느껴지는 부분은 없을 것이다. 새로 추가한 메소드는 부모 클래스와 상관없으므로 Baby 클래스로부터 만든 인스턴스 객체에서만 호출할 수 있다.


[Ch7_inheritance4.md 파일로 가기](https://github.com/ChunsuKim/SwiftStudy/blob/master/Ch7_inheritance4.md)

[Swift Study Contents로 돌아가기](https://github.com/ChunsuKim/SwiftStudy)
