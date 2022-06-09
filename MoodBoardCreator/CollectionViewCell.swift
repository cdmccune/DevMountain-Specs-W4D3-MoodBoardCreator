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
            print("")
            updateViews()
        }
    }
    
    
    func updateViews() {
        guard let image = image else {return
            print("Why?")
        }
        print("hit")
        
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
