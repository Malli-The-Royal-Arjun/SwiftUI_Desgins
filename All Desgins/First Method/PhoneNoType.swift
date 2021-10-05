//
//  PhoneNoType.swift
//  PhoneNumber
//
//  Created by Happy on 02/03/21.
//

import SwiftUI

class TextBindingManager: ObservableObject {
 
    @Published var phoneNumber = "" {
        didSet {
            if phoneNumber.count > characterLimit && oldValue.count <= characterLimit {
                phoneNumber = oldValue
            }
        }
    }
    let characterLimit: Int
    
    init(limit: Int = 5){
        characterLimit = limit
    }
}

struct PhoneNoType: View {
    @ObservedObject var textBindingManager = TextBindingManager(limit: 20)
    @ObservedObject var loginViewController = LoginViewController()
    @State var phoneNumber: String = ""
    @State private var selection: String? = nil
    @State var code: String = ""
    @ObservedObject var codeTextField = ObservableTextField()
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 10).stroke()
                    .frame(width: 270, height: 50)
                HStack (spacing: 0) {
                    HStack (spacing: 0) {
                        Text(self.codeTextField.getCountryCode(codeTextField.value).isEmpty ? "🇦🇺" : "\(self.codeTextField.flag(country: self.codeTextField.getCountryCode(codeTextField.value)))")
                            .frame(width: 30, height: 50)
                        
                        TextField("+1", text: $codeTextField.value)
                            .keyboardType(.phonePad)
                            .frame(width: 40, height: 50)
                            .foregroundColor(.white)
                            
                    }
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(10)
                    
                    TextField("Phone Number", text: $textBindingManager.phoneNumber)
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .keyboardType(.phonePad)
                        .disabled(self.phoneNumber.count == 10)
                    
                }.padding()
            }
            
            VStack(spacing:44){
                VStack(spacing:55){
                    VStack(spacing:10){
                        if(self.loginViewController.error){
                            ZStack{
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: 204,height: 18,alignment:.center)
                                    .foregroundColor(.red).opacity(0.5)
                                Text("Invalid Phone Number")
                                    .font(Font.custom("OpenSans-Bold", size: 10))
                                    .foregroundColor(.white)
                            }
                        }
                        ZStack{
                            NavigationLink(destination: PasscodeField(), tag: "OTP",selection: self.$selection){
                                Button(action: {
                                    if(self.textBindingManager.phoneNumber.isEmpty || self.textBindingManager.phoneNumber.count != 10 ){
                                        self.loginViewController.error = true
                                    }else{
                                        self.loginViewController.error = false
                                        self.selection = "OTP"
                                        let endPoint = "/otp?authkey=262820AwViXQk75c70ee0b&template_id=5f8536dc1954bc633c5b85d5&mobile=\(self.codeTextField.value)\(self.textBindingManager.phoneNumber)"
                                        self.loginViewController.sendOTP(endPoint: endPoint, loginViewController: self.loginViewController)
                                    }
                                }) {
                                    Text("CONTINUE")
                                        
                                        .padding()
                                        .frame(width: 310, height: 56)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                }
                            }.isDetailLink(false)
                        }
                    }
                    
                }
            }
        
        }
    }
}

struct PhoneNoType_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNoType()
    }
}
