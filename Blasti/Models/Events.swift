//
//  Events.swift
//  Blasti
//
//  Created by Siwar Nafti on 13/4/2023.
//

struct Event: Codable , Hashable{
    
    let title: String
    let adress: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
       
        case title
        case adress
        case type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        adress = try container.decode(String.self, forKey: .adress)
        type = try container.decode(String.self, forKey: .type)
    }
}

