//
//  LaunchViewController.swift
//  newEvoApp
//
//  Created by Ashish Jain on 07/09/23.
//

import UIKit
import AVFoundation


class LaunchViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var videoView:UIView!
    
    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        if let gifURL = Bundle.main.url(forResource: "splash", withExtension: "gif") {
        //            ImageView.sd_setImage(with: gifURL)
        //        }
        
        
        
        //        DispatchQueue.main.asyncAfter(deadline: .now()+2){
        //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //
        //            if let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
        //                var viewControllers = self.navigationController?.viewControllers ?? []
        //                viewControllers.removeLast()  // Remove the current LaunchViewController
        //                viewControllers.append(nextViewController)  // Add the new ViewController
        //                self.navigationController?.setViewControllers(viewControllers, animated: true)
        //            }
        //
        //        }
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        NetworkMonitor.shared.startMonitoring()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let videoURL = Bundle.main.url(forResource: "splashV", withExtension: "mp4")!
        player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = videoView.frame
        playerLayer.videoGravity = .resizeAspectFill // This will make it resemble contentMode of UIImageView
        videoView.layer.addSublayer(playerLayer)
        player.play()
    }
    
    @objc func videoDidEnd(notification: Notification) {
        // Handle the video end event
        //        print("Video playback ended.")
        //
        //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //
        //        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "Onboarding1ViewController") as? Onboarding1ViewController {
        //            var viewControllers = self.navigationController?.viewControllers ?? []
        //            viewControllers.removeLast()  // Remove the current LaunchViewController
        //            viewControllers.append(nextViewController)  // Add the new ViewController
        //            self.navigationController?.setViewControllers(viewControllers, animated: true)
        //        }
        
        //
        //        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "Onboarding1ViewController") {
        //            navigationController?.setViewControllers([nextViewController], animated: true)
        //        }
        //
        
        //        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "Onboarding2ViewController") {
        //            navigationController?.setViewControllers([nextViewController], animated: true)
        //        }
        
        if UserDefaults.standard.bool(forKey: "onboardingCompleted") {
            if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") {
                navigationController?.setViewControllers([nextViewController], animated: true)
            }
        } else {
            if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "Onboarding1ViewController") {
                navigationController?.setViewControllers([nextViewController], animated: true)
            }
        }
        
        
    }
    
    
    deinit{
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
        
        print("")
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
