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
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("typing here", text: $textFieldText)
                    .padding()
                    .cornerRadius(10)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    }
                
                Button {
                    saveButtonPressed()
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
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            textFieldText = ""
            dismiss()
        } else {
            alertTitle =  "have to check"
            showAlert.toggle()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count > 3 {
            return true
        } else {
            return false
        }
    }

    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

