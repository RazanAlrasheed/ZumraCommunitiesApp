//
//  EditMyProfileView.swift
//  Zumra
//
//  Created by Razan bin rashed on 19/06/1443 AH.
//

import SwiftUI

struct EditMyProfileView: View {
    @State var Name: String = ""
    @State var UserName: String = ""
    @State var Email: String = ""
    @State var Bio: String = ""
    @State var Location: String = ""
    var body: some View {
        NavigationView{
            VStack( spacing: 15.0){
                ZStack(alignment: .bottomTrailing){
                    Button(action: {
                       
                    }){
                        Image("ProfileImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 176, height: 176)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 5))
                            .padding(.top, -87.0)
                    }
                    Image(systemName: "plus")
                        .frame(width: 35, height: 35)
                        .background(Color.accentColor)
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                }
                TextField("Name", text: $Name)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .frame(width: 343.0, height: 50.0, alignment: .leading)
                      
                TextField("UserName", text: $UserName)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .frame(width: 343.0, height: 50, alignment: .leading)
                      
                TextField("Email", text: $Email)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .frame(width: 343.0, height: 50, alignment: .leading)
                
                TextField("Bio", text: $Bio)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .frame(width: 343.0, height: 50, alignment: .leading)
                TextField("Location", text: $Location)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .frame(width: 343.0, height: 50, alignment: .leading)
                       Spacer()
            }
        }.navigationTitle("Edit Profile")
            .navigationBarItems(trailing:
                                Text("Done").foregroundColor(Color.accentColor)
                      )
    }
}

struct EditMyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditMyProfileView()
    }
}
