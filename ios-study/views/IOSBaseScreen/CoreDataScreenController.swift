//
//  CoreDataScreenController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/16.
//

import UIKit
import CoreData
import Toast_Swift

class CoreDataScreenController:UIViewController,UITextFieldDelegate {
    let defaults = UserDefaults.standard
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var textfieldAge: UITextField!
    
    @IBOutlet weak var storageShowLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 添加点击手势来关闭键盘
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @IBAction func storegeCoreData(_ sender: Any) {
        self.view.endEditing(true)
        let name = textfieldName.text
        let age = textfieldAge.text
        let person = Person(context: CoreDataStack.shared.viewContext)
        person.name = name
        person.age = Int16(age!)!
        DataStoreUtils.savePerson(person: person)
        // 弹出提示框
        let alert = UIAlertController(title: "提示", message: "保存成功", preferredStyle: .alert)
        let action = UIAlertAction(title: "确定", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBAction func showCoreData(_ sender: Any) {
        let persons = DataStoreUtils.fetchAllPerson()
        var tmpText = ""
        for person in persons {
            tmpText.append("name: \(person.name!) age: \(person.age)\n");
        }
        storageShowLabel.text = tmpText
    }
    @IBAction func storgeKeyValue(_ sender: Any) {
        let key = keyTextField.text
        let value = valueTextField.text
        
        defaults.self.set(value, forKey: key!)
        self.view.makeToast("保存成功", duration: 2.0, position: .center)
    }
    @IBOutlet weak var keyvalueLabel: UILabel!
    @IBAction func showKeyValue(_ sender: Any) {
        guard let key = keyTextField.text else {
            return
        }
        let value = defaults.string(forKey: key)
        print("key: \(key), value: \(String(describing: value))")
        keyvalueLabel.text = "key: \(key), value: \(String(describing: value))"
    }
    // UITextFieldDelegate 方法，按下 return 键时关闭键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // 关闭键盘
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
