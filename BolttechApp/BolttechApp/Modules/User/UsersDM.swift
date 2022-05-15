//
//  UsersDM.swift
//  BolttechApp
//
//  Created by Veera Subhash on 15/05/22.
//

import Foundation

struct UserDM : Codable {
    let sub : String?
    let given_name : String?
    let family_name : String?
    let nickname : String?
    let name : String?
    let picture : String?
    let locale : String?
    let updated_at : String?
    let email : String?
    let email_verified : Bool?

    enum CodingKeys: String, CodingKey {
        case sub = "sub"
        case given_name = "given_name"
        case family_name = "family_name"
        case nickname = "nickname"
        case name = "name"
        case picture = "picture"
        case locale = "locale"
        case updated_at = "updated_at"
        case email = "email"
        case email_verified = "email_verified"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sub = try values.decodeIfPresent(String.self, forKey: .sub)
        given_name = try values.decodeIfPresent(String.self, forKey: .given_name)
        family_name = try values.decodeIfPresent(String.self, forKey: .family_name)
        nickname = try values.decodeIfPresent(String.self, forKey: .nickname)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        locale = try values.decodeIfPresent(String.self, forKey: .locale)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        email_verified = try values.decodeIfPresent(Bool.self, forKey: .email_verified)
    }

}
