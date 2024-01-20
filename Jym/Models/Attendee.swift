//
//  Attendee.swift
//  Jym
//
//  Created by John Smith on 1/20/24.
//

import Foundation


struct Attendee: Identifiable, Codable {
    let id: UUID
    var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

