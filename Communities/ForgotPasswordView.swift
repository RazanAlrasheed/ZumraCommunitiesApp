//
//  ForgotPasswordView.swift
//  B8050
//
//  Created by Buthaina Albassam on 25/01/22.
//

import SwiftUI

struct ForgotPasswordView: View {

    @State private var username = String()
    @State private var password = String()

    @State private var isLoggedIn: Bool = false
    @State private var isSignUp: Bool = false

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
                                Text("Recover Password")
                                    .font(.largeTitle).bold()
                                    .padding(.bottom, 1)
                                    .padding([.bottom], 50)
                            }

                            Group {
                               
                                // Password Textfield
                                SecureField("Email", text: $password)
                                    .defaultTextStyle()
                                    .textContentType(.password)
                                    .padding([.bottom], 10)

                              
                            }

                            // Login button
                            Button {
                                
                            } label: {
                                Text("Reset Password")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 52)
                                    .font(.system(size: 18, weight: .bold))
                            }
                            .buttonStyle(OrangeButton())
                            .padding([.leading, .trailing], 16)
                            .fullScreenCover(isPresented: $isLoggedIn) {
                                EmptyView()
                            }

                            Group {
                                
                                

                                // Signup view
                                HStack {
                                   

                                    Button {
                                        isSignUp.toggle()
                                    } label: {
                                        Text("Cancel")
                                            .padding()
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
        
    }

    /// Sign in with Apple
    ///
    private func doAppleAuthorisation() {
        print("Authorisation Clicked")
    }
}

struct ForgotPasswordViewView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
    }
}
