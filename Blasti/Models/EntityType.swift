//
//  EntityType.swift
//  ItunesSearchApp
//
//  Created by Karin Prater on 26.07.22.
//

import Foundation

enum EntityType: String, Identifiable, CaseIterable {
    case all
    case show
    case event
    case movie
    
    var id: String {
        self.rawValue
    }
    
    func name() -> String {
        switch self {
            case .all:
                return "All"
            case .show:
                return "Shows"
            case .event:
                return "Events"
            case .movie:
                return "Movies"
        }
    }
}
