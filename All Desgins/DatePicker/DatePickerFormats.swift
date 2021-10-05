//
//  DatePickerFormats.swift
//  All Desgins
//
//  Created by Happy on 10/03/21.
//

import SwiftUI

struct DatePickerFormats: View {
    let dateFormatter1: DateFormatter = {
            let formatter = DateFormatter()
        let date = Date(timeIntervalSinceReferenceDate: 118800)
        formatter.dateFormat = "yyyy"
        let year: String = formatter.string(from: date)
            return formatter
        }()
    
    let dateFormatter2: DateFormatter = {
            let formatter = DateFormatter()
        let date = Date(timeIntervalSinceReferenceDate: 118800)
        formatter.dateFormat = "MMM"
        let month: String = formatter.string(from: date)
            return formatter
        }()
    
    let dateFormatter3: DateFormatter = {
            let formatter = DateFormatter()
        let date = Date(timeIntervalSinceReferenceDate: 118800)
        formatter.dateFormat = "dd"
        let day: String = formatter.string(from: date)
            return formatter
        }()

        @State var birthDate = Date()
    
    @State var openCalender = false
    
    @State var date = ""
    var body: some View {
        VStack(spacing: 20){
            Button(action: {
                self.openCalender = true
            }){
               Text("Calendar")
            }
            
            if(openCalender){
            DatePicker("Select", selection: $birthDate, in: ...Date(), displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
                Text("ok")
                    .onTapGesture {
                        self.openCalender = false
                    }
            }
            if(self.openCalender == false){
                HStack{
                    Text("\(birthDate, formatter: dateFormatter1)")
                    Spacer()
                    Text("\(birthDate, formatter: dateFormatter2)")
                    Spacer()
                    Text("\(birthDate, formatter: dateFormatter3)")
                }.frame(width: UIScreen.main.bounds.width-120, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                HStack{
                    Rectangle()
                        .frame(width: 40, height: 2, alignment: .center)
                    Spacer()
                    Rectangle()
                        .frame(width: 40, height: 2, alignment: .center)
                    Spacer()
                    Rectangle()
                        .frame(width: 40, height: 2, alignment: .center)
                }.frame(width: UIScreen.main.bounds.width-120, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
                HStack{
                    VStack{
                    HStack{
                    TextField("\(birthDate, formatter: dateFormatter3)", text: $date)
                        
                        .foregroundColor(.blue)
                        .background(Color.gray)
                        .frame(width: 30, height: 30, alignment: .center)
                        Image(systemName: "xmark")
                            .onTapGesture {
                                self.openCalender = true
                            }
                    }
                    Rectangle()
                    .frame(width: 60, height: 2, alignment: .center)
                }
                    Spacer()
                    TextField("\(birthDate, formatter: dateFormatter2)", text: $date)
                        .background(Color.gray)
                        .onTapGesture {
                            self.openCalender = true
                        }
                    Spacer()
                    TextField("\(birthDate, formatter: dateFormatter1)", text: $date)
                        .background(Color.gray)
                        .onTapGesture {
                            self.openCalender = true
                        }
                }.frame(width: UIScreen.main.bounds.width-120, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
}

struct DatePickerFormats_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerFormats()
    }
}
