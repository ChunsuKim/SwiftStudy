//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by Chunsu Kim on 07/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!  // 이메일
    @IBOutlet weak var isUpdate: UISwitch!  // 자동갱신 여부
    @IBOutlet weak var interval: UIStepper! // 갱신주기
    
    
    // Submit 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func onSubmit(_ sender: Any) {
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음, ViewController 타입으로 캐스팅한다.
//        let preVC = self.presentingViewController
//        guard let vc = preVC as? ViewController else {
//            return
//        }
        
        
        // 값을 전달한다.
//        vc.paramEmail = self.email.text
//        vc.paramUpdate = self.isUpdate.isOn
//        vc.paramInterval = self.interval.value
        
        
        // AppDelegate 객체의 인스턴스를 가져온다.
//        let ad = UIApplication.shared.delegate as? AppDelegate  // 1
        
        
        // 값을 저장한다
//        ad?.paramEmail = self.email.text
//        ad?.paramUpdate = self.isUpdate.isOn
//        ad?.paramInterval = self.interval.value
        
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
