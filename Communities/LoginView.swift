//
//  LoginView.swift
//  Zumra
//
//  Created by Razan bin rashed on 23/06/1443 AH.
//

import SwiftUI

struct LoginView: View {

    @State private var username = String()
    @State private var password = String()

    @State private var isLoggedIn: Bool = false
    @State private var isSignUp: Bool = false
    @State var uiTabarController: UITabBarController?
    init() {
        UIScrollView.appearance().bounces = false
    }

    var body: some View {
       
            GeometryReader { gr in
                VStack {
                    ScrollView {
                        VStack {
                            // Top graphics
                            Image(uiImage: UIImage(named: "Top")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)

                            Spacer()

                            Group {
                                // Headers
                                Text("Login")
                                    .font(.largeTitle).bold()
                                    .padding(.bottom, 1)
                                Text("Sign in to continue")
                                    .font(.callout)
                                    .padding(.top, 1)
                            }

                            Group {
                                // Username Textfield
                                TextField("Username or email", text: $username)
                                    .defaultTextStyle()
                                    .textContentType(.username)
                                    .keyboardType(.emailAddress)
                                    .padding([.bottom, .top], 10)


                                // Password Textfield
                                SecureField("Password", text: $password)
                                    .defaultTextStyle()
                                    .textContentType(.password)

                                // Forgot button
                                HStack() {
                                    Spacer()
                                    NavigationLink(destination: ForgotPasswordView()) {
                                        Text("Forgot password?")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15))
                                    }
                                    .padding()
                                }
                            }

                            // Login button
                            Button {
                                isLoggedIn.toggle()
                            } label: {
                                Text("Login")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 52)
                                    .font(.system(size: 18, weight: .bold))
                            }
                            .buttonStyle(OrangeButton())
                            .padding([.leading, .trailing], 16)
                            .fullScreenCover(isPresented: $isLoggedIn) {
                                CommunitiesUIView()
                            }
                            

                            Group {
                                // Other login options
                                Text("Or sign in with :").padding(.top, 20)

                                Button {
                                    doAppleAuthorisation()
                                } label: {
                                    Image(uiImage: UIImage(named: "SignInApple")!)
                                        .background(Color.primary) // Color of the border
                                        .cornerRadius(10.0)
                                }

                                // Signup view
                                HStack {
                                    Text("Don’t have an account?")
                                        .foregroundColor(.secondary)
                                        .font(.system(size: 15, weight: .regular))

                                    Button {
                                        isSignUp.toggle()
                                    } label: {
                                        Text("Sign up")
                                            .foregroundColor(Color("OrangeColor"))
                                            .font(.system(size: 15))
                                    }
                                    .fullScreenCover(isPresented: $isSignUp) {
                                        SignUpView(isLogin: $isSignUp)
                                    }
                                }
                            }

                            Spacer()

                            // Bottpm graphics
                            HStack {
                                Image(uiImage: UIImage(named: "Bottom")!)
                                Spacer()
                            }
                        }
                        .frame(minHeight: gr.size.height)
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        
    }

    /// Sign in with Apple
    ///
    private func doAppleAuthorisation() {
        print("Authorisation Clicked")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
    }
}
