//
//  DetailedViewController.swift
//  newEvoApp
//
//  Created by Ashish Jain on 04/09/23.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var bgImageV: UIImageView!
    
    @IBOutlet weak var ImageV1: UIImageView!
    @IBOutlet weak var ImageV2: UIImageView!
    @IBOutlet weak var ImageV3: UIImageView!
    @IBOutlet weak var ImageV4: UIImageView!
    
    
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var downloadButtonView: UIView!
    
    
    @IBOutlet weak var adultRatingCountLabel: UILabel!
    @IBOutlet weak var RatingCountLabel: UILabel!
    @IBOutlet weak var priceCountLabel: UILabel!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    
    var detailedVcData:detailedVcData!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print(detailedVcData)
        
        // Do any additional setup after loading the view.
        setData()
    }
    
    
    

}


extension DetailedViewController{
    func setData(){
        let data = detailedVcData
        let imgUrlArray:[String?] = [data?.image1Url,data?.image2Url,data?.image3Url,data?.image4Url]
        
        gameNameLabel.text = data?.appName
        adultRatingCountLabel.text = data?.adultRaiting
        RatingCountLabel.text = data?.appRating
        priceCountLabel.text = data?.price
        bgImageV.image = data?.bgImg
        

        
        if let imageUrl = URL(string: data?.appIconUrl ?? "") {
            do {
                let imageData = try Data(contentsOf: imageUrl)
                let image = UIImage(data: imageData)
                // Do something with the image, e.g., set it to an UIImageView
                appIcon.image = image
            } catch {
                print("Error fetching the image: \(error)")
            }
        }
        
        for imageUrlString in imgUrlArray {
            if let imageUrl = URL(string: imageUrlString ?? "") {
                        do {
                            let imageData = try Data(contentsOf: imageUrl)
                            let image = UIImage(data: imageData)
                            
                            if ImageV1.image == nil{
                                ImageV1.image = image
                            }else if ImageV2.image == nil{
                                ImageV2.image = image
                            }else if ImageV3.image == nil{
                                ImageV3.image = image
                            }else if ImageV4.image == nil{
                                ImageV4.image = image
                            }
                            
                        } catch {
                            print("Error fetching the image: \(error)")
                        }
                    }
        }
    }
}
