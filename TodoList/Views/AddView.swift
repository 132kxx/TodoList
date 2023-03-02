//
//  AddView.swift
//  TodoList
//
//  Created by kxx: on 2023/03/02.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("typing here", text: $textFieldText)
                    .padding(.horizontal)
                    .cornerRadius(10)
                
                Button {
                    //
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                }
            }
            .padding(14)

        }

        
        .navigationTitle("Add an Item")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
    }
}

