//
//  ContentView.swift
//  Communities
//
//  Created by Razan bin rashed on 16/06/1443 AH.
//

import SwiftUI

enum Tabs : String{
    case communities
    case Explore
    case search
    
}
struct TabBarView: View {
    @EnvironmentObject var user: User
    
//       @State private var isSheetShown: Bool = false
        //isFirstLaunch will default to true until it is set to false in the sheet and
       //then stored in UserDefaults
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @State var selectedTab : Tabs = .communities
   
    var body: some View {
        if (user.IsLogin){
            TabView(selection: $selectedTab){
           CommunitiesUIView()
                .tabItem({
                    Image(systemName: "person.3.fill")
                    Text("Communities")
                })
                .tag(Tabs.communities)
               ExploreView()
      .tabItem({
                    Image(systemName: "safari.fill")
                    Text("Explore")
                })
                .tag(Tabs.Explore)
                
                SearchView()
                    .tabItem({
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                })
                .tag(Tabs.search)
                
                
            }
        }
        else{
        TabView(selection: $selectedTab){
            GestCommunities()
                .tabItem({
                    Image(systemName: "person.3.fill")
                    Text("Communities")
                })
                .tag(Tabs.communities)
            
               ExploreView()
      .tabItem({
                    Image(systemName: "safari.fill")
                    Text("Explore")
                })
                .tag(Tabs.Explore)
                
         SearchView()
                    .tabItem({
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                })
                .tag(Tabs.search)
                
                
            }
            .sheet(isPresented: $isFirstLaunch, content: {
                        VStack {
                            Text("Welcome to zumra")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .lineLimit(41)
                            HStack{
                                Image(systemName: "person.3.fill")
                                    .resizable()
                                    .foregroundColor(Color("AccentColor"))
                                    .frame(width: 51 , height: 24)
                                    .padding()
                                
                                VStack(alignment: .leading){
                                    Text("Communities")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 2.0)
                                        
                                    Text("Find people that share the same interest as you in a community.")
                                        .font(.body)
                                        .foregroundColor(Color.gray)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 2.0)
                                        .frame(width:250)
                                    
                                }
                                
                            }.padding()
                            HStack{
                                Image(systemName:"wand.and.stars.inverse")
                                    .resizable()
                                    .foregroundColor(Color("AccentColor"))
                                    .frame(width: 31 , height: 31)
                                    .padding()
                                
                                VStack(alignment: .leading){
                                    Text("Inspiration")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 2.0)
                                        
                                    Text("Get inspired by others experience and increase your passion.")
                                        .font(.body)
                                        .foregroundColor(Color.gray)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 2.0)
                                        .frame(width:250)
                                    
                                }
                                
                            }.padding()
                            HStack{
                                Image(systemName: "safari.fill")
                                    .resizable()
                                    .foregroundColor(Color("AccentColor"))
                                    .frame(width: 29 , height: 29)
                                    .padding()
                                
                                VStack(alignment: .leading){
                                    Text("Explore")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 2.0)
                                        
                                    Text("Browse for the newest and the most popular communities.")
                                        .font(.body)
                                        .foregroundColor(Color.gray)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 2.0)
                                        .frame(width:250)
                                    
                                }
                                
                            }.padding()
                            
                            Button {
                                 isFirstLaunch = false
                            
                            } label: {
                                Text("Continue")
                                    .fontWeight(.bold)
                                    .frame(width: 348, height: 50 , alignment: .center)
                                    .foregroundColor(.white)
                                    .background(Color("AccentColor"))
                                    .cornerRadius(8)
                                    
                            }
                            
                        }
                    })
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
