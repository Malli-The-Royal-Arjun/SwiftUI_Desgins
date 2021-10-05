//
//  ContentView.swift
//  All Desgins
//
//  Created by Happy on 09/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
        PhoneNoType()
//        PhoneCodeTap()
//            TypesOfSheets()
//            Gender()
//            CardStackView()
//
//            ShapeofHex()
//                .offset(y: 20)
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
