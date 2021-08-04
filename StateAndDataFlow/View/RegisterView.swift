//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
	@EnvironmentObject var user: UserManager
    @EnvironmentObject var validator: Validator

    var body: some View {
		VStack {
            HStack{
                
                TextField("Enter your name", text: $user.name)
                    .onChange(of: user.name, perform: { _ in
                        validator.counter(textCount: user.name.count)
                })
                    .frame(width: 200)
                    .multilineTextAlignment(.center)
                    
                Text("\(validator.textCounting)")
                    .foregroundColor(validator.isValidate ? .green: .red)
                    .fontWeight(.bold)
            
            }.padding(.leading, 30)
            
			Button(action: registerUser, label: {
				HStack {
					Image(systemName: "checkmark.circle")
					Text("OK")
                }.foregroundColor(validator.isValidate ? .blue : .gray)
			})
		}.font(.system(size: 25))
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

extension RegisterView {
	func registerUser() {
		if !user.name.isEmpty {
//			user.name = name
			user.isRegistered = true
            validator.textCounting = 0
            validator.isValidate = false
            
		}
	}
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
            .environmentObject(Validator())
    }
}
