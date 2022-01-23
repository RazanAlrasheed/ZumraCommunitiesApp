//
//  ExploreView.swift
//  Zumra
//
//  Created by Razan bin rashed on 19/06/1443 AH.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Divider().padding(.horizontal)
                ourPicksComponent()
                
                Divider().padding([.top, .leading, .trailing])

                latestCommunitiesComponent()
                
                Divider().padding([.top, .leading, .trailing])
                        
                topSearchCategoryComponent()
                
                
                Divider().padding([.top, .leading, .trailing])
                
                
                topSearchCommunitiesComponent()
                
                
                .navigationTitle("Explore")
            }
        }

    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
struct titleOf : View {
    var title : String
    var body : some View {
        HStack{
            Spacer() .frame(width:20)
            Text("\(title)")
                .font(.headline)
            Spacer()
           
            
            if( title == "Our Picks" ){
                    NavigationLink(destination: seeAllView( newList: OurPicksList, title: "Our Picks" ) , label: {  Text("See All")
                            .fontWeight(.bold)
                            .foregroundColor(Color(UIColor(named:"ourOrange")!))
                            .font(.callout) })
            }
            
            else if( title ==  "Latest Communities" ) {
                    NavigationLink(destination: seeAllView( newList: LatestCommunitiesList, title: "Latest Communities" ) , label: {  Text("See All")
                            .fontWeight(.bold)
                            .foregroundColor(Color(UIColor(named:"ourOrange")!))
                            .font(.callout) })

            }
            else if( title == "Top Search Category") {
                    NavigationLink(destination: seeAllView( newList: TopCategory , title: "Top Search Category" ) , label: {  Text("See All")
                            .fontWeight(.bold)
                            .foregroundColor(Color(UIColor(named:"ourOrange")!))
                            .font(.callout) })

            }
            
            else if( title == "Top Communities" ) {
                NavigationLink(destination: seeAllView( newList: TopCommunitiesList, title: "Top Communities" ) , label: {  Text("See All")
                        .fontWeight(.bold)
                        .foregroundColor(Color(UIColor(named:"ourOrange")!))
                        .font(.callout) })
            }
                       Spacer()
                .frame(width:20)
        }
        
    }
}


struct ourPicksComponent : View {
    let keys = OurPicksList.map{$0.key}
    let values = OurPicksList.map{$0.value}
    var body: some View {
        titleOf(title: "Our Picks")
            .padding(.top)
        
        ScrollView(.horizontal , showsIndicators: false){
            HStack{
  
                Spacer()
                    .frame(width:20)
                
                ForEach(keys.indices) { index in
                    NavigationLink(
                        destination: Text("\(values[index])")){
                            ZStack(alignment: .bottom){

                                Image("\(values[index])")
                                    .resizable()
                                    .frame(width:309 , height:170)
                                    .cornerRadius(8)


                                Rectangle()
                                    .frame(width:276 , height:49 )
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                    .blur(radius: 20.0)


                                VStack(alignment:.leading){
                                    Text("\(values[index])")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)



                                    Text(keys[index])
                                        .foregroundColor(Color(hue: 1.0, saturation: 0.011, brightness: 0.851, opacity: 100.0))

                                }
                                .padding([.leading, .bottom], 10.0)
                                .font(.system(size: 16))
                                .frame(width: 309, alignment: .leading)



                            }

                        
                    }

                }
                Spacer()
                
            }}

    
    }
}

struct latestCommunitiesComponent : View {
    let keys = LatestCommunitiesList.map{$0.key}
    let values = LatestCommunitiesList.map{$0.value}

    var body: some View{
        titleOf(title: "Latest Communities")
        
        ScrollView(.horizontal , showsIndicators: false){
            
            

            HStack{
                Spacer()
                    .frame(width:20)
                
                
                ForEach(keys.indices) { index in
                    NavigationLink(
                        destination: Text("\(values[index])")){
                            VStack(alignment: .leading){
                                ZStack{
                                    Image("\(values[index])")
                                        .resizable()
                                        .frame(width:200 , height:200)
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
                         
                            
                            Spacer()
                                .frame(width:16)
                
            } }
        }
        
    }
}
}
struct topSearchCategoryComponent : View {
 //   let index = TopCategory.map{$0}
    let keys = TopCategory.map{$0.key}
    let values = TopCategory.map{$0.value}
    var body: some View{
        titleOf(title: "Top Search Category")
        
        ScrollView(.horizontal , showsIndicators: false) {
            HStack{
                Spacer()
                    .frame(width:20)
//                ForEach(index , id: \.self) { index in
                
                ForEach(keys.indices) { index in
              
                
                    ZStack(alignment: .bottomLeading){
                        Image("\(values[index])")
                            .resizable()
                            .scaledToFill()
                            .frame(width:100,height:100)
                            .cornerRadius(8)
                        
                        Rectangle()
                            .frame(width:100,height:100)
                            .cornerRadius(8)
                            .opacity(0.15)
                        
                        
                        Text("\(values[index])")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.system(size:15))
                            .padding(7.0)
                        
                    }
                    
                    
                    Spacer()
                        .frame(width:16)
                    
                
                }
//
//
//                ZStack(alignment: .bottomLeading){
//                    Image("Games")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width:100,height:100)
//                        .cornerRadius(8)
//
//                    Rectangle()
//                        .frame(width:100,height:100)
//                        .cornerRadius(8)
//                        .opacity(0.15)
//
//
//                    Text("Games")
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .font(.system(size:15))
//                        .padding(7.0)
//
//
//
//                }
//
//
//
//                Spacer()
//                    .frame(width:16)
//
//
//                ZStack(alignment: .bottomLeading){
//                    Image("Sport")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width:100,height:100)
//                        .cornerRadius(8)
//
//                    Rectangle()
//                        .frame(width:100,height:100)
//                        .cornerRadius(8)
//                        .opacity(0.15)
//
//
//                    Text("Sport")
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .font(.system(size:15))
//                        .padding(7.0)
//                }
//
//
//                Spacer()
//                    .frame(width:16)
//
//
//                ZStack(alignment: .bottomLeading){
//                    Image("Art")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width:100,height:100)
//                        .cornerRadius(8)
//
//                    Rectangle()
//                        .frame(width:100,height:100)
//                        .cornerRadius(8)
//                        .opacity(0.15)
//
//
//                    Text("Art")
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .font(.system(size:15))
//                        .padding(7.0)
//
//                }
            }
        }
    }
}

struct topSearchCommunitiesComponent : View {
    let keys = TopCommunitiesList.map{$0.key}
    let values = TopCommunitiesList.map{$0.value}

    var body: some View{
        
        titleOf(title: "Top Communities")
        
        ScrollView(.horizontal , showsIndicators: false){
            
            

            HStack{
                Spacer()
                    .frame(width:20)
                
                
                ForEach(keys.indices) { index in
              
                
                VStack(alignment: .leading){
                    ZStack{
                        Image("\(values[index])")
                            .resizable()
                            .frame(width:200 , height:200)
                            .cornerRadius(8)
                        
                    }
                    Text("\(values[index])")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    
                    
                    Text("\(keys[index])")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
             
                
                Spacer()
                    .frame(width:16)
            } }
        }
    }
}
 
