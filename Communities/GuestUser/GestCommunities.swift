//
//  SwiftUIView.swift
//  Zumra
//
//  Created by Razan bin rashed on 16/06/1443 AH.
//

import SwiftUI

struct GestCommunities: View {
    @State var ProfileIsOpen : Bool = false
    @State var GoLogin : Bool = false
    @State private var actionState: Int? = 0
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack(alignment: .bottom){
                        Text("Communities")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top, 30.0)
                        Spacer()
//button
//                        Button {
//                            ProfileIsOpen.toggle()
//                        } label: {
//                            Image(systemName: "person.circle.fill")
//                                .font(.largeTitle)
//                        }
//                        .fullScreenCover(isPresented: $ProfileIsOpen) {
//                            LoginView()
//                        }
// nav
                        NavigationLink(destination: LoginView()){
                            Image(systemName: "person.circle.fill")
                                .font(.largeTitle)

                        }
//
                    }.padding()
                    Divider().padding(.horizontal)
                    VStack{
                        Text("Looking for communities?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.bottom, 2.0)
                    
                        Text("The communities you join will apear here.")
                            .font(.headline)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 2.0)
                            .frame(width:300)
                        
                    }.frame(height: 300, alignment: .bottom)
                }
            }
            .navigationBarHidden(true)
        }
        
       
      

          }
    
        }
  

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GestCommunities()
    }
}

struct login : View{
    var body: some View{
        Text("Login")
    }
}
