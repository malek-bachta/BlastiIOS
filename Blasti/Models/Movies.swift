//
//  Movies.swift
//  Blasti
//
//  Created by Siwar Nafti on 13/4/2023.
//

struct Movie: Codable,Hashable ,Identifiable{
    let _id: String

    let title: String
    let description: String
    let genre: String
    let image: String
    let adress: String
//    var isFaved: Bool
    
    var id : String {_id}
    
//    static var sampleMovies:  [Movie] {
//        var tempList = [Movie]()
//        for i in 1...20 {
//            tempList.append(Movie(_id: String, title: String, description: <#T##String#>, genre: <#T##String#>, image: <#T##String#>, adress: <#T##String#>, isFaved: <#T##Bool#>))
//        }
//        return tempList
//
//    }
    
   
}

