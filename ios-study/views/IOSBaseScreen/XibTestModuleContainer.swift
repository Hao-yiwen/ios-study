//
//  XibTestModuleContainer.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/12.
//

import UIKit
import TestModule

class XibTestModuleContainer: UIView{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        commonInit()
    }
    
    private func commonInit(){
        let bundle = Bundle(for: TestModuleViewController.self)
        let nib = UINib(nibName: "TestModuleXib", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
}
