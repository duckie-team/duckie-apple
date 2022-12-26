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
    let popularTags: [Tag] = [Tag(id:0, name: "마"), Tag(id:1, name: "덕키"), Tag(id:2,name: "해터"), Tag(id:3, name: "에밀asdfasdf리"),Tag(id:4, name: "파asdfasdfasdfsaf"), Tag(id:5, name:"good"), Tag(id:6,name:"반지의 "), Tag(id:7,name:"제왕"),Tag(id:8,name:"나는 솔로"),Tag(id:18,name:"나는 솔로"),Tag(id:28,name:"나는 솔로"),Tag(id:38,name:"나는 솔로")]
    let thumbnailUrl: String = "http://k.kakaocdn.net/dn/Phk5S/btrI3uKwKnG/QHa33dTjgStZQoTB7e87Gk/img_640x640.jpg"
}
