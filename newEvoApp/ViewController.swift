//
//  ViewController.swift
//  newEvoApp
//
//  Created by Ashish Jain on 03/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollViewVHeight: NSLayoutConstraint!
    @IBOutlet weak var recommendedViewHeight: NSLayoutConstraint!
    @IBOutlet weak var featuredViewHeight: NSLayoutConstraint!
    @IBOutlet weak var categoriesViewHeight: NSLayoutConstraint!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var recommendedCollectionV: UICollectionView!
    @IBOutlet weak var featuredCollectionV: UICollectionView!
    @IBOutlet weak var categoryCollectionV: UICollectionView!
    
    
    @IBOutlet weak var recommendedLabel: UILabel!
    @IBOutlet weak var featuredLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    @IBOutlet weak var recommendedCollectionVH: NSLayoutConstraint!
    
    
    
    var allRecommended:[Recommended] = []
    var recommendedCellData:[HomeViewCellData] = []
    
    var allFeatured:[Featured] = []
    var featuredCellData:[HomeViewCellData] = []
    
    var allCategories: [Genre] = []
    
    let getApiResponse = GetApiResponse()
    
    var mainCollectionImageHeights:CGFloat = 0
    var mainCollectionImageWidth:CGFloat = 0
    var mainCollectionLabelHeight:CGFloat = 0
    
    var collectionViewHeight :CGFloat = 200
    
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchData()
        configureUI()
//        getFeaturedResponse()
//        getCategories()
    }
    
    
    
    func configureUI(){
        
        if deviceType == .pad{
            
            headerViewHeight.constant = 50*2
            recommendedViewHeight.constant = collectionViewHeight*2
            featuredViewHeight.constant = collectionViewHeight*2
            categoriesViewHeight.constant = collectionViewHeight*2
            scrollViewVHeight.constant = collectionViewHeight*3*2
            
            mainCollectionImageHeights = (100*2)+50
            mainCollectionImageWidth = 200*2
            mainCollectionLabelHeight = 40*2
            
            let fontSize:CGFloat = 19*2
            
            recommendedLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
            featuredLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
            categoriesLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
            print(recommendedCollectionVH.multiplier)
            
            
        }else if deviceType == .phone{
            
            headerViewHeight.constant = 50
            recommendedViewHeight.constant = collectionViewHeight
            featuredViewHeight.constant = collectionViewHeight
            categoriesViewHeight.constant = collectionViewHeight
            scrollViewVHeight.constant = collectionViewHeight*3
            
            mainCollectionImageHeights = 100
            mainCollectionImageWidth = 200
            mainCollectionLabelHeight = 40
            
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController {

            // Push the new view controller onto the navigation stack
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        
//        print("nextt")
    }
    
    
    
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recommendedCollectionV{
            return recommendedCellData.count
        }else if collectionView == featuredCollectionV{
            print(featuredCellData.count,"featuredData")
            return featuredCellData.count
        }else{
            return allCategories.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recommendedCollectionV{
            let cell = recommendedCollectionV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! recommendedCollectionViewCell
            cell.recommendedimageView.image = recommendedCellData[indexPath.item].image
            cell.recommendedTextView.text = recommendedCellData[indexPath.item].Label
    
            cell.recommendedTextView.textColor = .white
            
            cell.imageVHeight.constant = mainCollectionImageHeights
            cell.imageVWidth.constant = mainCollectionImageWidth
            cell.labelVHeight.constant = mainCollectionLabelHeight
            cell.labelVWidth.constant = mainCollectionImageWidth
            return cell
            
        }else if collectionView == featuredCollectionV{
            let cell = featuredCollectionV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! featuredCollectionViewCell
            cell.featuredTextView.text = featuredCellData[indexPath.item].Label
            cell.featuredimageView.image = featuredCellData[indexPath.item].image
            
            cell.featuredTextView.textColor = .white
            
            cell.featuredimageVHeight.constant = mainCollectionImageHeights
            cell.featuredimageVWidth.constant = mainCollectionImageWidth
            cell.featuredLabelVHeight.constant = mainCollectionLabelHeight
            cell.featuredLabelVWidth.constant = mainCollectionImageWidth
            return cell
        }else{
            let cell = categoryCollectionV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! categoriesCollectionViewCell
            cell.categoryTextView.text = allCategories[indexPath.item].name
            
            cell.categoryTextView.textColor = .white
            cell.imageVHeight.constant = mainCollectionImageHeights
            cell.imageVWidth.constant = mainCollectionImageWidth
            cell.labelVWidth.constant = mainCollectionImageWidth
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == recommendedCollectionV{
            
            let data = allRecommended[indexPath.item]
            let coverImage = recommendedCellData[indexPath.item].image
            let detailedVcData = detailedVcData(image1Url: data.Screenshot1 ?? "", image2Url: data.Screenshot2 ?? "", image3Url: data.Screenshot3 ?? "", image4Url: data.Screenshot4 ?? "", appName: data.AppName ?? "", devName: data.Author ?? "", appIconUrl: data.Icon ?? "", description: data.Description ?? "", downloadLink: data.IosStoreLink ?? "",price: data.IosINR ?? "",adultRaiting: data.IosInstallCount ?? "", appRating: data.IosRatings ?? "", bgImg: coverImage)
            
            
            if let nextViewController = storyboard!.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController {
                
                nextViewController.detailedVcData = detailedVcData
//                nextViewController.bgImageV =
                
                // Push the new view controller onto the navigation stack
                navigationController?.pushViewController(nextViewController, animated: true)
            }
            
        }else if collectionView == featuredCollectionV{
            print(featuredCellData.count,"featuredData")
            
        }else{
            
        }
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: mainCollectionImageWidth, height: collectionViewHeight)
    }
}

extension ViewController{
    func fetchData(){
        getApiResponse.recommendedApiResponse{ recommendedData in
            if let recommendedData = recommendedData {
                // Do something with data
                self.allRecommended = recommendedData
                //                for data in self.allRecommended{
                ////                    print(data)
                //                }
                print(self.allRecommended.count)
                self.fetchRecommendedCellData()
                
            } else {
                print("Failed to fetch data")
            }
        }
        
    }
    
    func fetchRecommendedCellData(){
        let group = DispatchGroup()
        recommendedCellData.removeAll()
        for data in allRecommended {
            if let url = data.CoverImage {
                group.enter()
                getApiResponse.fetchImageRecommended(urlString: url) { image in
                    if let image = image, let appName = data.AppName {
                        self.recommendedCellData.append(HomeViewCellData(image: image, Label: appName))
                    }
                    group.leave()
                }
            }
        }
        
        group.notify(queue: .main) {
            DispatchQueue.main.async {
                self.recommendedCollectionV.reloadData()
            }
        }
    }
    
    func getFeaturedResponse(){
        getApiResponse.fetchFeaturedData{ data in
            if let data =  data{
                self.allFeatured = data
                fetchFeaturedCellData()
                print(data.count)
            }
            
        }
        func fetchFeaturedCellData(){
            let group = DispatchGroup()
            featuredCellData.removeAll()
            for data in allFeatured {
                if let url = data.CoverImage {
                    group.enter()
                    getApiResponse.fetchImageFeatured(urlString: url) { image in
                        if let image = image, let appName = data.AppName {
                            self.featuredCellData.append(HomeViewCellData(image: image, Label: appName))
                        }
                        group.leave()
                    }
                }
            }
            
            group.notify(queue: .main) {
                DispatchQueue.main.async {
                    self.featuredCollectionV.reloadData()
                }
            }
        }
    }
    
    func getCategories(){
        getApiResponse.fetchGenres{ category in
            if let category = category{
                self.allCategories = category
                DispatchQueue.main.async {
                    self.categoryCollectionV.reloadData()
                }
                
            }
            
        }
    }
}
