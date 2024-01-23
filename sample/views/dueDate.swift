//
//  dueDate.swift
//  sample
//
//  Created by Paul, Debojyoti on 22/01/24.
//

import SwiftUI

struct dueDate: View {
    @State var due:String?
     var alt  = "No date selected"
    @State private var showAlert = false
    var body: some View {
        Button(action: {
            showAlert=true
        }, label: {
            Text("Due Date")
                .foregroundStyle(Color.red)
                .bold()
        })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Alert ").foregroundStyle(Color.red),
                message: Text(" Due Date is :\(due ?? alt)")
               )}
        
    }
}

#Preview {
    dueDate(due:String())
}
