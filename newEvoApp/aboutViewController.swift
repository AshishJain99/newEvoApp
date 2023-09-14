//
//  aboutViewController.swift
//  newEvoApp
//
//  Created by Ashish Jain on 07/09/23.
//

import UIKit

class aboutViewController: UIViewController {
    let backButton:UIButton = {
        let button = UIButton()
        //  button.backgroundColor = .white
        button.setImage(UIImage(named: "leftArrowButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        return button
    }()
    
    let backgroundImageView:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "BackG")
        
        return image
    }()
    
    let connectionView:UIView={
        let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        //view.contentMode = .scaleAspectFit
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()
    
    let conncetionViewImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_ConnectionGuide")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let connectionViewLabel:UILabel={
        let label = UILabel()
        label.text = "Connections Guide"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let userGuideView:UIView={
        let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()
    
    let userGuideViewImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_UserGuide")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let userGuideLabel:UILabel={
        let label = UILabel()
        label.text = "User Guide"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    
    let gettingStartedView:UIView={
        let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()
    
    let gettingStartedViewImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_gettingStarted")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let gettinStartedLabel:UILabel={
        let label = UILabel()
        label.text = "Getting Started"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let aboutUsView:UIView={
        let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()
    
    let aboutUsImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_AboutUs")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let aboutUsLabel:UILabel={
        let label = UILabel()
        label.text = "About Us"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let referEarnView:UIView={
        let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()
    
    let referEarnImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_ReferEarn")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let referEarnLabel:UILabel={
        let label = UILabel()
        label.text = "Refer & Earn"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let contactUsView:UIView={
        let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()
    
    let contactUsImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_ContectUs")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let contactUsLabel:UILabel={
        let label = UILabel()
        label.text = "Contact Us"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let gettingStartedTapGesture = UITapGestureRecognizer(target: self, action: #selector(gettingStartedTapped(_:)))
        gettingStartedView.isUserInteractionEnabled = true
        gettingStartedView.addGestureRecognizer(gettingStartedTapGesture)
        
        
        let contactUsGesture = UITapGestureRecognizer(target: self, action: #selector(contactUsTapped(_:)))
        contactUsView.isUserInteractionEnabled = true
        contactUsView.addGestureRecognizer(contactUsGesture)
        
        let referGesture = UITapGestureRecognizer(target: self, action: #selector(referTapped(_:)))
        referEarnView.isUserInteractionEnabled = true
        referEarnView.addGestureRecognizer(referGesture)
        
        let aboutUsGesture = UITapGestureRecognizer(target: self, action: #selector(aboutUsTapped(_:)))
        aboutUsView.isUserInteractionEnabled = true
        aboutUsView.addGestureRecognizer(aboutUsGesture)
        
        
        let connectionGesture = UITapGestureRecognizer(target: self, action: #selector(connectionGuideTapped(_:)))
        connectionView.isUserInteractionEnabled = true
        connectionView.addGestureRecognizer(connectionGesture)
        
        let userGesture = UITapGestureRecognizer(target: self, action: #selector(userGuideTapped(_:)))
        userGuideView.isUserInteractionEnabled = true
        userGuideView.addGestureRecognizer(userGesture)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        let viewHeight = view.frame.height
        let viewWidth = view.frame.width
        
        let containerHeight = viewHeight*0.27
        let containerWidth = viewWidth*0.22
        
        let buttonWidth = view.frame.width * 0.05
        
        backButton.frame = CGRect(x: 20, y: 20, width: buttonWidth, height: buttonWidth)
        
        gettingStartedView.frame = CGRect(x: viewWidth*0.1, y: viewHeight*0.25, width: containerWidth, height: containerHeight)
        connectionView.frame = CGRect(x: gettingStartedView.frame.maxX+viewWidth*0.1, y: viewHeight*0.25, width: containerWidth, height: containerHeight)
        userGuideView.frame = CGRect(x: connectionView.frame.maxX+viewWidth*0.1, y: viewHeight*0.25, width: containerWidth, height: containerHeight)
        
        //         = CGRect(x: userGuideView.frame.maxX+viewWidth*0.1, y: viewHeight*0.25, width: containerWidth, height: containerHeight)
        
        //        CGRect(x: viewWidth*0.1, y: viewHeight*0.25, width: containerWidth, height: containerHeight)
        
        
        aboutUsView.frame = CGRect(x: gettingStartedView.frame.minX, y: gettingStartedView.frame.maxY+viewHeight*0.15, width: containerWidth, height: containerHeight)
        referEarnView.frame = CGRect(x: connectionView.frame.minX, y: connectionView.frame.maxY+viewHeight*0.15, width: containerWidth, height: containerHeight)
        contactUsView.frame = CGRect(x: userGuideView.frame.minX, y: userGuideView.frame.maxY+viewHeight*0.15, width: containerWidth, height: containerHeight)
        
        //
        
        conncetionViewImage.bounds = CGRect(x: 0, y: 0, width: connectionView.frame.width*0.7, height: connectionView.frame.height*0.5)
        conncetionViewImage.center = CGPoint(x: connectionView.bounds.midX, y: connectionView.bounds.midY*0.9)
        connectionViewLabel.bounds = CGRect(x: 0, y: 0, width: connectionView.frame.width * 0.7, height: connectionView.frame.height * 0.2)
        connectionViewLabel.center = CGPoint(x: connectionView.bounds.midX, y: conncetionViewImage.frame.maxY + (connectionViewLabel.bounds.height / 2) * 1.15)
        
        userGuideViewImage.bounds = CGRect(x: 0, y: 0, width: userGuideView.frame.width*0.7, height: userGuideView.frame.height*0.5)
        userGuideViewImage.center = CGPoint(x: userGuideView.bounds.midX, y: userGuideView.bounds.midY*0.9)
        userGuideLabel.bounds = CGRect(x: 0, y: 0, width: userGuideView.frame.width * 0.7, height: userGuideView.frame.height * 0.2)
        userGuideLabel.center = CGPoint(x: userGuideView.bounds.midX, y: userGuideViewImage.frame.maxY + (userGuideLabel.bounds.height / 2) * 1.15)
        
        gettingStartedViewImage.bounds = CGRect(x: 0, y: 0, width: gettingStartedView.frame.width*0.7, height: gettingStartedView.frame.height*0.5)
        gettingStartedViewImage.center = CGPoint(x: gettingStartedView.bounds.midX, y: gettingStartedView.bounds.midY*0.9)
        gettinStartedLabel.bounds = CGRect(x: 0, y: 0, width: gettingStartedView.frame.width * 0.7, height: gettingStartedView.frame.height * 0.2)
        gettinStartedLabel.center = CGPoint(x: gettingStartedView.bounds.midX, y: gettingStartedViewImage.frame.maxY + (gettinStartedLabel.bounds.height / 2) * 1.15)
        
        
        aboutUsImage.bounds = CGRect(x: 0, y: 0, width: aboutUsView.frame.width*0.7, height: aboutUsView.frame.height*0.5)
        aboutUsImage.center = CGPoint(x: aboutUsView.bounds.midX, y: aboutUsView.bounds.midY*0.9)
        aboutUsLabel.bounds = CGRect(x: 0, y: 0, width: aboutUsView.frame.width * 0.7, height: aboutUsView.frame.height * 0.2)
        aboutUsLabel.center = CGPoint(x: aboutUsView.bounds.midX, y: aboutUsImage.frame.maxY + (aboutUsLabel.bounds.height / 2) * 1.15)
        
        referEarnImage.bounds = CGRect(x: 0, y: 0, width: referEarnView.frame.width*0.7, height: referEarnView.frame.height*0.5)
        referEarnImage.center = CGPoint(x: referEarnView.bounds.midX, y: referEarnView.bounds.midY*0.9)
        referEarnLabel.bounds = CGRect(x: 0, y: 0, width: referEarnView.frame.width * 0.7, height: referEarnView.frame.height * 0.2)
        referEarnLabel.center = CGPoint(x: referEarnView.bounds.midX, y: referEarnImage.frame.maxY + (referEarnLabel.bounds.height / 2) * 1.15)
        
        contactUsImage.bounds = CGRect(x: 0, y: 0, width: referEarnView.frame.width*0.7, height: referEarnView.frame.height*0.5)
        contactUsImage.center = CGPoint(x: referEarnView.bounds.midX, y: referEarnView.bounds.midY*0.9)
        contactUsLabel.bounds = CGRect(x: 0, y: 0, width: referEarnView.frame.width * 0.7, height: referEarnView.frame.height * 0.2)
        contactUsLabel.center = CGPoint(x: referEarnView.bounds.midX, y: referEarnImage.frame.maxY + (referEarnLabel.bounds.height / 2) * 1.15)
        
        print(connectionView.center)
        
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.frame = view.bounds
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        view.addSubview(connectionView)
        connectionView.addSubview(conncetionViewImage)
        connectionView.addSubview(connectionViewLabel)
        
        view.addSubview(userGuideView)
        userGuideView.addSubview(userGuideViewImage)
        userGuideView.addSubview(userGuideLabel)
        
        view.addSubview(gettingStartedView)
        gettingStartedView.addSubview(gettingStartedViewImage)
        gettingStartedView.addSubview(gettinStartedLabel)
        
        view.addSubview(aboutUsView)
        aboutUsView.addSubview(aboutUsImage)
        aboutUsView.addSubview(aboutUsLabel)
        
        view.addSubview(referEarnView)
        referEarnView.addSubview(referEarnImage)
        referEarnView.addSubview(referEarnLabel)
        
        view.addSubview(contactUsView)
        contactUsView.addSubview(contactUsImage)
        contactUsView.addSubview(contactUsLabel)
        
        view.addSubview(backButton)
    }
    
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: false)
    }
    
    
    @objc func gettingStartedTapped(_ sender: UITapGestureRecognizer) {
        // Handle the tap gesture here
        print("gettinStartedTapped")
//        if let url = URL(string: "https://www.amkette.com/pages/evofox-one-gamepad") {
//            UIApplication.shared.open(url)
//        }
        // Instantiate the view controller from the storyboard
//        let yourViewController = storyboard?.instantiateViewController(withIdentifier: "Onboarding1ViewController")
//
//        // Create a navigation controller with your view controller as the root view controller
//        let navigationController = UINavigationController(rootViewController: yourViewController!)
//
//        // Present the navigation controller
//        self.present(navigationController, animated: true, completion: nil)
        
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "Onboarding1ViewController") {
            navigationController?.setViewControllers([nextViewController], animated: true)
        }

    }
    @objc func contactUsTapped(_ sender: UITapGestureRecognizer) {
        // Handle the tap gesture here
        print("contactUsTapped")
        
        if let url = URL(string: "https://api.whatsapp.com/send?phone=+919312691448&text=Hello") {
            UIApplication.shared.open(url)
        }
        
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "ComingSoonViewController") as? ComingSoonViewController {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
        
        
    }
    @objc func referTapped(_ sender: UITapGestureRecognizer) {
        // Handle the tap gesture here
        print("referTapped")
        //        if let url = URL(string: "https://www.example.com") {
        //            UIApplication.shared.open(url)
        //        }
        
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "ComingSoonViewController") as? ComingSoonViewController {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
        
    }
    @objc func aboutUsTapped(_ sender: UITapGestureRecognizer) {
        // Handle the tap gesture here
        print("aboutUsTapped")
        if let url = URL(string: "https://www.amkette.com/evofoxdojo/aboutus") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func userGuideTapped(_ sender: UITapGestureRecognizer) {
        // Handle the tap gesture here
        print("userGuideTapped")
        if let url = URL(string: "https://cdn.shopify.com/s/files/1/0676/1273/7846/files/EvoFox_One_EvoFoxGo_Merged_User_Guide.pdf?v=1693547451") {
            UIApplication.shared.open(url)
        }
    }
    @objc func connectionGuideTapped(_ sender: UITapGestureRecognizer) {
        // Handle the tap gesture here
        print("connectionGuideTapped")
        //        if let url = URL(string: "https://www.example.com") {
        //            UIApplication.shared.open(url)
        //        }
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "connectionGuideViewController") as? connectionGuideViewController {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "connectionGuideViewController") {
            navigationController?.setViewControllers([nextViewController], animated: true)
        }
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
