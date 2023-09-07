//
//  Onboarding1ViewController.swift
//  newEvoApp
//
//  Created by Ashish Jain on 07/09/23.
//

import UIKit

class Onboarding1ViewController: UIViewController {
    
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!
    
    @IBOutlet weak var continueView:UIView!
    
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(continueViewPressed))
        continueView.addGestureRecognizer(tapGesture)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        print(view.frame.height)
//        print("")
        
        
        if deviceType == .pad{
            buttonHeight.constant = view.frame.height/13
        }else{
            buttonHeight.constant = view.frame.height/10
        }
        
    }

    @objc func continueViewPressed(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "Onboarding3ViewController") as? Onboarding3ViewController {
//            var viewControllers = self.navigationController?.viewControllers ?? []
//            viewControllers.removeLast()  // Remove the current LaunchViewController
//            viewControllers.append(nextViewController)  // Add the new ViewController
//            self.navigationController?.setViewControllers(viewControllers, animated: true)
//        }
        
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "Onboarding2ViewController") {
            navigationController?.setViewControllers([nextViewController], animated: true)
        }

    }
    
    deinit{
        print("On 1 removed")
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
