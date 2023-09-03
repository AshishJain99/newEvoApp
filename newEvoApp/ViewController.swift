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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recommendedCollectionV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! recommendedCollectionViewCell
        
        cell.recommendedTextView.text = String(indexPath.item)
        return cell
    }
    
    
}
