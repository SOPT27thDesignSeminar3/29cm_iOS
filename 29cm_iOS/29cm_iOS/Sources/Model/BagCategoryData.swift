//
//  BagCategoryData.swift
//  29cm_iOS
//
//  Created by Yunjae Kim on 2020/12/07.
//

import Foundation


struct BagCategoryData: Codable {
    let id: Int
    let title: String
    let mainImage: String
    let isLikes: Int

    enum CodingKeys: String, CodingKey {
        case id, title
        case mainImage = "main_image"
        case isLikes = "is_likes"
    }
}
