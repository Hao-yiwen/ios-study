//
//  BaseView.swift
//  ios-study
//
//  Created by yw.hao on 2024/6/12.
//

import UIKit

class BaseView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func commonInit(){
        self.backgroundColor = UIColor.init(red: 237, green: 237, blue: 237, alpha: 1)
    }
}
