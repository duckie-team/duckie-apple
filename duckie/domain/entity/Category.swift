//
//  Category.swift
//  duckie
//
//  Created by DongHo Lee on 2022/12/25.
//
import Foundation

struct Category: Codable {
    let id: Int
    let name: String
    let popularTags: [Tag]
    let thumbnailUrl: String = "http://k.kakaocdn.net/dn/Phk5S/btrI3uKwKnG/QHa33dTjgStZQoTB7e87Gk/img_640x640.jpg"
}
