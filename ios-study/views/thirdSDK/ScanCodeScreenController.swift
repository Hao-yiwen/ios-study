//
//  ScanCodeScreen.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/14.
//

import UIKit
import AVFoundation

class ScanCodeScreenController: ViewBaseController {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var qrString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isShowHeader = false
        view.backgroundColor = .black
        
        // 建立一个会话
        captureSession = AVCaptureSession()
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.setupCaptureSession()
        }
    }
    
    func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            failed()
            return
        }

        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            DispatchQueue.main.async {
                self.failed()
            }
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            DispatchQueue.main.async {
                self.failed()
            }
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            DispatchQueue.main.async {
                self.failed()
            }
            return
        }

        DispatchQueue.main.async {
            self.setupPreviewLayer()
        }
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
    }
    
    func setupPreviewLayer() {
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        // 在扫码页面上面加上矩形框 看起来更像扫码页面 将矩形框放在相机上面
        let rect = CGRect(x: 50, y: 200, width: 300, height: 300)
        let rectLayer = CAShapeLayer()
        rectLayer.frame = rect
        rectLayer.borderColor = UIColor.green.cgColor
        rectLayer.borderWidth = 2
        rectLayer.backgroundColor = .none
        view.layer.addSublayer(rectLayer)
        // 绿色方框歪的部分添加半透明效果
        let maskLayer = CAShapeLayer()
        maskLayer.frame = view.bounds
        maskLayer.fillColor = UIColor.black.withAlphaComponent(0.5).cgColor
        let path = UIBezierPath(rect: view.bounds)
        path.append(UIBezierPath(rect: rect).reversing())
        maskLayer.path = path.cgPath
        view.layer.addSublayer(maskLayer)
        
    }
    
    func failed(){
        let ac = UIAlertController(title: "扫码不支持", message: "当前设备不支持扫码", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "好的", style: .default,handler: {_ in 
            self.navigationController?.popViewController(animated: true)
        }))
        captureSession = nil
        DispatchQueue.main.async {
            self.present(ac, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

        if (captureSession?.isRunning == false) {
            DispatchQueue.global(qos: .userInitiated).async {
                self.captureSession.startRunning()
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (captureSession?.isRunning == true) {
            DispatchQueue.global(qos: .userInitiated).async {
                self.captureSession.stopRunning()
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.stopRunning()
        }

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
//            轻微震动
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }

        dismiss(animated: true)
    }

    func found(code: String) {
        print("Found code: \(code)")
        qrString = code
        // 在主线程上显示警告框并退出当前页面
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "扫码结果", message: code, preferredStyle: .alert)
            // 将扫码结果存储到键值对
            UserDefaults.standard.set(code, forKey: "qrCode")
            // 将扫码结果存储到codedata
            let qrcode = Qrcode(context: CoreDataStack.shared.viewContext)
            qrcode.qrcode = code
            qrcode.describe = self.getNowString()
            if(!DataStoreUtils.isHaveQrcode(qrCode: qrcode)){
                DataStoreUtils.saveQrCode(qrcode: qrcode)
            }
            NotificationCenter.default.post(name: NSNotification.Name("qrcode"), object: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        if (self.view.window == nil) {
            self.view = nil
        }
    }
}

extension ScanCodeScreenController: AVCaptureMetadataOutputObjectsDelegate {
    func getNowString() -> String{
        // 获取当前日期和时间
        let now = Date()
        // 创建日期格式化器
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        // 将日期格式化为字符串
        return dateFormatter.string(from: now)
    }
}
