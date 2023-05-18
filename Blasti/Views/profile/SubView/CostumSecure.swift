//
//  CostumSecure.swift
//  Blasti
//
//  Created by Siwar Nafti on 18/5/2023.
//



import Foundation
import SwiftUI

struct CostumSecure: View {
    
    var leftIcon : String = ""
    
    var placeHolder : LocalizedStringKey = ""
    
    
    @State private var isEditing = false
    @State private var edges = EdgeInsets(top: 0, leading:45, bottom: 0, trailing: 0)
    
    
    private enum Field : Int, Hashable {
        case fieldName
    }
    
    @Binding var password: String
    @State private var secured = true
    
    @FocusState private var focusField : Field?
    var body: some View {
        ZStack(alignment : .leading) {
            ZStack{
                
                
                if secured{
                    SecureField(placeHolder,text:$password)
                        .font(.title3)
                        .padding()
                        .cornerRadius(10.0)
                        .shadow(color: Color.white.opacity(0.3), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                    //                        .padding(.vertical)
                }
                
                else{
                    TextField(placeHolder, text: $password)
                        .font(.title3)
                        .padding()
                        .cornerRadius(10.0)
                        .shadow(color: Color.white.opacity(0.3), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                    
                        .focused($focusField, equals: .fieldName)
                    
                }
                HStack{
                    Spacer()
                    Button {
                        secured.toggle()
                    } label: {
                        Image(systemName: secured ? "eye.slash" : "eye")
                            .foregroundColor(secured ? Color("rev"): Color("rev"))
                        
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }.padding()
                
            }
            
        }
    }
}



