//
//  LoginViewController.swift
//  All Desgins
//
//  Created by Happy on 10/03/21.
//

import UIKit
struct Verification:Codable{
    var message : String
    var type : String
}
struct OTP:Codable{
    var request_id : String
    var type : String
}

class LoginViewController: UIViewController, ObservableObject {
    
//    @Published var login = LoginStatus().defaults.bool(forKey: "login")
    @Published var error = false
    @Published var loading = false
    @Published var networkConnection = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func sendOTP(endPoint : String, loginViewController: LoginViewController){
        //        var reverseGeoCoding = reverse
        let url = URL(string: "https://api.msg91.com/api/v5\(endPoint)")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            do {
                let todoDetails = try JSONDecoder().decode(OTP.self, from: data)
                DispatchQueue.main.async {
                    if(todoDetails.type == "success"){
                        
                    }
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }

}
