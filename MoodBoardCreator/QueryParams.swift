//
//  QueryParams.swift
//  MoodBoardCreator
//
//  Created by Curt McCune on 6/8/22.
//

import Foundation
import UIKit

enum Orientation: String {
    case any = "any"
    case portrait = "portrait"
    case landscape = "landscape"
}


class Color {
    
    var image: UIImage?
    var title: String
    var queryTerm: String
    
    init(color: UIColor, title: String, queryTerm: String) {
        self.queryTerm = queryTerm
        self.title = title
        self.image = UIImage(systemName: "circle.fill")?.withTintColor(color, renderingMode: .alwaysOriginal)
    }
}

//let blackAndWhite = Color(color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8) ,title: "Black And White", queryTerm: "black_and_white")
//let white = Color(color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8) ,title: "White", queryTerm: "white")
let black = Color(color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8) ,title: "Black", queryTerm: "black")
let blue = Color(color: UIColor(red: 57/255, green: 150/255, blue: 250/255, alpha: 0.8), title: "Blue", queryTerm: "blue")
let yellow = Color(color: UIColor(red: 216/255, green: 201/255, blue: 101/255, alpha: 0.8) ,title: "Yellow", queryTerm: "yellow")
let teal = Color(color: UIColor(red: 64/255, green: 190/255, blue: 167/255, alpha: 0.8) ,title: "Teal", queryTerm: "teal")
let red = Color(color: UIColor(red: 208/255, green: 28/255, blue: 28/255, alpha: 0.8) ,title: "Red", queryTerm: "red")
let green = Color(color: UIColor(red: 120/255, green: 185/255, blue: 129/255, alpha: 0.8) ,title: "Green", queryTerm: "green")
let magenta = Color(color: UIColor(red: 158/255, green: 91/255, blue: 172/255, alpha: 0.8) ,title: "Magenta", queryTerm: "magenta")

class Colors {
    static var colors = [black,blue,yellow,teal,red,green,magenta]
}



enum ColorQuery: String {
    case blue = "blue"
    case yellow = "yellow"
    case blackAndWhite = "black_and_white"
    case black = "black"
    case white = "white"
    case teal = "teal"
    case red = "red"
    case green = "green"
    case magenta = "magenta"
    case any = "any"
}
