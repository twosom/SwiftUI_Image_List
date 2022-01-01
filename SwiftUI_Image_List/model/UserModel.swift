//
//  UserModel.swift
//  SwiftUI_Image_List
//
//  Created by Desire L on 2022/01/01.
//

import Foundation

//{
//createdAt: "2021-12-31T23:38:43.601Z",
//name: "Justin Brown",
//avatar: "http://placeimg.com/640/480/nature",
//id: "1"
//},
struct UserModel: Codable, Identifiable {
    var id: String?
    var name: String?
    var avatarUrl: String?
    var createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatarUrl = "avatar"
        case createdAt
    }
}
