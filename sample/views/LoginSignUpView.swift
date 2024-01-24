//
//  LoginSignUpView.swift
//  sample
//
//  Created by Singh, Balwant on 24/01/24.
//

import SwiftUI

struct LoginView: View {
    @State var usernametextfield = ""
    @State var passwordtextfield = ""
    @State private var isForgotPasswordActive = false
    @State private var validateUser = false 
    @State private var createNewUser = false
    
    // ise toggle kr dia jayega jb b user validate hoga upon checking in our core date jaisa bhaiya bole the wo wala hi navigationLink use kia hu but depreciate dikha rha h
    
    @ObservedObject var usercredentialvm = UserCredentialsVM()
    
    let nowOnSignUpPage:Bool
    let title:String
    let buttonText:String
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Spacer()
                        .frame(height: 60)
                    Text(title)
                        .font(.largeTitle)
                        .bold()
                    
                    VStack(spacing: 20) {
                        TextField("Username", text: $usernametextfield)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        SecureField("Password", text: $passwordtextfield)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        
                        
                        
                        
                        
                        if nowOnSignUpPage{
                            
                            
                            NavigationLink(destination: LoginView(nowOnSignUpPage: false, title: "Log In", buttonText: "Login"),isActive: $createNewUser) {
                                Text(buttonText)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        
                                        
                                        usercredentialvm.saveUserCredentials(username: usernametextfield, password: passwordtextfield)
                                        createNewUser =  usercredentialvm.isValidEmail(email:usernametextfield)
                                        
                                    
                                        
                                        // we need to save data on this tap gesture calling the method created in usercredentialvm

                                    }
                            }
                        }
                        
                        
                        
                        if !nowOnSignUpPage{
                            NavigationLink(destination: tabView(),isActive: $validateUser) {
                                Text(buttonText)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        validateUser = usercredentialvm.validateUserCredentials(username: usernametextfield, password: passwordtextfield) && usercredentialvm.isValidEmail(email:usernametextfield)
// matching data from core data using method created in usercredentialvm                                 }
                                    }
                            }
                        }
                        
                        
                      
                        if !nowOnSignUpPage{
                            Text("don't have account?")
                            NavigationLink(destination: signUpView(), isActive: $isForgotPasswordActive) {
                                Text("sign up")
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isForgotPasswordActive = true
                                    }
                            }
                        }
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct signUpView: View {
    var body: some View {
        VStack {
            LoginView(nowOnSignUpPage:true, title: "Sign Up", buttonText: "sign up")
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(nowOnSignUpPage: false, title: "Log In", buttonText: "Login")
    }
}
