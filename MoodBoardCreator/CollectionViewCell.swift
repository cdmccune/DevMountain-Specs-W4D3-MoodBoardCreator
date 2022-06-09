//
//  CollectionViewCell.swift
//  MoodBoardCreator
//
//  Created by Curt McCune on 6/7/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var cellImage: UIImageView!
    
    
    
    var image: ImageInfo? {
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews() {
        
        self.layer.cornerRadius = 10
        
        guard let image = image else {return}
        
        if let altDescription = image.altDescription {
            self.descriptionLabel.text = altDescription
        } else {
            self.descriptionLabel.text = "No description for this photo!"
        }
        
        ImageController.fetchImage(image: image, completion: { result in

            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.cellImage.image = image
                case .failure(let error):
                    self.cellImage.image = UIImage(systemName: "photo.on.rectangle")
                    print(error)
                }
            }

        })
        
        
    }
    
}
