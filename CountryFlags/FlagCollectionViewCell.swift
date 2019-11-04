//
//  FlagCollectionViewCell.swift
//  CountryFlags
//
//  Created by Oscar on 30/10/2019.
//  Copyright © 2019 Oscar Manzelli. All rights reserved.
//

import UIKit

class FlagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
