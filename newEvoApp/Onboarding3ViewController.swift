//
//  Onboarding3ViewController.swift
//  newEvoApp
//
//  Created by Ashish Jain on 07/09/23.
//

import UIKit

class Onboarding3ViewController: UIViewController {
    
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!

    @IBOutlet weak var continueView:UIView!
    
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(continueViewPressed))
        continueView.addGestureRecognizer(tapGesture)
        
        // Do any additional setup after loading the view.
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if deviceType == .pad{
            buttonHeight.constant = 50
        }else{
            buttonHeight.constant = 46
        }
    }
    
    @objc func continueViewPressed(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
//            var viewControllers = self.navigationController?.viewControllers ?? []
//            viewControllers.removeLast()  // Remove the current LaunchViewController
//            viewControllers.append(nextViewController)  // Add the new ViewController
//            self.navigationController?.setViewControllers(viewControllers, animated: true)
//        }
        
        UserDefaults.standard.set(true, forKey: "onboardingCompleted")

        
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") {
            navigationController?.setViewControllers([nextViewController], animated: true)
        }
    }
    
    deinit{
        print("On 3 removed")
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
