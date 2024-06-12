//
//  ComputeScreenController.swift
//  ios-study
//
//  Created by yw.hao on 2024/6/12.
//

import UIKit

class ComputeScreenController:ViewController{
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var sumButton: UIButton!
    @IBOutlet weak var sumnumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number1.text = "0"
        number2.text = "0"
    }
    
    @IBAction func compute() {
        print("compute")
        guard let num1Text = number1.text, let num1 = Int(num1Text) else {
            print("Invalid input for number1")
            return
        }

        guard let num2Text = number2.text, let num2 = Int(num2Text) else {
            print("Invalid input for number2")
            return
        }
        sumnumber.text = "\(num1 + num2)"
        
        // 第一种做法
//        number2.resignFirstResponder()
//        number1.resignFirstResponder()
        
        self.view.endEditing(true)
    }
}
