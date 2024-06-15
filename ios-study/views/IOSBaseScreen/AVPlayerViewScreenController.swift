//
//  AVPlayerViewController.swift
//  ios-study
//
//  Created by yw.hao on 2024/6/15.
//

import UIKit
import AVKit

class AVPlayerViewScreenController:UIViewController,AVPlayerViewControllerDelegate {
    var playerViewControllerIfLoaded:AVPlayerViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPlayerViewControllerIfNeeded()
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
}
