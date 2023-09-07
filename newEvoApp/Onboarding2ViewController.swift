//
//  Onboarding2ViewController.swift
//  newEvoApp
//
//  Created by Ashish Jain on 07/09/23.
//

import UIKit
import SDWebImage

class Onboarding2ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var continueView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let gifURL = Bundle.main.url(forResource: "phone_setup_guideNew", withExtension: "gif") {
            imageView.sd_setImage(with: gifURL)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(continueViewPressed))
        continueView.addGestureRecognizer(tapGesture)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func continueViewPressed(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "Onboarding3ViewController") as? Onboarding3ViewController {
            var viewControllers = self.navigationController?.viewControllers ?? []
            viewControllers.removeLast()  // Remove the current LaunchViewController
            viewControllers.append(nextViewController)  // Add the new ViewController
            self.navigationController?.setViewControllers(viewControllers, animated: true)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
