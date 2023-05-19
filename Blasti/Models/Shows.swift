//
//  Shows.swift
//  Blasti
//
//  Created by Apple Esprit on 19/5/2023.
//

struct Show: Codable,Hashable ,Identifiable{
    let _id: String

    let title: String
    let description: String
    let genre: String
    let image: String
    let place: String
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
