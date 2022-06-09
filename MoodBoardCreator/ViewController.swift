//
//  ViewController.swift
//  MoodBoardCreator
//
//  Created by Curt McCune on 6/7/22.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate  {
    
    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var orientationLabel: UILabel!
    @IBOutlet var imagesOfLabel: UILabel!
    @IBOutlet var inputStackView: UIStackView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var queryLabel: UITextField!
    @IBOutlet var orientationButton: UIButton!
    @IBOutlet var colorButton: UIButton!
    @IBOutlet var searchButton: UIButton!
    
    
    var orientation = Orientation.any
    var color = ColorQuery.any
    var moodColor: UIColor = .systemBackground
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
    }
    
    func style() {
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
        

        var colorChildren:[UIAction] = []
        
        Colors.colors.enumerated().forEach { (index,color) in
            
            let index = UIAction(title: color.title, image: color.image ?? UIImage(systemName: "circle.fill") ) { action in
                self.color = ColorQuery(rawValue: color.queryTerm) ?? .any
                self.moodColor = color.color
            }
            colorChildren.append(index)
        }
        colorChildren[0].image = nil
        colorChildren[1].image = UIImage(systemName: "circle.bottomhalf.filled")
        colorChildren[2].image = UIImage(systemName: "circle")
        
        let colorMenu = UIMenu(title: "Color", options: .displayInline, children: colorChildren)
        colorButton.menu = colorMenu
        colorButton.showsMenuAsPrimaryAction = true
        
        //Collection View
        
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        //Stack View
        
        inputStackView.layer.cornerRadius = 10
        inputStackView.layer.masksToBounds = true
        colorButton.layer.cornerRadius = 10
        colorButton.layer.masksToBounds = true
        colorButton.layer.borderWidth = 2
        colorButton.layer.borderColor = UIColor.lightGray.cgColor
        orientationButton.layer.cornerRadius = 10
        orientationButton.layer.masksToBounds = true
        orientationButton.layer.borderWidth = 2
        orientationButton.layer.borderColor = UIColor.lightGray.cgColor
        queryLabel.layer.cornerRadius = 10
        queryLabel.layer.masksToBounds = true
        queryLabel.layer.borderWidth = 2
        queryLabel.layer.borderColor = UIColor.lightGray.cgColor
        imagesOfLabel.layer.cornerRadius = 10
        imagesOfLabel.layer.masksToBounds = true
        imagesOfLabel.layer.borderWidth = 2
        imagesOfLabel.layer.borderColor = UIColor.lightGray.cgColor
        orientationLabel.layer.cornerRadius = 10
        orientationLabel.layer.masksToBounds = true
        orientationLabel.layer.borderWidth = 2
        orientationLabel.layer.borderColor = UIColor.lightGray.cgColor
        colorLabel.layer.cornerRadius = 10
        colorLabel.layer.masksToBounds = true
        colorLabel.layer.borderWidth = 2
        colorLabel.layer.borderColor = UIColor.lightGray.cgColor
        searchButton.layer.cornerRadius = 10
        searchButton.layer.borderWidth = 2
        searchButton.layer.borderColor = UIColor.lightGray.cgColor
        searchButton.titleLabel?.textAlignment = .center
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        getTopLevelObject()
        view.backgroundColor = self.moodColor
        self.queryLabel.resignFirstResponder()
    }
    
    func getTopLevelObject() {
        
        ImageController.fetchTopLevel(color: self.color.rawValue, orientation: self.orientation.rawValue, query: queryLabel.text ?? "Dogs") { result in
            
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let object):
                    ImageController.images = object.results
                    print(ImageController.images.count)
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    
    @IBAction func editingChangedQuerySearch(_ sender: Any) {
        if let queryTerm = queryLabel.text, queryTerm != "" {
            searchButton.isEnabled = true
        } else {
            searchButton.isEnabled = false
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageController.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        
        cell.image = ImageController.images[indexPath.row]
        
        return cell
    }
    
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.queryLabel.resignFirstResponder()
    }
    
}







//        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
//
//        guard let key = apiKey, !key.isEmpty else {
//            print("API key does not exist")
//            return
//        }
//        print("REST API key:", key)
