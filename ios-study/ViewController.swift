//
//  ViewController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var sumButton: UIButton!
    @IBOutlet weak var sumnumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func compute() {
        print("compute")
        let num1 = Int(number1.text!)!
        let num2 = Int(number2.text!)!
        sumnumber.text = "\(num1 + num2)"
        
        // 第一种做法
//        number2.resignFirstResponder()
//        number1.resignFirstResponder()
        
        self.view.endEditing(true)
    }
    
    func jisuan(){
        
    }
}

