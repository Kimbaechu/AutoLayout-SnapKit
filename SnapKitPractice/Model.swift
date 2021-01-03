//
//  Model.swift
//  SnapKitPractice
//
//  Created by Beomcheol Kwon on 2021/01/02.
//

import Foundation

struct Category {
    let name: String
    let boards: [Board]
}

struct Board {
    let title: String
    let subTitle: String?
    let isFavorite: Bool
}
