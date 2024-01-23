//
//  eachRow.swift
//  sample
//
//  Created by Paul, Debojyoti on 22/01/24.
//

import SwiftUI

struct eachRow: View {
    var isCompleted=false
    var title:String
      var desc:String
    var date:Date
    var body: some View {
        HStack{
            Image(systemName: isCompleted ? "checkmark.circle" :"circle")
                .foregroundColor(isCompleted ? .green:.red)
            VStack{
                Text(title)
                    .font(.title2)
                    .padding(.vertical,8)
                HStack{
                    Text(desc)
                    Spacer()
                    dueDate()
                }
            }
            
            Spacer()
        }
       
    }
}


#Preview {
    eachRow(title: String(), desc: String(), date: Date())
}
