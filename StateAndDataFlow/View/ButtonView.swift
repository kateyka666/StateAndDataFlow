//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Екатерина Боровкова on 03.08.2021.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var timer: TimerCounter
    var color: Color
    var buttonTitle: String
    var action: ()-> Void

    var body: some View {
        Button(
            action: action,
            label: {
                Text("\(buttonTitle)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
        )
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

