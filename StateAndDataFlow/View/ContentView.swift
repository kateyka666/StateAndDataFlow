//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var timer = TimerCounter()
	@EnvironmentObject var user: UserManager

	var body: some View {
		VStack {
			Text("Hi! \(user.name)")
				.font(.largeTitle)
				.offset(x: 0, y: 100)

			Text("\(timer.counter)")
				.font(.largeTitle)
				.offset(x: 0, y: 200)

			Spacer()

            ButtonView(timer: timer, color: .red, buttonTitle: "Start") {
                timer.startTimer()
            }

			Spacer()
            
            ButtonView(timer: timer, color: .blue, buttonTitle: "LogOut") {
                logOutUser()
            }.padding()
            
		}
    }
}

extension ContentView {
    private func logOutUser() {
        user.name = ""
        user.isRegistered = false
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
            .environmentObject(UserManager())
            .environmentObject(Validator())
    }
}


