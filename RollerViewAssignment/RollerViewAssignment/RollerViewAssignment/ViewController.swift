//
//  ViewController.swift
//  RollerViewAssignment
//
//

import UIKit

struct ReuseIdentifier {
   static let subDivisionCellIdentifier = "subDivisionCell"
   static let mainDivisionCellIdentifier = "mainDivisionCell"

}

class ViewController: UIViewController,CollectionViewManagerDelegate {
    
    @IBOutlet weak var heightCollectionView: UICollectionView!
    
    @IBOutlet weak var weightCollectionView: UICollectionView!

    @IBOutlet weak var selectedHeightLabel: UILabel!
    @IBOutlet weak var selectedWeightLabel: UILabel!

    var heightCollectionViewManager: CollectionViewManager?
    var weightCollectionViewManager: CollectionViewManager?
    
    // MARK: - View Controller life cycle methods

    override func viewDidLoad() {
        
        //prepare height picker
        let heights = Array(100...220)
        heightCollectionViewManager = CollectionViewManager(collectionViewManagerDelegate: self, collectionView: heightCollectionView, items: heights)
        
        heightCollectionView.delegate = heightCollectionViewManager
        heightCollectionView.dataSource = heightCollectionViewManager
        
        //prepare weight picker

        let weights = Array(10...200)
        weightCollectionViewManager = CollectionViewManager(collectionViewManagerDelegate: self, collectionView: weightCollectionView, items: weights)
        
        weightCollectionView.delegate = weightCollectionViewManager
        weightCollectionView.dataSource = weightCollectionViewManager
        
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //select height and weight after openning project
        weightCollectionViewManager?.defaultLayout()
        heightCollectionViewManager?.defaultLayout()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - CollectionViewManagerDelegate method

    func selectedMesurement(number: Int, forCollectionView: UICollectionView) {
        if forCollectionView ==  heightCollectionView{
            selectedHeightLabel.text = "\(number)"
        } else {
            selectedWeightLabel.text = "\(number)"
        }
    }


}

