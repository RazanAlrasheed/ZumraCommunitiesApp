//
//  seeAllView.swift
//  Zumra
//
//  Created by Razan bin rashed on 20/06/1443 AH.
//

import SwiftUI

struct SALView: View {
    @EnvironmentObject var user: User
    var AllCommunitiesForCategory : [String]
    var communityName: String
    var communityImage: String
    let columns = Array(repeating: GridItem(.fixed(175)), count: 2)
    var body: some View{
//      let keys = AllCommunitiesForCategory.map{$0.key}
//      let values = AllCommunitiesForCategory.map{$0.value}
//
            
            ScrollView {
                LazyVGrid(columns: columns){                 ForEach(AllCommunitiesForCategory.indices) { index in
                        
//                        if(title != "Top Search Category"){
//                            if user.IsLogin {
                                NavigationLink(
                                    destination: CommunityPage(TitleName: "\(AllCommunitiesForCategory[index])", imageTitle: "\(AllCommunitiesForCategory[index])").environmentObject(user)
                                ){
                                        VStack(alignment: .leading){
                                            ZStack{
                                                Image("\(AllCommunitiesForCategory[index])")
                                                    .resizable()
                                                    .frame(width:170 , height:150)
                                                    .cornerRadius(8)
                                                
                                            }
                                            Text("\(AllCommunitiesForCategory[index])")
                                                .font(.system(size: 16))
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                        
                                         
//                                            Text("\(AllCommunitiesForCategory[index])")
//                                                .font(.system(size: 16))
//                                                .foregroundColor(.gray)
                                        
                                             
                                        }.padding()
                                 }
//                            }else{
//                                NavigationLink(
//                                    destination: CommunityPageGuest(TitleName: "\(values[index])", imageTitle: "\(values[index])").environmentObject(user)){
//                                        VStack(alignment: .leading){
//                                            ZStack{
//                                                Image("\(values[index])")
//                                                    .resizable()
//                                                    .frame(width:170 , height:150)
//                                                    .cornerRadius(8)
//
//                                            }
//                                            Text("\(values[index])")
//                                                .font(.system(size: 16))
//                                                .fontWeight(.bold)
//                                                .foregroundColor(.black)
//
//
//                                            Text("\(keys[index])")
//                                                .font(.system(size: 16))
//                                                .foregroundColor(.gray)
//
//
//                                        }
//                                 }
//                            }
                            
//                        }else {
//                            VStack(alignment: .leading){
//                                ZStack{
//                                    Image("\(values[index])")
//                                        .resizable()
//                                        .frame(width:170 , height:150)
//                                        .cornerRadius(8)
//                                    
//                                }
//                                Text("\(values[index])")
//                                    .font(.system(size: 16))
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.black)
//                           }
                            
//                        }
                        
            
                    
//                }
                .padding(.top)
                
            }
   
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("\(communityName)")
    }
    }

    }
}
struct SALView_Previews: PreviewProvider {
    static var previews: some View {
        SALView(AllCommunitiesForCategory: TV_Film, communityName: "", communityImage: "")
    }
}
