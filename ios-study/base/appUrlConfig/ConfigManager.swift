//
//  ConfigManager.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/20.
//

import Foundation

@objc class ConfigManager: NSObject {
    @objc static let shared = ConfigManager()
    var viewControllerMap: [String: String] = [:]
    
    private override init(){
        super.init()
        if let moduleName = Bundle.main.infoDictionary?["CFBundleName"] as? String {
            print("Module Name: \(moduleName)")
        }
        loadConfig()
    }
    
    private func loadConfig() {
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
            } catch {
                print("Failed to load config: \(error)")
            }
        } else {
            print("Config file not found")
        }
    }
    
    @objc func getViewControllerName(for key: String) -> String? {
        return viewControllerMap[key]
    }
}
