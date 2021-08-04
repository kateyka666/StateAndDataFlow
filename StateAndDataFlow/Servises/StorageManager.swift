//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Екатерина Боровкова on 04.08.2021.
//

import Foundation
import SwiftUI

final class StorageManager{
    static let shared = StorageManager()
    
    private let defaults: UserDefaults = .standard
    
    func set<T>(name: String, value: T){
        defaults.set(value, forKey: name)
    }
    func fetch<T>(name: String) -> T {
        defaults.object(forKey: name) as! T
    }
}
