//
//  profile.swift
//  sample
//
//  Created by Paul, Debojyoti on 22/01/24.
//

import SwiftUI

struct profile: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.gray,.white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Image("download")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()

                Text("John Doe")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                Text("iOS Developer")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .padding(.bottom, 20)

                Divider()

                HStack {
                    Text("User ID:")
                        .font(.headline)
                        .padding(.top, 10)

                    Spacer()

                    Text("john.doe@example.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
                .padding()
                Spacer()

                Button(action: {
                                    // Handle logout action here
                                     // Update authentication state
                                }) {
                                    Text("Logout")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.red)
                                        .cornerRadius(10)
                                }
                                .padding()

                Spacer()
            }
            .padding()
        .navigationBarTitle("Profile")
        }
    }
}



#Preview {
    profile()
}
