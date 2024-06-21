//
//  ViewBaseController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/16.
//

import UIKit

class ViewBaseController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    var popRecognizer: InteractivePopRecognizer?
    var appUrl: String = ""
    var isShowHeader: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(keyboardDismiss))
        view.addGestureRecognizer(tap)
        
        addDebugIcon()
    }
    
    func addDebugIcon(){
        // 如果是debug环境
        #if DEBUG
            // 在页面右侧中间位置添加一个调试图标
            let debugView = UIImageView(image: UIImage(named: "debug"))
            debugView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            debugView.contentMode = .scaleAspectFit
            // 设置为圆形图片
            debugView.layer.cornerRadius = 20
            debugView.layer.masksToBounds = true
            debugView.layer.borderColor = UIColor.gray.cgColor
            debugView.layer.borderWidth = 1
            debugView.translatesAutoresizingMaskIntoConstraints = false
            debugView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleDebug)))
            debugView.isUserInteractionEnabled = true
        debugView.layer.zPosition = 100
            
            view.addSubview(debugView)
            NSLayoutConstraint.activate([
                debugView.widthAnchor.constraint(equalToConstant: 40),
                debugView.heightAnchor.constraint(equalToConstant: 40),
                debugView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
                debugView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            ])
            
            self.appUrl = getAppUrl()
        #endif
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
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(!self.isShowHeader){
            setInteractiveRecognizer()
        }
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
    
    private func setInteractiveRecognizer() {
        guard let controller = navigationController else { return }
        popRecognizer = InteractivePopRecognizer(controller: controller)
        controller.interactivePopGestureRecognizer?.delegate = popRecognizer
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if(!self.isShowHeader){
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
    }
    
    @objc func toggleDebug() {
        self.view.makeToast("点击了调试按钮", duration: 2.0, position: .bottom)
        //在头部弹出一个下啦列表 其中有三个按钮 一个是重新加载 一个是返回上一页 还有显示页面url
        let alert = UIAlertController(title: "调试页面", message: nil, preferredStyle: .actionSheet)
        let reloadAction = UIAlertAction(title: "重新加载", style: .default) { (action) in
            self.viewDidLoad()
        }
        let backAction = UIAlertAction(title: "返回上一页", style: .default) { (action) in
            if(self.navigationController?.viewControllers.count ?? 0 > 1){
                self.navigationController?.popViewController(animated: true)
            }
        }
        let showUrlAction = UIAlertAction(title: "显示页面URL", style: .default) { (action) in
            // 获取当前页面的app url
            let alert = UIAlertController(title: "页面URL", message: self.appUrl, preferredStyle: .alert)
            let action = UIAlertAction(title: "确定", style: .default, handler: nil)
            let copyAction = UIAlertAction(title: "复制", style: .default) { (action) in
                UIPasteboard.general.string = self.appUrl
                self.view.makeToast("已复制到剪贴板", duration: 2.0, position: .bottom)
            }
            alert.addAction(copyAction)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(reloadAction)
        alert.addAction(backAction)
        alert.addAction(showUrlAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func getAppUrl() -> String {
        var viewControllerMap: [String: String] = [:]
        // 获取当前视图控制器的类名
        let currentViewControllerClassName = String(describing: type(of: self))
        print("Current view controller class name: \(currentViewControllerClassName)")
        if let url = Bundle.main.url(forResource: "ViewControllerConfig", withExtension: "json") {
            print("Config file URL: \(url)")
            do {
                let data = try Data(contentsOf: url)
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String] {
                    viewControllerMap = json
                    print("Config loaded successfully: \(viewControllerMap)")
                } else {
                    print("Failed to cast JSON as [String: String]")
                }
                return viewControllerMap[currentViewControllerClassName] ?? ""
            } catch {
                print("Failed to load config: \(error)")
                return ""
            }
        }
        print("Config file not found")
        return ""
    }
}
