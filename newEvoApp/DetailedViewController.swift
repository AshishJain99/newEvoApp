//
//  DetailedViewController.swift
//  newEvoApp
//
//  Created by Ashish Jain on 04/09/23.
//

import UIKit

class DetailedViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var bgImageV: UIImageView!
    
    @IBOutlet weak var ImageV1: UIImageView!
    @IBOutlet weak var ImageV2: UIImageView!
    @IBOutlet weak var ImageV3: UIImageView!
    @IBOutlet weak var ImageV4: UIImageView!
    
    
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var downloadButtonView: UIView!
    
    @IBOutlet weak var adultRatitngView: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var ratingsView: UIView!
    
    @IBOutlet weak var imageStackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var descriptionScrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var imageScrollViewWidthC: NSLayoutConstraint!
    @IBOutlet weak var downloadButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var descriptionInfoViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var adultRatingCountLabel: UILabel!
    @IBOutlet weak var RatingCountLabel: UILabel!
    @IBOutlet weak var priceCountLabel: UILabel!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    
    
    
    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    let getApiResponse = GetApiResponse()
    var detailedVcData:detailedVcData!
    
    
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        print(detailedVcData)
        
        // Do any additional setup after loading the view.
        setData()
        configureUI()
        headerViewHeight.constant = 50
        
        let backButtonTap = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButtonView.addGestureRecognizer(backButtonTap)
        descriptionTextView.delegate = self
        descriptionTextView.isScrollEnabled = true
        
        let downloadButtonTap = UITapGestureRecognizer(target: self, action: #selector(downloadButtonTapped))
        downloadButtonView.addGestureRecognizer(downloadButtonTap)
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if deviceType == .pad{
            imageStackViewHeight.constant = 900
            descriptionScrollViewHeight.constant = 900
            imageScrollViewWidthC.constant = 23
            downloadButtonHeight.constant = 48
            descriptionInfoViewHeight.constant = 300
        }
        
        
    }
    
    
    func configureUI(){
        downloadButtonView.layer.cornerRadius = 8
        appIcon.layer.cornerRadius = 8
        let borderWidth = 2.0
        let borderColor = UIColor.red.cgColor
        ratingsView.layer.borderWidth = borderWidth
        ratingsView.layer.borderColor = borderColor
        
        priceCountLabel.layer.borderWidth = borderWidth
        priceCountLabel.layer.borderColor = borderColor
        
        adultRatitngView.layer.borderWidth = borderWidth
        adultRatitngView.layer.borderColor = borderColor
    }
    
    @objc func backButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func downloadButtonTapped(){
        let iosLink = detailedVcData.downloadLink
//        if let appStoreURL = URL(string: "https://apps.apple.com/app/\(tempIosId)") {
        if let appStoreURL = URL(string: iosLink ?? "") {
            UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
            print(appStoreURL)
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


extension DetailedViewController{
    func setData(){
        let data = detailedVcData
        let imgUrlArray:[String?] = [data?.image1Url,data?.image2Url,data?.image3Url,data?.image4Url]
        
        gameNameLabel.text = data?.appName
        adultRatingCountLabel.text = data?.adultRaiting
        RatingCountLabel.text = data?.appRating
        if let price = data?.price{
            priceCountLabel.text = price+" ₹"
        }
        descriptionTextView.text = data?.description
        
        if let bgImg = data?.bgImg{
            bgImageV.image = bgImg
        }
        
        
        
        //        getApiResponse
        getApiResponse.getImageFromString(url: data?.appIconUrl ?? "") { [weak self] image in
            guard let self = self else{
                return
            }
            self.appIcon.image = image
        }
        
        
        for imageUrlString in imgUrlArray {
            getApiResponse.getImageFromString(url: imageUrlString ?? "") {[weak self] image in
                guard let self = self else{
                    return
                }
                if ImageV1.image == nil{
                    ImageV1.image = image
                }else if ImageV2.image == nil{
                    ImageV2.image = image
                }else if ImageV3.image == nil{
                    ImageV3.image = image
                }else if ImageV4.image == nil{
                    ImageV4.image = image
                }
            }
            
        }
    }
}
