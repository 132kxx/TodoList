//
//  AddView.swift
//  TodoList
//
//  Created by kxx: on 2023/03/02.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss

    // for alert
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(minHeight: 55)
                    .background(Color.gray.brightness(0.35))
                    .cornerRadius(10)
                
                // save button
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                }
                .disabled(textIsAppropriate() ? false : true)
                .alert(isPresented: $showAlert) {
                    getAlert()
                }
                
                

            }
            .padding(14)
            
        }
        
        .navigationTitle("Add an item 🖋️")
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            textFieldText = ""
            dismiss()
        } else {
            alertTitle = "Text is too Short! Have to type more"
            showAlert.toggle()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 4 {
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
