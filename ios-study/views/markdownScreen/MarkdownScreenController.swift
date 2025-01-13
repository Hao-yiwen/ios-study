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
import Splash

struct SplashCodeSyntaxHighlighter: CodeSyntaxHighlighter {
    private let syntaxHighlighter: SyntaxHighlighter<AttributedStringOutputFormat>
    
    init(theme: Splash.Theme) {
        self.syntaxHighlighter = SyntaxHighlighter(format: AttributedStringOutputFormat(theme: theme))
    }
    
    func highlightCode(_ content: String, language: String?) -> Text {
        guard language != nil else {
            return Text(content)
        }
        
        return Text(AttributedString(self.syntaxHighlighter.highlight(content)))
    }
}

extension CodeSyntaxHighlighter where Self == SplashCodeSyntaxHighlighter {
    static func splash(theme: Splash.Theme) -> Self {
        SplashCodeSyntaxHighlighter(theme: theme)
    }
}

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

    ### Swift 示例
    ```swift
    class Person {
        var name: String
        var age: Int
        
        init(name: String, age: Int) {
            self.name = name
            self.age = age
        }
        
        func introduce() -> String {
            return "Hi, I'm \\(name) and I'm \\(age) years old."
        }
        
        func celebrate() {
            age += 1
            print("Happy birthday! Now I'm \\(age)!")
        }
    }

    let person = Person(name: "Alice", age: 25)
    print(person.introduce())
    person.celebrate()
    ```

    ### JavaScript 示例
    ```javascript
    class TodoList {
        constructor() {
            this.todos = [];
        }
        
        addTodo(title) {
            const todo = {
                id: Date.now(),
                title,
                completed: false
            };
            this.todos.push(todo);
            return todo;
        }
        
        toggleTodo(id) {
            const todo = this.todos.find(t => t.id === id);
            if (todo) {
                todo.completed = !todo.completed;
            }
            return todo;
        }
        
        deleteTodo(id) {
            const index = this.todos.findIndex(t => t.id === id);
            if (index !== -1) {
                return this.todos.splice(index, 1)[0];
            }
            return null;
        }
        
        getCompletedTodos() {
            return this.todos.filter(todo => todo.completed);
        }
    }

    // 使用示例
    const todoList = new TodoList();
    todoList.addTodo("学习 JavaScript");
    todoList.addTodo("写代码");
    console.log(todoList.todos);
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
    
    private var theme: Splash.Theme {
        switch colorScheme {
        case .dark:
            return .wwdc17(withFont: .init(size: 16))
        default:
            return .sunset(withFont: .init(size: 16))
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                Markdown {
                    displayedText
                }
                .markdownTheme(.gitHub)
                .markdownCodeSyntaxHighlighter(.splash(theme: theme))
                .markdownBlockStyle(\.codeBlock) { configuration in
                    VStack(spacing: 0) {
                        HStack {
                            Text(configuration.language ?? "plain text")
                                .font(.system(.caption, design: .monospaced))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(theme.plainTextColor))
                            Spacer()
                            
                            Button(action: {
                                UIPasteboard.general.string = configuration.content
                                // 可以添加复制成功的提示
                            }) {
                                HStack {
                                    Image(systemName: "doc.on.doc")
                                    Text("复制")
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background {
                            Color(theme.backgroundColor)
                        }
                        
                        Divider()
                        
                        ScrollView(.horizontal) {
                            configuration.label
                                .relativeLineSpacing(.em(0.25))
                                .markdownTextStyle {
                                    FontFamilyVariant(.monospaced)
                                    FontSize(.em(0.85))
                                }
                                .padding()
                        }
                    }
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .markdownMargin(top: .zero, bottom: .em(0.8))
                }
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
