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
    
    @IBOutlet weak var evoButtonView:UIView!
    @IBOutlet weak var searchButtonView:UIView!
    @IBOutlet weak var giftButtonView:UIView!
    
    @IBOutlet weak var controllerStatusIcon:UIImageView!
    @IBOutlet weak var wifiStatusIcon:UIImageView!
    @IBOutlet weak var batteryStatusIcon:UIImageView!
    
    @IBOutlet weak var batteryPercentLabel:UILabel!
    @IBOutlet weak var timeLabel:UILabel!
    
    
    var allRecommended:[Recommended] = []
    var recommendedCellData:[HomeViewCellData] = []
    var recommendedDataFiltered:[Recommended] = []
    
    var allFeatured:[Featured] = []
    var featuredCellData:[HomeViewCellData] = []
    var featuredDataFiltered:[Featured] = []
    
    var allCategories: [Genre] = []
    
    let getApiResponse = GetApiResponse()
    
    var mainCollectionImageHeights:CGFloat = 0
    var mainCollectionImageWidth:CGFloat = 0
    var mainCollectionLabelHeight:CGFloat = 0
    
    var collectionViewHeight :CGFloat = 200
    
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    let topVData = TopBarViewFile()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchData()
        configureUI()
        getFeaturedResponse()
        getCategories()
        addButtonAction()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let batteryImage = topVData.getBatteryImage()
        let batteryPercent = topVData.getBatteryPercentage()
        let controllerStatus = topVData.getConsollerStatus()
        let connectivityType = topVData.getNetworkConnectivityType()
        let time = topVData.getTime()
        
        controllerStatusIcon.image = controllerStatus
        wifiStatusIcon.image = connectivityType
        batteryStatusIcon.image = batteryImage
        
        batteryPercentLabel.text = batteryPercent
        timeLabel.text = time
    }
    
    
    func addButtonAction(){
        let evoButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(evoButtonTapped))
        evoButtonView.addGestureRecognizer(evoButtonTapGesture)
        let searchButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(searchButtonTapped))
        searchButtonView.addGestureRecognizer(searchButtonTapGesture)
        
        giftButtonView.isHidden = true
    }
    
    func configureUI(){
        
        if deviceType == .pad{
            
            headerViewHeight.constant = 50*1.2
            recommendedViewHeight.constant = collectionViewHeight*1.2
            featuredViewHeight.constant = collectionViewHeight*1.2
            categoriesViewHeight.constant = (collectionViewHeight*1.2)*0.8
            scrollViewVHeight.constant = collectionViewHeight*3*1.2
            
            mainCollectionImageHeights = 100*1.5
            mainCollectionImageWidth = 200*1.5
            mainCollectionLabelHeight = 40
            
            let fontSize:CGFloat = 19*1.2
            
            recommendedLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
            featuredLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
            categoriesLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
            print(recommendedCollectionVH.multiplier)
            
            
        }else if deviceType == .phone{
            
            headerViewHeight.constant = 50
            recommendedViewHeight.constant = collectionViewHeight
            featuredViewHeight.constant = collectionViewHeight
            categoriesViewHeight.constant = collectionViewHeight*0.8
            scrollViewVHeight.constant = (collectionViewHeight*3)-20
            
            mainCollectionImageHeights = 100
            mainCollectionImageWidth = 200
            mainCollectionLabelHeight = 40
            
        }
    }
    
    
    @objc func evoButtonTapped(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "aboutViewController") as? aboutViewController {

            // Push the new view controller onto the navigation stack
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        
    }
    
    
    @objc func searchButtonTapped(){
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "searchViewController") as? searchViewController {

            // Push the new view controller onto the navigation stack
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "searchViewController") as? searchViewController {

            // Push the new view controller onto the navigation stack
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        
//        print("nextt")
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
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
            cell.labelVHeight.constant = mainCollectionImageHeights
            cell.labelVWidth.constant = mainCollectionImageWidth
            
//            cell.categoryTextView.backgroundColor = .white
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == recommendedCollectionV{
            
            let data = recommendedDataFiltered[indexPath.item]
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
            
            let data = featuredDataFiltered[indexPath.item]
            let coverImage = featuredCellData[indexPath.item].image
            let detailedVcData = detailedVcData(image1Url: data.Screenshot1 ?? "", image2Url: data.Screenshot2 ?? "", image3Url: data.Screenshot3 ?? "", image4Url: data.Screenshot4 ?? "", appName: data.AppName ?? "", devName: data.Author ?? "", appIconUrl: data.Icon ?? "", description: data.Description ?? "", downloadLink: data.IosStoreLink ?? "",price: data.IosINR ?? "",adultRaiting: data.IosInstallCount ?? "", appRating: data.IosRatings ?? "", bgImg: coverImage)
            
            
            if let nextViewController = storyboard!.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController {
                
                nextViewController.detailedVcData = detailedVcData
//                nextViewController.bgImageV =
                
                // Push the new view controller onto the navigation stack
                navigationController?.pushViewController(nextViewController, animated: true)
            }
            
            
        }else{
            let category = allCategories[indexPath.row].name
            
            getApiResponse.fetchCategoriesData(category: category){[weak self] data in
                
                guard let self = self else{
                    return
                }
                if let nextViewController = storyboard!.instantiateViewController(withIdentifier: "searchViewController") as? searchViewController {
                    
                    nextViewController.allCategory = data
                    nextViewController.searchDisable = true
    //                nextViewController.bgImageV =
                    print(data?.count)
                    print("")
                    // Push the new view controller onto the navigation stack
                    
                    navigationController?.pushViewController(nextViewController, animated: true)
                }
                
            }
        }
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == categoryCollectionV{
            return CGSize(width: mainCollectionImageWidth, height: collectionViewHeight*0.6)
        }else{
            return CGSize(width: mainCollectionImageWidth, height: collectionViewHeight)
        }
        
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
                        self.recommendedDataFiltered.append(data)
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
                            self.featuredDataFiltered.append(data)
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
