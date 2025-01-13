//
//  MarkdownScreenController.swift
//  ios-study
//
//  Created by yw.hao on 2024/6/14.
//

import UIKit
import SwiftUI
import SnapKit
import MarkdownUI

@objc
class MarkdownScreenController: ViewBaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isShowHeader = false
        
        // 创建SwiftUI视图
        let swiftUIView = UIHostingController(rootView: ContentView())
        
        // 添加SwiftUI视图到当前控制器
        addChild(swiftUIView)
        view.addSubview(swiftUIView.view)
        
        // 使用SnapKit设置约束
        swiftUIView.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        swiftUIView.didMove(toParent: self)
    }
}

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var displayedText: String = ""
    @State private var isTyping: Bool = false
    
    let fullText = """
    # Markdown 完整示例展示

    ## 1. 基础文本格式

    这是一段普通文本，包含**粗体**、*斜体*和***粗斜体***。
    还可以使用~~删除线~~和`行内代码`。

    ## 2. 链接与引用

    [访问 GitHub](https://github.com)

    > 这是一段引用文本
    > 多行引用效果
    >> 嵌套引用示例

    ## 3. 列表展示

    ### 无序列表：
    - 苹果 🍎
        - 红富士
        - 青苹果
    - 香蕉 🍌
    - 橙子 🍊

    ### 有序列表：
    1. 第一步
    2. 第二步
        1. 子步骤 1
        2. 子步骤 2
    3. 第三步

    ## 4. 代码展示

    ```swift
    func hello() {
        print("Hello, Markdown!")
    }
    ```

    ## 5. 表格示例

    | 功能 | 基础版 | 专业版 | 企业版 |
    |------|--------|--------|--------|
    | 在线编辑 | ✅ | ✅ | ✅ |
    | 历史记录 | ❌ | ✅ | ✅ |
    | 团队协作 | ❌ | ❌ | ✅ |
    | 价格/月 | $0 | $9.9 | $29.9 |

    ## 6. 任务列表

    - [x] 已完成任务
    - [ ] 待办任务
    - [ ] 进行中的任务

    ## 7. 分割线

    ---

    ## 8. 图片示例
    ![Markdown Logo](https://markdown-here.com/img/icon256.png)

    ## 9. 数学公式
    当 $a \\ne 0$ 时，一元二次方程 $ax^2 + bx + c = 0$ 的解为：
    $$ x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a} $$
    """
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                Markdown {
                    displayedText
                }
                .markdownTheme(.gitHub)
            }
            .padding()
            .onAppear {
                startTypingAnimation()
            }
        }
    }
    
    private func startTypingAnimation() {
        guard !isTyping else { return }
        isTyping = true
        displayedText = ""
        
        var currentIndex = fullText.startIndex
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            if currentIndex < fullText.endIndex {
                displayedText.append(String(fullText[currentIndex]))
                currentIndex = fullText.index(after: currentIndex)
            } else {
                timer.invalidate()
                isTyping = false
            }
        }
    }
}
