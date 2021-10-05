//
//  ButtonIncrement.swift
//  All Desgins
//
//  Created by Happy on 10/03/21.
//

import SwiftUI

struct ButtonIncrement: View {
    @State var counter = 0
    var body: some View {
        VStack {
            Text("Counter value: \(self.counter)")
                .foregroundColor(.blue)
            
            Button(action: {
                self.counter += 1
            }) {
                HStack {
                    Image(systemName: "plus")
                    Text("Increment")
                }.padding(10.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2.0)
                )
            }
            
            Spacer()
        }
    }
}

struct ButtonIncrement_Previews: PreviewProvider {
    static var previews: some View {
        ButtonIncrement()
    }
}
