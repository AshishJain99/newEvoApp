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
    
    let getApiResponse = GetApiResponse()
    
    var cellHeight:CGFloat = 0
    var cellWidth:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchViewTextColor()
        
        let backButtonTap = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backV.addGestureRecognizer(backButtonTap)
        
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
}


extension searchViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = searchCollectionV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! searchCollectionViewCell
        let url = allSearch[indexPath.item].CoverImage
        let appName = allSearch[indexPath.item].AppName
        getApiResponse.getImageFromString(url: url ?? "") {[weak self] image in
            guard let self = self else{
                return
            }
            cell.imageV.image = image
        }
        
        cell.labelVWidth.constant = cellWidth
        cell.imageVHeight.constant = cellHeight*0.8
        cell.imageVWidth.constant = cellWidth
        cell.labelVHeight.constant = cellHeight*0.2
        cell.labelV.text = appName
        
        
        return cell
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
                            
                            DispatchQueue.main.async {
                                self.searchCollectionV.reloadData()
                                //print(apiResponse)
                            }
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
            
        }.resume()
    }
    


}
