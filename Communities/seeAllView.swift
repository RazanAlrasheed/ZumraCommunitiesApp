//
//  seeAllView.swift
//  Zumra
//
//  Created by Razan bin rashed on 20/06/1443 AH.
//

import SwiftUI

struct seeAllView: View {
    @EnvironmentObject var user: User
    var newList : [String:String]
    var title : String
    let columns = Array(repeating: GridItem(.fixed(175)), count: 2)
    var body: some View {
        let keys = newList.map{$0.key}
        let values = newList.map{$0.value}
   
            
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(keys.indices) { index in
                        
                        if(title != "Top Search Category"){
                            if user.IsLogin {
                                NavigationLink(
                                    destination: CommunityPage(TitleName: "\(values[index])", imageTitle: "\(values[index])")){
                                        VStack(alignment: .leading){
                                            ZStack{
                                                Image("\(values[index])")
                                                    .resizable()
                                                    .frame(width:170 , height:150)
                                                    .cornerRadius(8)
                                                
                                            }
                                            Text("\(values[index])")
                                                .font(.system(size: 16))
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                        
                                         
                                            Text("\(keys[index])")
                                                .font(.system(size: 16))
                                                .foregroundColor(.gray)
                                        
                                             
                                        }
                                 }
                            }else{
                                NavigationLink(
                                    destination: CommunityPageGuest(TitleName: "\(values[index])", imageTitle: "\(values[index])")){
                                        VStack(alignment: .leading){
                                            ZStack{
                                                Image("\(values[index])")
                                                    .resizable()
                                                    .frame(width:170 , height:150)
                                                    .cornerRadius(8)
                                                
                                            }
                                            Text("\(values[index])")
                                                .font(.system(size: 16))
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                        
                                         
                                            Text("\(keys[index])")
                                                .font(.system(size: 16))
                                                .foregroundColor(.gray)
                                        
                                             
                                        }
                                 }
                            }
                            
                        }else {
                            VStack(alignment: .leading){
                                ZStack{
                                    Image("\(values[index])")
                                        .resizable()
                                        .frame(width:170 , height:150)
                                        .cornerRadius(8)
                                    
                                }
                                Text("\(values[index])")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                           }
                            
                        }
                        
            
                    
                }
                .padding(.top)
                
            }
   
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("\(title)")
    }
    }

}
struct seeAllView_Previews: PreviewProvider {
    static var previews: some View {
        seeAllView( newList: OurPicksList, title: "Our Picks" )
    }
}
