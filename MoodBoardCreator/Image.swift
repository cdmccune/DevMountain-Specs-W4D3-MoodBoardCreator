//
//  Image.swift
//  MoodBoardCreator
//
//  Created by Curt McCune on 6/7/22.
//

import Foundation


struct TopLevelObject:Decodable {
    var results: [ImageInfo]
}

struct ImageInfo:Decodable {
    var altDescription: String?
    var URLs: ImageURLs
    
    
    enum CodingKeys: String, CodingKey {
        case altDescription = "alt_description"
        case URLs = "urls"
    }
}

struct ImageURLs: Decodable {
    var small: String
}
