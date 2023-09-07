//
//  connectionGuideViewController.swift
//  newEvoApp
//
//  Created by Ashish Jain on 07/09/23.
//

import UIKit

class connectionGuideViewController: UIViewController {

    @IBOutlet weak var evoOneButtonView: UIView!
    @IBOutlet weak var evoGoButtonView: UIView!
    @IBOutlet weak var backButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let evoOneButtonTap = UITapGestureRecognizer(target: self, action: #selector(evoOneButtonTapped))
        evoOneButtonView.addGestureRecognizer(evoOneButtonTap)
        
        let evoGoButtonTap = UITapGestureRecognizer(target: self, action: #selector(evoGoButtonTapped))
        evoGoButtonView.addGestureRecognizer(evoGoButtonTap)
        
        let backButtonTap = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButtonView.addGestureRecognizer(backButtonTap)
    }
    

    @objc func evoOneButtonTapped(){
        print("")
        if let nextViewController = storyboard!.instantiateViewController(withIdentifier: "ConnectionGuideVideoViewController") as? ConnectionGuideVideoViewController {
            
            nextViewController.EvoGO = false
            
            // Push the new view controller onto the navigation stack
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        
    }
    
    @objc func evoGoButtonTapped(){
        print("")
        
        
        if let nextViewController = storyboard!.instantiateViewController(withIdentifier: "ConnectionGuideVideoViewController") as? ConnectionGuideVideoViewController {
            
//            nextViewController.EvoGO = false
            
            // Push the new view controller onto the navigation stack
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        
    }
    
    @objc func backButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
