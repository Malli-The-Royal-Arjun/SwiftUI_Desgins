//
//  Gender.swift
//  PhoneNumber
//
//  Created by Happy on 03/03/21.
//

import SwiftUI

struct Gender: View {
    @State var genderArray = ["Male", "Female", "others"]
    @State var selectedIndex = 0
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedIndex, label: Text("Select Gender")) {
                        ForEach(0 ..< genderArray.count) {
                            Text(self.genderArray[$0])
                        }
                  }
                Text("Your gender is \(genderArray[selectedIndex])")
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.blue, .red, .green]), startPoint: .leading, endPoint: .trailing))
                    .font(.title)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
             }.navigationBarTitle(Text("Gender"), displayMode: .inline)
        }
        }
    }
}

struct Gender_Previews: PreviewProvider {
    static var previews: some View {
        Gender()
    }
}
