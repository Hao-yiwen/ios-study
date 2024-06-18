//
//  ViewController.swift 首页viewController
//  ios-study
//
//  Created by 郝宜文 on 2024/6/10.
//

import UIKit

class ViewController: ViewBaseController {
    var stackView: UIStackView!
    var textForm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextForm()
        addScanButton()
    }
    
    func addTextForm(){
        textForm = UITextField()
        textForm.placeholder = "请输入跳转链接"
        textForm.translatesAutoresizingMaskIntoConstraints = false
        textForm.borderStyle = .roundedRect
        textForm.widthAnchor.constraint(equalToConstant: 200).isActive = true
        // 从键值对中获取值
        let value = UserDefaults.standard.string(forKey: "qrCode")
        textForm.text = value
        view.addSubview(textForm)
        
        let button = UIButton(type: .system)
        button.setTitle("跳转", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(jumpAction), for: .touchUpInside)
        view.addSubview(button)
        
        stackView = UIStackView(arrangedSubviews: [textForm,button])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20)
        ])
        NotificationCenter.default.addObserver(self, selector: #selector(setTextForm), name: NSNotification.Name("qrcode"), object: nil)
    }
    
    func addScanButton(){
        // 添加一个扫码按钮
        let scanButton = UIButton(type: .system)
        scanButton.setTitle("点击扫码", for: .normal)
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        scanButton.addTarget(self, action: #selector(scanAction), for: .touchUpInside)
        view.addSubview(scanButton)
        NSLayoutConstraint.activate([
            scanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scanButton.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 20)
        ])
    }
    
    @objc func scanAction() {
        let scanController = ScanCodeScreenController()
        self.navigationController?.pushViewController(scanController, animated: true)
    }
    
    @objc func jumpAction() {
        if textForm.text == "" {
            return
        }
        NotificationCenter.default.post(name: NSNotification.Name("URLHANDLE"), object: nil, userInfo: ["url":textForm.text!])
    }
    
    @objc func setTextForm() {
        textForm.text = UserDefaults.standard.string(forKey: "qrCode")
    }
    
    deinit{
        // 移除观察者
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("qrcode"), object: nil)
    }
}

