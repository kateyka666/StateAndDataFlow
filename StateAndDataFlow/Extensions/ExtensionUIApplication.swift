//
//  ExtensionUIApplication.swift
//  StateAndDataFlow
//
//  Created by Екатерина Боровкова on 04.08.2021.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
