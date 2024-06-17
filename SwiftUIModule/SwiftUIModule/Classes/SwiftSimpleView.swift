//
//  SwiftSimpleView.swift
//  SwiftUIModule
//
//  Created by 郝宜文 on 2024/6/12.
//

import SwiftUI
import UIKit

struct SwiftSimpleView: View {
    var body: some View {
        NavigationView{
            ListDemo()
                .navigationTitle("SwiftUI List")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            popToHome()
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                        }
                    }
                }
        }
    }
    
    private func popToHome(){
        // 通过父视图的 navigationController 弹出当前视图
       if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let window = windowScene.windows.first,
          let rootViewController = window.rootViewController {
           if let navigationController = rootViewController as? UINavigationController {
               navigationController.popViewController(animated: true)
           } else {
               rootViewController.navigationController?.popViewController(animated: true)
           }
       }
    }
}
