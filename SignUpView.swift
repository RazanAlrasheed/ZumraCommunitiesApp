//
//  SignUpView.swift
//  B8050
//
//  Created by Buthaina Albassam on 25/01/22.

import SwiftUI

struct SignUpView: View {

    @State private var username = String()
    @State private var email = String()
    @State private var password = String()
    @State private var confirmPassword = String()

    @State private var isCreateAccount: Bool = false
    @Binding var isLogin: Bool

    var body: some View {
            GeometryReader { gr in
                VStack {
                    ScrollView {
                        VStack {
                            Image(uiImage: UIImage(named: "Top")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)

                            Spacer()

                            Group {
                                // Headers
                                Text("Sign up")
                                    .font(.largeTitle).bold()
                                    .padding(.bottom, 1)
                                Text("Fill your information to continue!")
                                    .font(.callout)
                                    .padding(.top, 1)
                            }

                            Group {
                                // Username Textfield
                                TextField("Username", text: $username)
                                    .defaultTextStyle()
                                    .textContentType(.username)
                                    .keyboardType(.emailAddress)
                                    .padding([.bottom, .top], 10)

                                // Email Textfield
                                TextField("Email", text: $email)
                                    .defaultTextStyle()
                                    .keyboardType(.emailAddress)
                                    .padding([.bottom], 10)

                                // Password Textfield
                                SecureField("Password", text: $password)
                                    .defaultTextStyle()
                                    .textContentType(.password)
                                    .padding([.bottom], 10)

                                // Password Textfield
                                SecureField("Confirm Password", text: $confirmPassword)
                                    .defaultTextStyle()
                                    .textContentType(.password)
                                    .padding([.bottom], 20)
                            }

                            // Login button
                            Button {
                                isCreateAccount.toggle()
                            } label: {
                                Text("Create Account")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 52)
                                    .font(.system(size: 18, weight: .bold))
                            }
                            .buttonStyle(OrangeButton())
                            .padding([.leading, .trailing], 16)
                            .fullScreenCover(isPresented: $isCreateAccount) {
                                EmptyView()
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
                                    Text("Already have an account?")
                                        .foregroundColor(.secondary)
                                        .font(.system(size: 15, weight: .regular))

                                    Button {
                                        isLogin.toggle()
                                    } label: {
                                        Text("Login")
                                            .foregroundColor(Color("OrangeColor"))
                                            .font(.system(size: 15))
                                    }
                                }
                            }

                            Spacer()
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
      
    }

    /// Sign in with Apple
    ///
    private func doAppleAuthorisation() {
        print("Authorisation Clicked")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(isLogin: .constant(false))
    }
}
