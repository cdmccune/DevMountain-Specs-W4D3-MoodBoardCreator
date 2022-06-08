//
//  QueryParams.swift
//  MoodBoardCreator
//
//  Created by Curt McCune on 6/8/22.
//

import Foundation

enum Orientation {
    case any
    case portrait
    case landscape
}

enum Color: String, CaseIterable {
    case blue = "blue"
    case yellow = "yellow"
    case blackAndWhite = "black_and_white"
    case black = "black"
    case white = "white"
    case teal = "teal"
    case red = "red"
    case green = "green"
    case magenta = "magenta"
    case none = "none"
}
