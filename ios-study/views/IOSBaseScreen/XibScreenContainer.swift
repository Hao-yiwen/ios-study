//
//  XibScreen.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/11.
//

import UIKit

class XibScreen: UIView{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        commonInit()
    }
    
    private func commonInit(){
        let nib = UINib(nibName: "XibScreen", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
}
