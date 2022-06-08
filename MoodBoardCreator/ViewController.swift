//
//  ViewController.swift
//  MoodBoardCreator
//
//  Created by Curt McCune on 6/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
//
//        guard let key = apiKey, !key.isEmpty else {
//            print("API key does not exist")
//            return
//        }
//        print("REST API key:", key)
        
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


