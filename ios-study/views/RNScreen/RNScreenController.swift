//
//  File.swift
//  ios-study
//
//  Created by yw.hao on 2024/6/13.
//

import UIKit
import React
import Toast_Swift

/**
 * 处理RN的URL
 *
 * @param context
 * @param url
 * @decription 本地url 例如 http://localhost:8081/index.bundle?platform=android&isRN=true&moduleName=xxx
 * @decription 静态url 例如 /rn_xxx/yyyy.jsbundle?isRN=true
 * 解释: xxx是component的名字
 * index.jsbundle是静态资源名字
 * isRN=true表示是RN的URL
 */
@objc class RNScreenController: ViewBaseController{
    @objc var developUrl: String? = "http://127.0.0.1:8081/index.bundle?platform=ios"
    @objc var moduleName: String = "rnDemo0742"
    
    override func viewDidLoad() {
        let jsCodeLocation: URL
        if developUrl?.contains("http") == false {
            // 静态rn资源格式是 /rn_xxx/yyyy.jsbundle?isRN=true
            guard let rangeofrn = developUrl?.range(of: "rn_") else {
                self.view.makeToast("URL不合法", duration: 2.0, position: .bottom)
                return
            }
            let staticUrl = String(developUrl?[rangeofrn.upperBound...] ?? "")
            // 返回前缀与第二个 '/' 之间的子字符串 例如 xxx
            let range = staticUrl.range(of: "/")
            self.moduleName = String(staticUrl[..<range!.lowerBound])
            // 获取静态资源名称 例如 yyyy.jsbundle
            let otherurl = String(staticUrl[range!.upperBound...])
            let staticName = otherurl.components(separatedBy: ".jsbundle").first ?? ""
            if let tmpUrl = Bundle.main.url(forResource: staticName, withExtension: "hbc") {
                jsCodeLocation = tmpUrl
            } else if let tmpUrl = Bundle.main.url(forResource: staticName, withExtension: "jsbundle")  {
                jsCodeLocation = tmpUrl
            } else {
                self.view.makeToast("URL不合法", duration: 2.0, position: .bottom)
                return
            }
        } else {
            if let debugURL = URL(string: developUrl ?? "") {
                    jsCodeLocation = debugURL
            } else {
                self.view.makeToast("URL不合法", duration: 2.0, position: .bottom)
                return
            }
        }
                
        let mockData: NSDictionary = ["scores": ["test": 1]]
        
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: moduleName,
            initialProperties: mockData as? [AnyHashable: Any],
            launchOptions: nil
        )
        
        self.view = rootView
        
        // 在页面右侧中间位置添加一个调试图标
        let rnDebugView = UIImageView(image: UIImage(named: "react"))
        rnDebugView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rnDebugView.contentMode = .scaleAspectFit
        // 设置为圆形图片
        rnDebugView.layer.cornerRadius = 20
        rnDebugView.layer.masksToBounds = true
        rnDebugView.layer.borderColor = UIColor.gray.cgColor
        rnDebugView.layer.borderWidth = 1
        rnDebugView.translatesAutoresizingMaskIntoConstraints = false
        rnDebugView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleDebugRN)))
        rnDebugView.isUserInteractionEnabled = true
        
        view.addSubview(rnDebugView)
        NSLayoutConstraint.activate([
            rnDebugView.widthAnchor.constraint(equalToConstant: 40),
            rnDebugView.heightAnchor.constraint(equalToConstant: 40),
            rnDebugView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rnDebugView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        self.addDebugIcon()
        self.isShowHeader = false
    }
    
    @objc func toggleDebugRN() {
        self.view.makeToast("点击了调试按钮", duration: 2.0, position: .bottom)
        //在头部弹出一个下啦列表 其中有三个按钮 一个是重新加载 一个是返回上一页 还有显示页面url
        let alert = UIAlertController(title: "调试页面", message: nil, preferredStyle: .actionSheet)
        let reloadAction = UIAlertAction(title: "重新加载", style: .default) { (action) in
            self.viewDidLoad()
        }
        let backAction = UIAlertAction(title: "返回上一页", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        let showUrlAction = UIAlertAction(title: "显示页面URL", style: .default) { (action) in
            let alert = UIAlertController(title: "页面URL", message: self.developUrl, preferredStyle: .alert)
            let action = UIAlertAction(title: "确定", style: .default, handler: nil)
            let copyAction = UIAlertAction(title: "复制", style: .default) { (action) in
                UIPasteboard.general.string = self.developUrl
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
}
