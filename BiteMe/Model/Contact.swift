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
        case doer = "doer"
        case doerscientificname = "doerscientificname"
        case notes = "notes"
        case doer_pix = "doer_pix"
        case bite_pix = "bite_pix"
        case doer_location = "location"
        case doer_date = "date"
    }
    
    var _id:ObjectId
    var name: String = ""
    var email: String = ""
    var doer: String = ""
    var doerscientificname: String = ""
    var notes: String = ""
    var doer_pix: String = ""
    var bite_pix: String = ""
    var doer_location: String = ""
    var doer_date:Date

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(ObjectId.self, forKey: ._id)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
        self.doer = try container.decode(String.self, forKey: .doer)
        self.doerscientificname = try container.decode(String.self, forKey: .doerscientificname)
        self.notes = try container.decode(String.self, forKey: .notes)
        self.doer_pix = try container.decode(String.self, forKey: .doer_pix)
        self.bite_pix = try container.decode(String.self, forKey: .bite_pix)
        self.doer_location = try container.decode(String.self, forKey: .doer_location)
        self.doer_date = try container.decode(Date.self, forKey: .doer_date)
    }
    
    init(_id: ObjectId, name: String, email: String, doer: String, doerscientificname: String, notes: String, doer_pix: String, bite_pix: String, doer_location: String, doer_date: Date){
        self._id = _id
        self.name = name
        self.email = email
        self.doer = doer
        self.doerscientificname = doerscientificname
        self.notes = notes
        self.doer_pix = doer_pix
        self.bite_pix = bite_pix
        self.doer_location = doer_location
        self.doer_date = doer_date
    }

}






