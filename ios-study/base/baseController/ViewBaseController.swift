//
//  BaseController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/16.
//

import UIKit

class ViewBaseController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(keyboardDismiss))
        view.addGestureRecognizer(tap)
    }
    
    // 添加完成键
    func addCompleteButton(textField: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "完成", style: .done, target: self, action: #selector(doneButtonAction))
        
        toolbar.setItems([flexSpace, doneButton], animated: false)
        textField.inputAccessoryView = toolbar
    }
    
    // 完成键的动作
    @objc func doneButtonAction() {
        view.endEditing(true)
    }
    
    @objc func keyboardDismiss() {
        view.endEditing(true)
    }
    
    // UITextFieldDelegate 方法，按下 return 键时关闭键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
