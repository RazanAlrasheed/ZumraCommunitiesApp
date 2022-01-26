//
//  AccountView.swift
//  Zumra
//
//  Created by Razan bin rashed on 23/06/1443 AH.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
            ScrollView{
  
                Divider().padding([.top,.leading,.trailing])
                
                
                VStack(spacing: 5.0){
                    
                    
                    
                    Group{
                        HStack{
                            
                            VStack(alignment: .leading){
                                Text("Account")
                                
                                
                                    .padding(.top, 2.0)
                                
                                    .frame(width: /*@START_MENU_TOKEN@*/nil, height: 26.0/*@END_MENU_TOKEN@*/)
                                    .font(.headline)
                                
                                    .background(Color(hue: 1.0, saturation: 0.01, brightness: 0.828))
                                //                                      .listRowBackground(Color.gray)
                                
                                
                            }
                            Spacer()
                            VStack{
                                
                            }
                        }
                        Divider()
                    }
                    
                    Group{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Nora Salem")
                                Text("@noura_31")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            VStack{
                                Image(systemName:"chevron.right")
                                
                            }
                        }
                        Divider()
                    }
                    Group{
                        HStack{
                            NavigationLink(destination:Text("message")){
                                
                                VStack(alignment: .leading){
                                    Text("Chats")
                                }
                                Spacer()
                                VStack{
                                    Image(systemName:"chevron.right")
                                }
                            }
                        }
                        Divider()
                    }
                    
                    
                    
                    
                    
                    Group{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Notifications ")
                            }
                            Spacer()
                            VStack{
                                Image(systemName:"chevron.right")
                            }
                        }
                        Divider()
                    }
                    Group{
                        HStack{
                            VStack(alignment: .leading){
                                
                                
                                Text("Sittings")
                                    .padding(.top, 2.0)
                                    .frame(width: nil, height: 24.0)
                                    .background(Color(hue: 1.0, saturation: 0.01, brightness: 0.828))
                                
                                
                            }
                            Spacer()
                            VStack{
                                
                            }
                        }
                        Divider()
                    }
                    Group{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Privacy and Security  ")
                            }
                            Spacer()
                            VStack{
                                Image(systemName:"chevron.right")
                            }
                        }
                        Divider()
                    }
                    Group{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Help")
                            }
                            Spacer()
                            VStack{
                                Image(systemName:"chevron.right")
                            }
                        }
                        Divider()
                    }
                    Group{
                        HStack{
                            VStack(alignment: .leading){
                                Text("About")
                            }
                            Spacer()
                            VStack{
                                Image(systemName:"chevron.right")
                            }
                        }
                        Divider()
                    }
                    Group{
                        HStack{
                            VStack(alignment: .leading){
                                Text("")
                                    .frame(height: 26.0)
                            }
                            Spacer()
                            VStack{
                            }
                        }
                        Divider()
                    }
                    Group{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Sign Out")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.red)
                                
                                
                                
                            }
                            
                            Divider()
                        }
                    }
                    
                }
                
                
                
                
                .navigationTitle("Account")
                .navigationBarTitleDisplayMode(.inline)
                Divider()
                
                
                
            }
            
        }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
