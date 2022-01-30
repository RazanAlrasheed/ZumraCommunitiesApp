//
//  AccountView.swift
//  Zumra
//
//  Created by Razan bin rashed on 23/06/1443 AH.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView{
        Form{
            Section(header:Text("Account").fontWeight(.semibold).foregroundColor(.black)){
                NavigationLink(destination: MyProfileView()){
                HStack{
                    VStack(alignment: .leading){
                        
                        Text("Nora Salem")
                        Text("@nora_33")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
//                    Image(systemName: "chevron.right")
//                        .foregroundColor(Color.gray)
//                }.padding(.vertical, 4.0)
                }}
                NavigationLink(destination: ChatView()){
                HStack{
                    VStack(alignment: .leading){
                        
                        Text("Chats")
                   
                    }
                    Spacer()
//                    Image(systemName: "chevron.right")
//                        .foregroundColor(Color.gray)
//                }.padding(.vertical, 4.0)
                }}
//                HStack{Text("Chats")
//                    Spacer()
//                    Image(systemName: "chevron.right")
//                        .foregroundColor(Color.gray)
//                }
                HStack{Text("Notifications")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.gray)
                }
            
            }
            Section(header:Text("Settings").fontWeight(.semibold).foregroundColor(.black)){
                HStack{
             Text("Privacy and Security")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.gray)
                }
                HStack{Text("Help")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.gray)
                }
                HStack{Text("About")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.gray)
                }
            }
            Section{Text("Sign Out")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                    .frame(width: 300.0)
            }
        }
//        .navigationBarHidden(true)
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
        
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
