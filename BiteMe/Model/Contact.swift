//
//  Contact.swift
//  BiteMe
//
//  Created by Emil Zegers on 16/06/2020.
//  Copyright © 2020 Basalt Aura. All rights reserved.
//

import Foundation
import MongoSwift

class Contact: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case _id = "_id"
        case name = "name"
        case email = "email"
    }
    
    var _id:ObjectId
    var name: String = ""
    var email: String = ""
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(ObjectId.self, forKey: ._id)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
    }
    
    init(_id: ObjectId, name: String, email: String){
        self._id = _id
        self.name = name
        self.email = email
    }

}






