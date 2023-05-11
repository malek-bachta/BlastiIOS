//
//  ViewRouter.swift
//  Blasti
//
//  ViewRouter.swift
//  CustomTabBar
//
// Created by BLCKBIRDS
// Visit BLCKBIRDS.COM FOR MORE TUTORIALS

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .home
    
}


enum Page {
    case home
    case categories
    case tickets
    case profile
    case add
}
