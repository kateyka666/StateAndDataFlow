//
//  Validator.swift
//  StateAndDataFlow
//
//  Created by Екатерина Боровкова on 02.08.2021.
//
import Combine
import SwiftUI

final class Validator: ObservableObject {
    
    private var storage = StorageManager()
    
    @AppStorage("isValidate") var isValidate = false
    @AppStorage("textCounting") var textCounting = 0
    
    func counter(textCount: Int){
        textCounting = textCount
        if textCounting >= 3 {
           isValidate = true
        }
    }
    
 
}



