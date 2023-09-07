//
//  ConnectionGuideVideoViewController.swift
//  newEvoApp
//
//  Created by Ashish Jain on 07/09/23.
//

import UIKit
import AVFoundation

class ConnectionGuideVideoViewController: UIViewController {

    @IBOutlet weak var videoPlayerView: UIView!
    @IBOutlet weak var backButtonView: UIView!
    
    @IBOutlet weak var settingButtonView: UIView!
    var player = AVPlayer()
    var EvoGO = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let backButtonTap = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButtonView.addGestureRecognizer(backButtonTap)
        
        let settingButtonTap = UITapGestureRecognizer(target: self, action: #selector(settingsButtonTapped))
        settingButtonView.addGestureRecognizer(settingButtonTap)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if EvoGO == true{
            let videoURL = Bundle.main.url(forResource: "evoGoVideo", withExtension: "mp4")!
            player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = videoPlayerView.bounds
            playerLayer.videoGravity = .resizeAspectFill // This will make it resemble contentMode of UIImageView
            videoPlayerView.layer.addSublayer(playerLayer)
            player.play()
        }else{
            let videoURL = Bundle.main.url(forResource: "evoOneVideo", withExtension: "mp4")!
            player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = videoPlayerView.bounds
            playerLayer.videoGravity = .resizeAspectFill // This will make it resemble contentMode of UIImageView
            videoPlayerView.layer.addSublayer(playerLayer)
            player.play()
        }
        
        
    }
    
    @objc func settingsButtonTapped(){
            if let url = URL(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
    }


    
    
    @objc func backButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
