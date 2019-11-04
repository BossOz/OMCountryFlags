//
//  ViewController.swift
//  CountryFlags
//
//  Created by Oscar on 30/10/2019.
//  Copyright © 2019 Oscar Manzelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
          
    @IBOutlet weak var flagsCollectionView: UICollectionView!
    
    var countries: [String] = []
    var countriesNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.flagsCollectionView.delegate = self
        self.flagsCollectionView.dataSource = self
        
        for code in NSLocale.isoCountryCodes  {
            
            countries.append(code)
            
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countriesNames.append(name)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsAcross: CGFloat = 3
        var widthRemainingForCellContent = collectionView.bounds.width
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            let borderSize: CGFloat = flowLayout.sectionInset.left + flowLayout.sectionInset.right
            widthRemainingForCellContent -= borderSize + ((cellsAcross - 1) * flowLayout.minimumInteritemSpacing)
        }
        let cellWidth = widthRemainingForCellContent / cellsAcross
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10;
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Flag", for: indexPath) as! FlagCollectionViewCell
        
        let img = UIImage(named: countries[indexPath.item])
        if let flag = img {
            cell.flagImageView.image = flag
        } else {
            cell.flagImageView.image = UIImage(named: "NO_FLAG")
        }
        
        cell.countryNameLabel.text = countries[indexPath.item] + " - " + countriesNames[indexPath.item]
        
        return cell
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
}

