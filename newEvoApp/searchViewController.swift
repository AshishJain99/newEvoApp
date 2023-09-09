//
//  searchViewController.swift
//  newEvoApp
//
//  Created by Ashish Jain on 07/09/23.
//

import UIKit

class searchViewController: UIViewController {
    
    @IBOutlet weak var backV: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchCollectionV: UICollectionView!
    
    @IBOutlet weak var resultV: UIView!
    //    @IBOutlet weak var backV: UIView!
    
    var allSearch:[Search] = []
    
    var allCategory:[categoryElement]!
    
    let getApiResponse = GetApiResponse()
    var searchDisable = false
    var cellHeight:CGFloat = 0
    var cellWidth:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchViewTextColor()
        
        let backButtonTap = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backV.addGestureRecognizer(backButtonTap)
        
        searchCollectionV.reloadData()
        
        if searchDisable == true{
            searchBar.isHidden = true
        }
//        print(allCategory.count)
        print(searchDisable)
        print("")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setCollectionVCellSize()
    }
    
    func setSearchViewTextColor(){
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = UIColor.white  // Change to your desired color
        }
    }
    
    func setCollectionVCellSize(){
        cellHeight = (resultV.frame.size.height/2)-5
        cellWidth = (resultV.frame.size.width/3)-5
        print(cellWidth,cellHeight)
    }
    
    @objc func backButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


extension searchViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchDisable == false{
            return allSearch.count
        }else{
            return allCategory.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = searchCollectionV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! searchCollectionViewCell
        
        cell.labelVWidth.constant = cellWidth
        cell.imageVHeight.constant = cellHeight*0.8
        cell.imageVWidth.constant = cellWidth
        cell.labelVHeight.constant = cellHeight*0.2
        
        
        if searchDisable == false{
            
            let url = allSearch[indexPath.item].CoverImage
            let appName = allSearch[indexPath.item].AppName
            getApiResponse.getImageFromString(url: url ?? "") {[weak self] image in
                guard let self = self else{
                    return
                }
                cell.imageV.image = image
            }
            cell.labelV.text = appName
            return cell
            
        }else{
            let url = allCategory[indexPath.item].CoverImage
            let appName = allCategory[indexPath.item].AppName
            getApiResponse.getImageFromString(url: url ?? "") {[weak self] image in
                guard let self = self else{
                    return
                }
                cell.imageV.image = image
            }
            cell.labelV.text = appName
            return cell
        }
        

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if searchDisable == false{
            let data = allSearch[indexPath.item]
            let coverImageUrl = allSearch[indexPath.item].CoverImage
            var coverImage = UIImage()
            
            
            getApiResponse.fetchImageRecommended(urlString: coverImageUrl ?? "") { image in
                coverImage = image!
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+0.2){[self] in
                let detailedVcData = detailedVcData(image1Url: data.Screenshot1 ?? "", image2Url: data.Screenshot2 ?? "", image3Url: data.Screenshot3 ?? "", image4Url: data.Screenshot4 ?? "", appName: data.AppName ?? "", devName: data.Author ?? "", appIconUrl: data.Icon ?? "", description: data.Description ?? "", downloadLink: data.IosStoreLink ?? "",price: data.IosINR ?? "",adultRaiting: data.IosInstallCount ?? "", appRating: data.IosRatings ?? "", bgImg: coverImage)
                
                
                if let nextViewController = storyboard!.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController {
                    
                    nextViewController.detailedVcData = detailedVcData
        //                nextViewController.bgImageV =
                    
                    // Push the new view controller onto the navigation stack
                    navigationController?.pushViewController(nextViewController, animated: true)
                }
            }
        }else{
            let data = allCategory[indexPath.item]
            let coverImageUrl = allCategory[indexPath.item].CoverImage
            var coverImage = UIImage()
            
            
            getApiResponse.fetchImageRecommended(urlString: coverImageUrl ?? "") { image in
                coverImage = image!
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+0.2){[self] in
                let detailedVcData = detailedVcData(image1Url: data.Screenshot1 ?? "", image2Url: data.Screenshot2 ?? "", image3Url: data.Screenshot3 ?? "", image4Url: data.Screenshot4 ?? "", appName: data.AppName ?? "", devName: data.Author ?? "", appIconUrl: data.Icon ?? "", description: data.Description ?? "", downloadLink: data.IosStoreLink ?? "",price: data.IosINR ?? "",adultRaiting: data.IosInstallCount ?? "", appRating: data.IosRatings ?? "", bgImg: coverImage)
                
                
                if let nextViewController = storyboard!.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController {
                    
                    nextViewController.detailedVcData = detailedVcData
        //                nextViewController.bgImageV =
                    
                    // Push the new view controller onto the navigation stack
                    navigationController?.pushViewController(nextViewController, animated: true)
                }
            }
        }

        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth-5, height: cellHeight)
//        return CGSize(width: 250, height: 160)
    }
    
    
}
extension searchViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fetchSearchData(text: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
    }



    
}

extension searchViewController{
    private func fetchSearchData(text:String){
        allSearch.removeAll()
        guard let url = URL(string: "https://privapi.amkette.com/egpapp_v3/iosapi/search.php?search=\(text)")
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil{
                if data != nil{
                    DispatchQueue.main.async {
                        do{
                            let ApiResponse = try JSONDecoder().decode(searchResponseApi.self, from: data!)
                            self.allSearch.append(contentsOf: ApiResponse.Search!)
                            
                            
                        }
                        
                        catch{
                            print("Model Problem")
                        }
                    }
                }
                
            }
            else{
                print("Parsing problem")
            }
            DispatchQueue.main.async {
                self.searchCollectionV.reloadData()
                //print(apiResponse)
            }
            
        }.resume()
        
    }
    


}
