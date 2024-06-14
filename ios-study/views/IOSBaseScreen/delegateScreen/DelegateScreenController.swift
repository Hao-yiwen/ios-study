//
//  DelegateScreenController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/15.
//

import UIKit

class DelegateScreenController:UIViewController{
    var topContainerController: TopContainerController?
    var bottomContainerController: BottomContainerController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        topContainerController?.delegate = bottomContainerController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedChild1"{
            topContainerController = segue.destination as? TopContainerController
            topContainerController?.view.backgroundColor = .red
        } else if segue.identifier == "embedChild2"{
            bottomContainerController = (segue.destination as! BottomContainerController)
            bottomContainerController!.view.backgroundColor = .green
        }
    }
}
