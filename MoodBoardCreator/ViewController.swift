//
//  ViewController.swift
//  MoodBoardCreator
//
//  Created by Curt McCune on 6/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var queryLabel: UITextField!
    @IBOutlet var orientationButton: UIButton!
    @IBOutlet var colorButton: UIButton!
    @IBOutlet var searchButton: UIButton!
    
    var orientation: Orientation?
    var color = ColorQuery.any
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Styling
            
        //Orientation Button
        
        let portrait = UIAction(title: "Portrait (▮)", image: UIImage(systemName: "iphone") ) { action in
            self.orientation = .portrait
        }
        let landscape = UIAction(title: "Landscape (▬)", image: UIImage(systemName: "iphone.landscape") ) { action in
            self.orientation = .landscape
        }
        let anyOrientation = UIAction(title: "Any (▬/▮)", image: UIImage(systemName: "rectangle.fill.on.rectangle.angled.fill") ) { action in
            self.orientation = Orientation.any
        }
        
        let orientationMenu = UIMenu(title: "orientation", options: .displayInline, children: [anyOrientation, landscape, portrait])
        orientationButton.menu = orientationMenu
        orientationButton.showsMenuAsPrimaryAction = true
        
        
        // Color Button
        

        let anyColor = UIAction(title: "Any", image: UIImage(systemName: "circle.fill") ) { action in
            self.color = .any
        }
        
        let white = UIAction(title: "White", image: UIImage(systemName: "circle") ) { action in
            self.color = .white
        }
        
        let blackAndWhite = UIAction(title: "Black and White", image: UIImage(systemName: "circle.bottomhalf.filled") ) { action in
            self.color = .blackAndWhite
        }
        

        var colorChildren = [anyColor, white, blackAndWhite]
        
        Colors.colors.enumerated().forEach { (index,color) in
            
            let index = UIAction(title: color.title, image: color.image ?? UIImage(systemName: "circle.fill") ) { action in
                self.color = ColorQuery(rawValue: color.queryTerm) ?? .any
            }
            colorChildren.append(index)
        }
        
        let colorMenu = UIMenu(title: "Color", options: .displayInline, children: colorChildren)
        colorButton.menu = colorMenu
        colorButton.showsMenuAsPrimaryAction = true
        
        
        ImageController.fetchTopLevel(color: "blue", orientation: "portrait", query: "ocean") { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let object):
//                print(object.results[0].URLs[0].small)
                print(object.results[0].URLs)
                if let altDescription = object.results[0].altDescription {
                    print(altDescription)
                }
            }
        }
    }
    
    func loadViews() {
        
    }
    
    @IBAction func editingChangedQuerySearch(_ sender: Any) {
        if let queryTerm = queryLabel.text, queryTerm != "" {
            searchButton.isEnabled = true
        } else {
            searchButton.isEnabled = false
        }
    }
    
    
}

//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}


//        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
//
//        guard let key = apiKey, !key.isEmpty else {
//            print("API key does not exist")
//            return
//        }
//        print("REST API key:", key)
