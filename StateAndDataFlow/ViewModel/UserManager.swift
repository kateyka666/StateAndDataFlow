//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import SwiftUI

final class UserManager: ObservableObject {
    
    private var storage = StorageManager()
    
	@Published var isRegistered = false
    @AppStorage("name") var name = "" 
}
