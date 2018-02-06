//
//  MainDivisionCollectionViewCell.swift
//  RollerViewAssignment
//
//
import UIKit

class MainDivisionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var measurementNumberLabel: UILabel!
    
    func subDivisionConfigureCell()  {
        lineView.backgroundColor = UIColor.gray

    }

    func mainDivisionconfigureCell(measurementNumber : Int) {
       
            lineView.backgroundColor = UIColor.black
            measurementNumberLabel.text = "\(measurementNumber)"
        
    }
    
    override func prepareForReuse() {
        self.backgroundColor = UIColor.white
    }
    
    
    func didSelectedMeasurementNumber() {
        lineView.backgroundColor = UIColor.red
        self.backgroundColor = UIColor.red

    }
    
    
}
