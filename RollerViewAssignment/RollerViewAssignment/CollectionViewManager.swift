//
//  CollectionViewManager.swift
//  RollerViewAssignment
//
//  
//

import UIKit

protocol CollectionViewManagerDelegate: class {
    func selectedMesurement(number: Int, forCollectionView: UICollectionView)
}

class CollectionViewManager:NSObject, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    
    weak var delegate: CollectionViewManagerDelegate?
    weak var collectionView: UICollectionView!
    var selectedIndexPath : IndexPath!

    var items =  [Int]()

    init ( collectionViewManagerDelegate delegate: CollectionViewManagerDelegate?, collectionView: UICollectionView? , items:[Int]!) {
        self.delegate = delegate
        self.collectionView = collectionView
        self.items = items
        
    }
    
    func defaultLayout()  {
        self.didSelectedData()
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: MainDivisionCollectionViewCell!
        
        if self.items[indexPath.item] % 10 == 0 && indexPath.item != 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.mainDivisionCellIdentifier, for: indexPath as IndexPath) as! MainDivisionCollectionViewCell
            cell.mainDivisionconfigureCell(measurementNumber: self.items[indexPath.item])
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.subDivisionCellIdentifier, for: indexPath as IndexPath) as! MainDivisionCollectionViewCell
            cell.subDivisionConfigureCell()
            
        }
        
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        var cellSize: CGSize!
        
        if indexPath.item % 10 == 0 {
            cellSize = CGSize(width: 1, height: self.collectionView.bounds.height)
        } else {
            cellSize = CGSize(width: 1, height: self.collectionView.bounds.height)
        }
        
        cellSize = CGSize(width: 1, height: self.collectionView.bounds.height)
        
        return cellSize
    }
    
    
    // MARK: - UIScrollViewDelegate methods
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.collectionView.reloadItems(at: [selectedIndexPath])
        didSelectedData()
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.collectionView.reloadItems(at: [selectedIndexPath])
        didSelectedData()
        
    }
    
    
    private func didSelectedData() {
        
        let visibleIndexpath = self.collectionView.indexPathsForVisibleItems.sorted(by: {$0.item < $1.item })
        
        let centerIndexPath =  visibleIndexpath.count / 2
        
        selectedIndexPath = visibleIndexpath[centerIndexPath]
        
        let collectionViewCell = self.collectionView.cellForItem(at: selectedIndexPath) as! MainDivisionCollectionViewCell
        self.delegate?.selectedMesurement(number: self.items[selectedIndexPath.row], forCollectionView: collectionView)

        collectionViewCell.didSelectedMeasurementNumber()
        
    }
    
}
