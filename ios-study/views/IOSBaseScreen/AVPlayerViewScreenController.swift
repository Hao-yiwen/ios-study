//
//  AVPlayerViewController.swift
//  ios-study
//
//  Created by yw.hao on 2024/6/15.
//

import UIKit
import AVKit

@objc
class AVPlayerViewScreenController:UIViewController,AVPlayerViewControllerDelegate {
    @IBOutlet weak var videoallscreen: UIButton!
    var playerViewControllerIfLoaded:AVPlayerViewController!
    var playerViewControllerInline:AVPlayerViewController!
    var avPlayer:AVPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
    }
    
    private func loadPlayerViewControllerIfNeeded() {
        // 新开一个viewcontroller播放
        print("loadPlayerViewControllerIfNeeded")
        if playerViewControllerIfLoaded == nil {
            playerViewControllerIfLoaded = AVPlayerViewController()
            guard let playerViewController = playerViewControllerIfLoaded else { return }
            guard let videoURL = URL(string: "https://media.w3.org/2010/05/sintel/trailer.mp4") else { return  }
            let playerItem = AVPlayerItem(url: videoURL)
            let player = AVPlayer(playerItem: playerItem)
            playerViewController.player = player
            playerViewController.delegate = self
            
            present(playerViewController, animated: true) {
                player.play()
            }
        }
    }
    
    @IBAction func handleAllScreenVideo(_ sender: Any) {
        loadPlayerViewControllerIfNeeded()
    }
    
    func setupVideoPlayer(){
        guard let videoURL = URL(string: "https://media.w3.org/2010/05/sintel/trailer.mp4") else { return  }
        avPlayer = AVPlayer(url: videoURL)
        playerViewControllerInline = AVPlayerViewController()
        playerViewControllerInline.player = avPlayer
        playerViewControllerInline.view.backgroundColor = .black
        
        self.addChild(playerViewControllerInline)
        self.view.addSubview(playerViewControllerInline.view)
        playerViewControllerInline.didMove(toParent: self)
        playerViewControllerInline.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playerViewControllerInline.view.topAnchor.constraint(equalTo: videoallscreen.bottomAnchor, constant: 20),
            playerViewControllerInline.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerViewControllerInline.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playerViewControllerInline.view.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
    }
}
