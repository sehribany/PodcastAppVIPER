//
//  NetworkPath.swift
//  PodcastApp
//
//  Created by Şehriban Yıldırım on 2.10.2024.
//

import Foundation

protocol NetworkPathProtocol{
    var value: String { get }
}

enum NetworkPath: String, NetworkPathProtocol{
    case login = "/login"
    
    var value: String{
        self.rawValue
    }
}
