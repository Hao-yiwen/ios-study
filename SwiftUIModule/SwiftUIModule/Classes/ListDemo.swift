//
//  ListDemo.swift
//  DoubleConversion
//
//  Created by 郝宜文 on 2024/6/16.
//

import SwiftUI

struct ListDemo : View{
    var body: some View {
            List{
                // 设置title
                NavigationLink(destination: DetailDemo()){
                    Button(action: {
                        print("Button tapped")
                    }) {
                        Text("Button")
                    }
                }
                .navigationTitle(_: "ListDemo")
            }
    }
}
