
 # UserDefaults 객체를 사용하여 값을 주고받기
 
 코코아 터치 프레임워크에서 제공하는 UserDefaults 객체를 통해 값을 주고 받는 방법을 알아보겠습니다.
 이 객체를 이용하면 앱을 삭제하기 전까지는 저장된 값이 반영구적으로 유지된다는 장점이 있습니다. 때문에 이 객체에는 비교적 단순하면서도 값이 유지되어야 하는 로그인 여부나 간단한 설정 정보 등을 저장하는 경우가 많습니다.
 
 내부적으로 plist 파일을 이용하여 값을 저장하는 UserDefaults 객체는 본래 NSData, NSString, NSNumber, NSArray, NSDictionary 타입의 값만 저장할 수 있었으며, 다른 클래스 타입의 객체를 저장하려면 직렬화 과정을 거쳐야 했습니다. 하지만 스위프트 언어가 코코아 터치 프레임워크에 반영되면서 스위프트에서 제공하는 기본 자료형까지 UserDefaults 객체에서 그대로 저장할 수 있게 되었습니다.
 
 먼저 FormViewController.swift 파일을 열어 onSubmit() 메소드의 내용을 다음과 같이 변경합니다.
 
```swift
import UIKit

class FormViewController: UIViewController {
//    ...(중략)...
    
    // Submit 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func onSubmit(_ sender: Any) {
        // UserDefault 객체의 인스턴스를 가져온다
        let ud = UserDefaults.standard
        
        // 값을 저장한다.
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
        // 이전 화면으로 복귀한다.
        self.presentingViewController?.dismiss(animated: true)
    }
}
```

 UserDefaults는 시스템에서 자동으로 생성하여 제공하는 단일 객체이므로, 이 인스턴스는 지금까지의 일반적인 방법처럼 직접 생성하는 것이 아니라 UserDefaults.standard 프로퍼티를 사용하여 읽어와야 합니다. 이 프로퍼티는 클래스 프로퍼티이므로 UserDefaults 인스턴스를 생성하지 않고도 사용할 수 있습니다. 하긴, UserDefaults 객체의 인스턴스를 얻기 위해 UserDefaults 인스턴스가 필요하다고 한다면 논리적 모순이겠군요.
 
 UserDefaults.standard 프로퍼티를 통해 얻어온 UserDefaults 객체의 인스턴스를 ud 상수에 저장하고, set(_:forKey:) 메소드를 사용하여 값을 저장합니다. UserDefaults 객체에는 스위프트 기본 자료형을 그대로 저장할 수 있으므로 값의 타입을 변경해줄 필요가 없습니다. UserDefaults에 저장한 객체는 함께 저장된 키를 통해 구분되는데, 이를 위해 "email", "isUpdate", "interval"을 각각 넣어주고 있습니다. 이렇게 값을 저장한 다음 마찬가지로 아무일 없었다는 듯이 화면을 복귀 처리하면 끝입니다.
 
 다음으로 값을 꺼내는 코드를 작성해보겠습니다. ViewController.swift 파일을 열고 viewWillAppear(_:) 메소드의 내용을 다음과 같이 수정합니다.
 
```swift
//화면이 표시될 때마다 호출되는 메소드
override func viewWillAppear(_ animated: Bool) {
    // UserDefault 객체의 인스턴스를 가져온다
    let ud = UserDefaults.standard
    
    if let email = ud.string(forKey: "email") {
        resultEmail.text = email
    }
    
    let update = ud.bool(forKey: "isUpdate")
    resultUpdate.text = (update == true ? "자동갱신" : "자동갱신안함")
    
    let interval = ud.double(forKey: "interval")
    resultInterval.text = "\(Int(interval))분마다"
}
```

 viewWillAppear(_:) 메소드에 사용된 코드 중에서 제일 먼저 등장하는 부분은 UserDefaults 객체의 인스턴스를 가져오는 부분입니다. 조금 전에 작성했던 코드와 동일한데, UserDefaults의 클래스 프로퍼티인 standard를 사용하여 인스턴스 참조를 가져옵니다. 이렇게 얻어진 인스턴스를 ud 상수에 저장하고, 이를 통해 저장된 값을 꺼내면 끝입니다. 저장된 값을 꺼낼 때에는 저장된 값의 타입에 맞는 메소드를 사용하면 읽어온 값을 캐스팅하는 과정 없이 바로 사용할 수 있습니다.
 
 UserDefaults 객체에서 값을 읽어오는 메소드 중에서는 String 타입의 메소드만 반환값이 옵셔널 타입입니다. 이는 아무 값도 저장되어 있지 않을 때 nil을 반환한다는 뜻이죠. 따라서 사용할 때에는 적절히 옵셔널 타입을 해제해 주어야 합니다. 위 예제에서는 옵셔널 바인딩을 통해 해제하고 있죠. guard 구문을 사용하지 않고 if 구문을 사용한 것은 해당 값이 없더라도 메소드가 종료되어서는 안 되기 때문입니다.
 
 이와는 달리 Bool 타입이나 Double 타입의 메소드는 일반 타입으로 값을 반환하기 때문에 옵셔널 해제 없이 바로 사용하면 됩니다. 아무 값도 저장되어 있지 않다면 각 타입별로 기본값을 반환하게 됩니다. 이렇게 꺼낸 값을 화면에 적절히 표시해주면 실습 과정이 모두 완료됩니다.
 
 저장된 값의 타입이 어떤 것인지 정확하게 알기 어렵거나 메소드를 공용으로 사용할 때에는 범용 데이터 타입을 반환하는 메소드를 사용해도 됩니다. 이 메소드는 Any 타입을 반환하기 때문에 다음과 같은 식으로 캐스팅해서 값을 사용하면 됩니다.
 ```swift
    let email = ud.value(forKey: "email") as? String
 또는
    let email = ud.object(forKey: "email") as? String
 ```
 
 둘 다 Any 타입의 값을 반환하는 메소드입니다. 문자열부터 논리형, 실수 등 모든 타입의 값을 읽어올 수 있지만, 항상 옵셔널 타입으로 반환하기 때문에 주의해야 합니다.
 
 UserDefaults 객체에 값을 저장하고 나면, 앱을 종료하고 다시 열게 되어도 첫 화면부터 값이 표시됩니다. 이 값은 UserDefaults 객체에 저장되어 있는 값이죠. 이렇게 저장된 값은 앱을 삭제하기 전까지는 유지되지만, 일단 앱을 삭제하고 나면 함께 제거된다는 점에 주의해야 합니다.
 
