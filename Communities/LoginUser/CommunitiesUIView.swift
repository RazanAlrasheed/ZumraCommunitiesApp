//
//  CommunitiesUIView.swift
//  Zumra
//
//  Created by Razan bin rashed on 21/06/1443 AH.
//

import SwiftUI

struct CommunitiesUIView: View {
    let keys = TopCommunitiesList.map{$0.key}
    let values = TopCommunitiesList.map{$0.value}
    @State var ProfileIsOpen : Bool = false
    @EnvironmentObject var user: User
    var body: some View{
     NavigationView {
         ScrollView(.vertical , showsIndicators: false){
        VStack {
            HStack(alignment: .bottom){
                Text("Communities")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 30.0)
                Spacer()
                Button(action: {
                    ProfileIsOpen.toggle()
                }){
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
               }
            }
            .padding()
            Divider().padding(.horizontal)
            
            titleOf(title: "My communities")
            
             ScrollView(.horizontal , showsIndicators: false){
               HStack{
                        Spacer()
                            .frame(width:20)
                        
                        ExtractedView()
                        
                        Spacer()
                            .frame(width:20)

                        ForEach(keys.indices) { index in
                      
                            NavigationLink(
                                destination: CommunityPage(TitleName: "\(values[index])", imageTitle: "\(values[index])")){
                                    VStack(alignment: .leading){
                                        ZStack{
                                            Image("\(values[index])")
                                                .resizable()
                                                .frame(width:150 , height:150)
                                                .cornerRadius(8)
                                            
                                        }
                                        Text("\(values[index])")
                                            .font(.system(size: 12))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        
                                        
                                        Text("\(keys[index])")
                                            .font(.system(size: 10))
                                            .foregroundColor(.gray)
                                    }
                                 
                                    
                                    Spacer()
                                        .frame(width:16)
                        
                                  
                            }} }
                
             }
            HStack{
                Text("Recent Activites")
                    .font(.headline)
                    .padding(.horizontal)
                Spacer()
            }
            Divider()
            PostsPage()
            Spacer()
         }
         }
         .navigationBarHidden(true)
         .navigationTitle("Communities")
       }
     .sheet(isPresented: $ProfileIsOpen, content: {
         MyProfileView()
     })
    }
}

struct CommunitiesUIView_Previews: PreviewProvider {
    static var previews: some View {
        CommunitiesUIView()
    }
}

struct ExtractedView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: Text("Create community")){
                ZStack{
                    Rectangle()
                        .fill(Color.init(red: 316.0, green: 316.0, blue: 250.0))
                        .frame(width: 150, height: 150,alignment: .leading)
                        .cornerRadius(8)
                    
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(Color.accentColor)
                    
                }.shadow(color: .gray, radius: 0, x: 0, y: 0)
                    .padding(.bottom, 40)
            }

           
        }
    }
}

struct PostsPage : View{
    var body: some View{
        MyCommunitiesPostsStructure(userName: "Nora Moore", ImageName: "member1", post: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.",commImageName:"Travel")
        Divider().padding()
        MyCommunitiesPostsStructure(userName: "Alan Dymon", ImageName: "member2", post: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.",postImage: "postimage1",commImageName:"Food")
        Divider().padding()
        MyCommunitiesPostsStructure(userName: "Sara Smith ", ImageName: "member3", post: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.",postImage: "postimage2",commImageName:"Game")
        
    }
}

struct MyCommunitiesPostsStructure : View{
    
    @State var isLiked : Bool = false
    @State var showCommentsSheet : Bool = false
    @State var isSaved : Bool = false
    var userName : String
    var ImageName : String
   

    var post : String
    var postImage:String?
    var commImageName : String
    
    
    var body: some View{
        
        VStack(alignment: .leading){
            HStack(alignment: .top){
                HStack(alignment:.bottom,spacing: -10){
                    Image(commImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Rectangle())
                        .frame(width: 50.0, height: 51.0)
                        .cornerRadius(8)
                    Image(ImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 25.0, height: 25.0)
                        .shadow(color: .gray, radius: 1, x: 0, y: 0)
                }
                VStack(alignment: .leading){
                    Text(userName)
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 4.0){
                        Image(systemName: "globe.europe.africa.fill")
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.gray)
                        
                        
                        Text("3 hr ago")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                    }
                }
                Spacer()
                Image(systemName: "square.and.arrow.up")
                
            }.padding()
            Text(post)
                .font(.body)
                .padding(.horizontal)
            if postImage == nil{
                Text("")
            }
            else{
                Image(postImage!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 340, height: 232.0)
                    .padding(.leading, 23.0)
            }
            
            HStack{
                let randomInt = 3
                Button(action: {isLiked.toggle()}) {
                    
                    
                    if isLiked == false {
                        HStack{
                            Image(systemName: "suit.heart")
                                .resizable()
                                .frame(width: 20, height: 19)
                            .foregroundColor(.gray)
                            .font(.body)
                            
                        }
                        Text(String(randomInt))
                            .font(.caption)
                            .foregroundColor(Color.gray)
                    }
                    else {
                        HStack{
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 20, height: 19)
                                .foregroundColor(.red)
                            Text(String(randomInt+1))
                                .font(.caption)
                                .foregroundColor(Color.gray)
                        }
                    }
                    
                }
                
                
                
                Button(action: {showCommentsSheet.toggle()},label: {Image(systemName: "message")
                        .resizable()
                        .frame(width: 20, height: 19)
                        .foregroundColor(.gray)
                    
                }) .sheet(isPresented: $showCommentsSheet, content: {CommentsView()})
                    
                
                Text("2")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                Spacer()
                
                Button(action: {
                    isSaved.toggle()
                }){
                    if(isSaved){
                    Image(systemName: "bookmark.fill")
                    .foregroundColor(.black)
                    }
                    else {
                        Image(systemName: "bookmark")
                        .foregroundColor(.gray)
                    }
                    }
                }.padding()
            
            
        }
    }
}
