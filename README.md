# ios-study

[![Platform](https://img.shields.io/badge/platform-iOS%2016%2B-000000)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.0-F05138?logo=swift&logoColor=white)](https://www.swift.org/)
[![React Native](https://img.shields.io/badge/React%20Native-0.74.2-61DAFB?logo=react&logoColor=white)](https://reactnative.dev/)
[![Flutter](https://img.shields.io/badge/Flutter-module%203.13.9-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)

个人 iOS 学习工程：用一个宿主 App 把 UIKit、SwiftUI、React Native、Flutter、系统框架和若干第三方库放在一起对照练习。仓库里是可运行的示例页面和学习记录，并附带 fastlane 打包脚本；它不是面向用户的独立产品。

首页（Storyboard 标题「大首页」）提供链接输入、扫码、扫码历史，以及进入各练习模块的入口。页面之间的跳转走通知 `URLHANDLE`：`http` 链接交给 `WKWebView`，带 `isRN=true` 的地址交给 React Native 容器，`yiwen://app?moduleName=...` 按 `ViewControllerConfig.json` 映射到指定控制器。

## 已有内容

### 宿主首页

- 输入链接并跳转；结果写入 `UserDefaults`，扫码内容记入 Core Data 实体 `Qrcode`
- 相机扫码（`AVCaptureSession`），以及扫码历史列表
- 入口：iOS 基础、SwiftUI 模块、RN 模块、Flutter 模块、第三方 SDK、Markdown 流式渲染
- 「rn模块」按钮固定打开包内资源 `xrn_0741.jsbundle`

### iOS 基础（`ios-study/views/IOSBaseScreen`）

Storyboard 与代码里已有这些示例页：

| 页面 | 内容 |
| --- | --- |
| 多个 view 居中对齐 | 约束布局 |
| 委托模式 | 上下两个子控制器通过 delegate 通信 |
| 计算测试 | 两个整数相加 |
| XIB | 本工程 XIB，以及来自 `TestModule` 的 XIB |
| 视频播放 | `AVPlayer` 全屏示例 |
| 跳转测试 | `NavigationTest.storyboard` |
| z 轴遮挡 | 两个视图互相覆盖的两种写法 |
| Core Data | 存取 `Person`，以及键值对读写 |
| WKWebView | 打开网页 |
| 键盘隐藏 | 点击空白收起键盘 |
| 通知 | `NotificationViewController` |
| ViewModel | Objective-C 的 `User` / `UserViewModel` |

### SwiftUI 模块（`SwiftUIModule`）

本地 CocoaPod。`SwiftUIController` 嵌入 `SwiftSimpleView`：一个标题为 “SwiftUI List” 的列表，点进 `DetailDemo`。

### React Native

宿主使用 React Native **0.74.2**（Hermes 开启），容器是 `RNScreenController`。

- 开发地址形如 `http://127.0.0.1:8081/index.bundle?platform=ios`
- 包内静态包：`ios-study/rn_weapp/rnDemo0742.jsbundle`、`ios-study/rn_weapp/xrn_0741.jsbundle`（已加入 App 资源）
- 根目录另有一份 `main.jsbundle`，**没有**加入 Xcode 资源
- 原生模块：`CalendarModule.createCalendarEvent`（只打日志）、`URL.openURL`（转发到 `URLHANDLE`）
- 仓库里没有 `index.js`、`App.js` 或 Metro 配置，JS 业务源码不在本仓库

`package.json` 里还声明了 `@react-navigation/native` 6.1.17、`@react-navigation/native-stack` 6.9.26、`react-native-webview` 13.10.4、`react-native-safe-area-context` 4.10.5、`react-native-screens` 3.32.0。这些版本来自 `yarn.lock`，宿主 Swift/ObjC 代码没有直接引用它们。

### Flutter 模块（`my_flutter`）

`pubspec.yaml` 中 `module` 段标明这是嵌入宿主的 Flutter module（Android 包名 `com.example.my_flutter`，iOS bundle id `com.example.myFlutter`）。`FlutterScreenController` 用未预热的 `FlutterViewController` 打开它。

Dart 页面只有两屏：`HomePage` 以横向滑入动画进入 `SecondPage`，第二页再返回。`test/widget_test.dart` 仍是 Flutter 模板里的计数器测试，和当前页面不一致。

CI 固定 Flutter **3.13.9**（`.metadata` 的 stable revision 为 `d211f42860`）。Dart SDK 约束是 `>=3.1.5 <4.0.0`。

### 第三方与系统能力（`ios-study/views/thirdSDK`）

- ScrollView 按钮示例
- 二维码扫描
- Lottie（`lottie-ios`，动画资源 `ios-study/resources/lottie/loading.json`）
- MapKit：`MapViewController` 展示地图并弹出 `MapModalViewController`

CocoaPods 里还有 `Toast-Swift`、`Toast`、`SnapKit`、`AFNetworking`、`ReactiveObjC`。Markdown 页使用 Swift Package：`swift-markdown-ui` **2.4.1**（依赖 NetworkImage 6.0.1、swift-cmark 0.5.0）和 `Splash` **0.16.0**，用来做流式 Markdown 和代码高亮。

### 小组件

`ios-study widget` 是 WidgetKit 示例。`StaticConfiguration` 在蓝色背景上显示时间；文件里另有一个带 “Favorite Emoji” 参数的 `ConfigurationAppIntent`，当前小组件配置没有使用它。

### 其他练习代码

- `ios-study/libs/MyCppProject`：C++ 静态库 `libMyCppProject.a` 与 ObjC++ 包装。首页里调用 `printMessage()` 的代码已注释
- `LemoFoundation`：`pod lib create` 生成的本地 Pod，`Classes` 只有 `.gitkeep`，没有业务实现
- `TestModule`：本地 Pod，控制器基本为空，带一份 XIB
- `mobileTest`：独立的 Express 假接口，和 iOS 工程没有编译期依赖。内存里放了三条用户数据，提供 `/` 与 `/api/users` 的增删改查；`GET /api/users` 会延迟 2 秒再返回

### 页面别名

`yiwen://app?moduleName=<key>` 的 key 定义在 `ios-study/ViewControllerConfig.json`：

| key | 控制器 |
| --- | --- |
| `homePage` | `ViewController` |
| `iosbaseHomePage` | `IOSViewController` |
| `flutterPage` | `FlutterScreenController` |
| `thirdHomePage` | `ThirdSDKHomeController` |
| `ComputePage` | `ComputeScreenController` |
| `view2page` | `View2OverSubViewController` |
| `AVPlayerPage` | `AVPlayerViewScreenController` |
| `LottiePage` | `LottieIOSScreenController` |
| `KeyboardDissmissPage` | `KeyboardDissmissController` |
| `scanHistoryController` | `QrCodeHistoryController` |

## 技术栈

| 项 | 版本 / 说明 |
| --- | --- |
| 语言 | Swift 5.0，以及 Objective-C / Objective-C++ / C++ |
| 工程 | Xcode 工程，`LastUpgradeVersion` 1510；请打开 `ios-study.xcworkspace` |
| 部署目标 | 宿主 target **iOS 16.0**；工程级配置为 17.2。`Podfile` 的 `platform` 也是 iOS 16.0。仅 iPhone（`TARGETED_DEVICE_FAMILY = 1`），手机方向为竖屏 |
| 版本号 | Marketing Version **1.0.4**，Build **14** |
| Bundle ID | Debug `com.yiwen.ios-study.debug`；Release `com.yiwen.ios-study`；Profile `com.yiwen.ios-study.profile`。小组件在对应 id 后追加 `.ios-study-widget` |
| 显示名 | 三个 App 配置的 `CFBundleDisplayName` 目前都是 `ios-study-profile` |
| React Native | 0.74.2，React 18.3.1，Hermes |
| Flutter | module，CI 使用 3.13.9 |
| CocoaPods | Gemfile 锁定 **1.14.3**（约束 `>= 1.13, < 1.15`） |
| fastlane | Gemfile.lock 中 **2.221.1** |
| 签名团队 | `84F8R9TAQN` |

`Podfile` 中写明版本范围的库：`Toast-Swift ~> 5.1.1`、`AFNetworking ~> 4.0`、`Toast ~> 4.1.1`、`SnapKit ~> 5.7.0`。`lottie-ios` 与 `ReactiveObjC` 没有锁版本。`Podfile.lock` 在 `.gitignore` 里，因此未锁版本的 Pod 会随 specs 仓库变化。

权限文案：相机、麦克风、本地网络（Flutter 调试）。`Info-*.plist` 允许任意 HTTP，并声明了 MapKit 路线模式。

## 目录结构

```text
.
├── ios-study/                 宿主源码、Storyboard、资源、Core Data、RN bundle
│   ├── views/                 各练习页面
│   ├── base/                  基类、Core Data、URL 配置、通知中心
│   ├── rnBridge/              RN 原生模块
│   ├── rn_weapp/              打进包的 jsbundle
│   └── libs/MyCppProject/     C++ 静态库与包装
├── ios-study widget/          WidgetKit 示例
├── SwiftUIModule/             本地 SwiftUI Pod 与 Example 工程
├── TestModule/                本地 Pod 与 Example 工程
├── LemoFoundation/            空的本地 Pod 模板
├── my_flutter/                Flutter module（含生成的 .ios / .android）
├── mobileTest/                Express 假接口
├── fastlane/                  打包 lane（Appfile、Matchfile、Fastfile）
├── .github/workflows/         打 tag v* 时构建并上传 IPA
├── Podfile / Gemfile          CocoaPods 与 Ruby 依赖
├── package.json / yarn.lock   React Native 依赖
└── main.jsbundle              未加入 Xcode 资源的 RN bundle
```

三个本地 Pod 自带的 `README.md` 是 `pod lib create` 模板，其中的 CocoaPods.org 徽章和安装说明并不对应本仓库的使用方式。以根目录这份说明和 `Podfile` 为准。

## 环境要求

在 macOS 上编译宿主 App，需要：

- Xcode（工程由 Xcode 15.1 升级过）与 iOS 16+ 模拟器或真机。扫码、相机、麦克风、地图定位相关页面需要真机和相应权限
- Ruby（Gemfile 要求 `>= 2.6.10`；CI 使用 **3.3.3**）以及 Bundler
- Node.js（CI 使用 **18**）和 Yarn。React Native 0.74 需要 Node 18 及以上
- Flutter **3.13.9**，与 CI 和 `.metadata` 一致。`Podfile` 会加载 `my_flutter/.ios/Flutter/podhelper.rb`，没有这份 Flutter 产物时 `pod install` 过不去
- 访问 CocoaPods specs 与 Swift Package 源（MarkdownUI、Splash）

发布 lane 还需要 fastlane match 仓库、`ios-study-api-key.json`（已在 `.gitignore`）以及 App Store Connect 密钥。账号写在 `fastlane/Appfile`，证书仓库写在 `fastlane/Matchfile`。

## 安装与运行

在仓库根目录执行。请使用 workspace，直接打开 `ios-study.xcodeproj` 缺少 Pods 与 Flutter。

```sh
cd my_flutter
flutter pub get
cd ..

yarn install
bundle install
bundle exec pod install
```

然后用 Xcode 打开 `ios-study.xcworkspace`，选择 scheme **ios-study**、配置 **Debug**，在模拟器或已配置签名的真机上运行。小组件 scheme 为 **ios-study widgetExtension**。

清理：

```sh
./clean_project.sh          # xcodebuild clean，并删除 DerivedData 与 build/
bundle exec fastlane ios clean_build
```

### 单独跑 Flutter 模块

```sh
cd my_flutter
flutter pub get
flutter run
```

这是 module 工程，`flutter run` 使用 Flutter 生成的临时宿主。嵌入主 App 时仍要回到上面的 `pod install` 流程。

### 假接口 `mobileTest`

```sh
cd mobileTest
npm ci
node index.js
```

默认监听 `5389`（可用环境变量 `PORT` 覆盖）。

| 方法 | 路径 | 行为 |
| --- | --- | --- |
| GET | `/` | 返回 `Hello World` |
| GET | `/api/users` | 约 2 秒后返回全部用户 |
| GET | `/api/users/:id` | 按 id 查询 |
| POST | `/api/users` | JSON body：`name`、`email`、`age` |
| PUT | `/api/users/:id` | 更新 |
| DELETE | `/api/users/:id` | 删除 |

数据只存在进程内存里。`index.js` 直接 `require("body-parser")`，该包没有写进 `package.json`，由 Express 4.19.2 间接带上；`npm ci` 会把它提升到顶层 `node_modules`，因此上面的启动方式可以跑通。

### 打包

需要本机签名材料和 match 仓库权限：

```sh
bundle exec fastlane ios build_debug      # development IPA，输出到 ./build/ios-study-debug.ipa
bundle exec fastlane ios build_release    # ad-hoc 打包并上传 TestFlight（会递增 build 号）
bundle exec fastlane ios increment_version
```

推送匹配 `v*` 的 tag 时，`.github/workflows/build_distribute.yml` 在 `macos-latest` 上安装 Flutter 3.13.9、Yarn、CocoaPods，执行 `fastlane build_release`，并把 IPA、dSYM 和二维码图片上传到 GitHub Release。密钥来自仓库 Secrets，不在源码里。

## 本次运行验证

当前核对环境是 Linux，已安装 Node.js **v22.23.4**、npm 10.9.9、Yarn。没有 Xcode、Flutter、Ruby、CocoaPods，因此宿主编译、`flutter pub get`、`pod install` 和 fastlane **没有**在这里执行。

已在本环境验证 `mobileTest`：

```sh
cd mobileTest && npm ci && node index.js
```

随后请求结果为：

- `GET /` → `Hello World`
- `GET /api/users/1` → `{"id":1,"name":"John Doe","email":"john@example.com","age":25}`
- `POST /api/users`（`name` / `email` / `age`）→ `201`，返回新建用户

## 备注

- 根目录 `package.json` 的 `license` 是 ISC。`SwiftUIModule`、`TestModule`、`LemoFoundation` 各自带 MIT `LICENSE`。仓库根目录没有统一的 LICENSE 文件。
- 仓库中的 PNG 是 App 图标和调试按钮图，没有界面截图。
- `my_flutter/test/widget_test.dart` 仍断言计数器从 0 变为 1，和现在的 `HomePage` 对不上，直接跑 `flutter test` 会失败。
- `LemoFoundation` 没有可调用的类；C++ `printMessage()` 在首页处于注释状态。
