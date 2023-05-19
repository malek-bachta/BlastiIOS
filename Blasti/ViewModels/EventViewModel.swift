//
//  EventViewModel.swift
//  Blasti
//
//  Created by MacOS on 18/4/2023.
//

import Foundation
import Combine
import Alamofire
import UIKit
import SwiftUI


class EventsViewModel: ObservableObject {
    @Published var AddEventResult: Result<(title: String, message: String), NSError>?
    @Published var events = [Event]()

    private let networkService = NetworkService()
    @Published var title = ""
    @Published var type = ""
    @Published var adress = ""

    @Published var image: UIImage?

    
    @Published var eadd : Bool = false
    
    init(){
        self.getEvents()
    }
    func addEvent(title: String,
                  adress: String,
                  type: String,
                  image: UIImage?

    ) {
        networkService.AddEvent(title: title,
                                adress: adress,
                                type: type,
                                image: image!,
                                onSuccess: { (title, message) in
            DispatchQueue.main.async {
                self.eadd = true
                self.AddEventResult = .success((title, message))
            }
        }, onFailure: { (title, message) in
            DispatchQueue.main.async {
                self.AddEventResult = .failure(NSError(domain: title, code: 0, userInfo: [NSLocalizedDescriptionKey: message]))
            }
        })
    }
    
    

    
    func getEvents() {
        networkService.fetchEvents() { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                        case .success(let events):
                            self?.events = events
                            print(events)

                        case .failure(let error):
                            print("error loading Events: \(error)")
                        }
            }
        }

    }

}
