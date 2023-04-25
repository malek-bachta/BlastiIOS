//
//  Movies.swift
//  Blasti
//
//  Created by Siwar Nafti on 13/4/2023.
//

struct Movie: Codable , Hashable{
    
    let title: String
    let description: String
    let genre: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
       
        case title
        case description
        case genre
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        genre = try container.decode(String.self, forKey: .genre)
        image = try container.decode(String.self, forKey: .image)

    }
}

