//
//  XibScreenController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/11.
//

import UIKit

class XibScreenController: UIView{
    @IBOutlet weak var image1: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        // Set the image after the view has been loaded from the XIB
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Set the image after the view has been resized
        image1.backgroundColor = UIColor.red
        image1.image = UIImage(named: "xrn")
    }
}
