//
//  CollectionViewCell.swift
//  MoodBoardCreator
//
//  Created by Curt McCune on 6/7/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var image: UIImageView!
    
    var altDescription: String?
    var readyImage: UIImage? {
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews() {
        if let altDescription = altDescription {
            descriptionLabel.text = altDescription
        }
        if let readyImage = readyImage {
            image.image = readyImage
        }
    }
    
}
