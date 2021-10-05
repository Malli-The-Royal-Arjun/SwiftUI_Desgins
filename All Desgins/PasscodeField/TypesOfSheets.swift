//
//  TypesOfSheets.swift
//  PhoneNumber
//
//  Created by Happy on 03/03/21.
//

import SwiftUI
import Combine

struct Message: Identifiable {
    let id = UUID()
    let text: String
}


struct TypesOfSheets: View {
    @State private var showActionSheet = false
    @State private var showSheet = false
    @State private var message: Message? = nil
    @State private var showModal = false
    @State private var showPopover: Bool = false
    var body: some View {
        VStack{
            Button("droparrow"){
                self.showActionSheet = true
            }
            
            Button("sheet"){
                self.showSheet = true
            }
            
            Button("Show alert") {
                self.message = Message(text: "Hi!")
            }
            
            Button("Show modal") {
                self.showModal = true
            }
            
            Button("Show popover") {
                self.showPopover = true
            }
        }
        
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text("Actions"),
                message: Text("Available actions"),
                buttons: [
                    .cancel { print(self.showActionSheet) },
                    .default(Text("Action")),
                    .destructive(Text("Delete"))
                ]
            )
        }
        
        .sheet(isPresented: $showSheet ) {
            ForEach(0..<20){_ in
                Text("Image")
            }
            Button("ok"){
                self.showSheet = false
            }
        }
        
        .alert(item: $message) { message in
            Alert(
                title: Text(message.text),
                dismissButton: .cancel()
            )
        }
        
        .sheet(isPresented: $showModal, onDismiss: {
            print(self.showModal)
        }) {
            ModalView(message: "This is Modal view")
        }
        
        .popover(
            isPresented: self.$showPopover,
            arrowEdge: .bottom
        ) { Text("Popover") }
        
    }
}

struct TypesOfSheets_Previews: PreviewProvider {
    static var previews: some View {
        TypesOfSheets()
    }
}

struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    let message: String
    
    var body: some View {
        VStack {
            Text(message)
            Button("Dismiss") {
                //                self.presentation.value.dismiss()
            }
        }
    }
}
