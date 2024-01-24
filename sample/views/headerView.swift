import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isForgotPasswordActive = false
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
                        TextField("Username", text: $username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)

                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)

                        
                        Button(action: {
                            // Perform login action
                        }) {
                            Text(buttonText)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
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
