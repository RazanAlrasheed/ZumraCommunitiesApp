//
//  CommunityPage.swift
//  Zumra App
//
//  Created by Farah Ashraf on 21/01/2022.
//

import SwiftUI

struct CommunityPage: View {
    @EnvironmentObject var user: User
    var TitleName : String
    var imageTitle :String
    
    init(TitleName: String , imageTitle : String ){
        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor :UIColor .white], for: .selected)
        self.TitleName = TitleName
        self.imageTitle = imageTitle
    }
    @State private var pageMode = 0
    @State var isJoined : Bool=false
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                
                ZStack(alignment:.bottom){
                    Image("\(imageTitle)")
                        .resizable()
                        .frame(width: 390.0, height: 451.0)
                    VStack(alignment: .leading, spacing: 15.0){
                        HStack{
                            Text("\(TitleName)")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                            
                            Image(systemName: "lock.open.fill")
                                .foregroundColor(Color.white)
                            Image("member3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 45.0, height: 45.0)
                               
                                .overlay(Image("member1")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(Circle())
                                            .frame(width: 45.0, height: 45.0)
                                            .padding(.leading, 40.0)
                                         
                                )
                            Circle()
                                .padding(.leading, -21.0)
                                .foregroundColor(.gray)
                                .frame(width: 30, height: 30)
                                .overlay(Text("+95").font(.caption2).padding(.leading, -20.0))
                            Spacer()
                        }
                        
                        Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. ")
                            .frame(width: 345, alignment: .leading)
                        //                            .padding(.trailing, 33.0)
                        
                        
                            .font(.callout)
                            .frame(width: 350.0, height: 48.0)
                            .foregroundColor(Color.white)
                        //                        .multilineTextAlignment(.leading)
                        
                        HStack(spacing:70){
                            Button(action:  {isJoined.toggle()}) {
                                if isJoined == false{
                                Image(systemName: "person.crop.circle.badge.plus")
                                    .foregroundColor(.white)
                                Text("Join")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                }
                                else{
                                    HStack(spacing:0){
                                    Image(systemName: "person.fill.checkmark")
                                        .foregroundColor(.white)
                                    Text("Joined")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    }
                                    
                                }
                            }  .frame(maxWidth: 170, maxHeight: 40)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("AccentColor"))
                                       )
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Image(systemName: "link.circle.fill")
                                    .foregroundColor(Color("AccentColor"))
                                Text("Invite")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("AccentColor"))
                                
                            }.background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .frame(width: 170.0, height: 40.0))
                            
                        }.padding(.trailing, 42.0)
                        
                    }.padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.black)
                                .opacity(0.5)
                                .blur(radius: 20.0)
                        )
//                        .background(LinearGradient(gradient: Gradient(colors: [.black, .black]), startPoint: .top, endPoint: .bottom)
//                                            .opacity(0.2))
                    
                    //
                    
                    
                    
                    
                    
                }
                
                
                VStack {
                    Picker("Page Mode", selection: $pageMode) {
                        Text("Posts").tag(0)
                        Text("Media").tag(1)
                        Text("Files").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    switch pageMode {
                    case 0 : PostsPage()
                    case 1 : MediaPage()
                    case 2 : FilesPage()
                    default:PostsPage()
                    }
                }
            }.navigationBarTitle("\(TitleName)",displayMode: .inline)
        }   .overlay(
            NavigationLink(destination:
//                            LoginView().environmentObject(user)
                                    CreatePostView(TitleName: "\(TitleName)", imageTitle: "\(imageTitle)")
            )
            { Image(systemName: "plus")
                    .foregroundColor(.white)
                    .background(Circle()
                                    .frame(width: 50.0, height: 50.0)
                                    .foregroundColor(.accentColor))
                    .padding()
            }.padding(), alignment: .bottomTrailing )
    }
    
    struct PostsPage : View{
        var body: some View{
            postsStructure(userName: "Nora Moore", ImageName: "member1", post: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.")
            Divider().padding()
            postsStructure(userName: "Alan Dymon", ImageName: "member2", post: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.",postImage: "postimage1")
            Divider().padding()
            postsStructure(userName: "Sara Smith ", ImageName: "member3", post: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.",postImage: "postimage2")
            
        }
    }
    
    
    struct MediaPage:View{
        
        @StateObject var mediaData = ViewModel()
        var body: some View{
            VStack{
                let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count:3)
                LazyVGrid(columns: columns, alignment: .center, spacing: 8, content: {
                    
                    ForEach(mediaData.allImages.indices,id: \.self){
                        index in GridImageView(index: index)
                        
                    }
                }).padding(.horizontal)
            }
            .overlay(
                // Image Viewer
                ZStack{
                    if mediaData.showImageViewer{
                        ImageView()
                    }
                }
                
            )
            .environmentObject(mediaData)
        }
    }
    
    
    struct FilesPage:View {
        //        @State var ListOfDates = ["7 May 2021","1 May 2021","7 May 2021","7 May 2021","6 May 2021","6 May 2021","5 May 2021","5 May 2021","5 May 2021","4 May 2021",]
        //        @State var ListOfNames = ["Traveling Rules","A.","Visa Approval","Bali Trip Coast","France","How to save money","AAA","V1"]
        
        var body: some View{
            VStack{
                filesStructure(date: "7 May 2021", fileName: "Traveling Rules")
                Divider()
                filesStructure(date: "7 May 2021", fileName: "A.")
                Divider()
                filesStructure(date: "7 May 2021", fileName: "Visa Approval")
                Divider()
                filesStructure(date: "6 May 2021", fileName: "Visa Approval")
                Divider()
                filesStructure(date: "7 May 2021", fileName: "Bali Trip Cost")
                
            }
            
            
            
            
            
        }
    }
}
struct CommunityPage_Previews: PreviewProvider {
    static var previews: some View {
        CommunityPage(TitleName: "", imageTitle: "")
        
    }
}


struct postsStructure : View{
    
    @State var isLiked : Bool = false
    @State var showCommentsSheet : Bool = false
    @State var isSaved : Bool = false
    var userName : String
    var ImageName : String
    var post : String
    var postImage:String?
    
    
    
    var body: some View{
        
        VStack(alignment: .leading){
            HStack(alignment: .top){
                Image(ImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 45.0, height: 45.0)
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

struct filesStructure :View{
    var date:String
    var fileName:String
    var body: some View{
        
        HStack{
            
            Image(systemName: "doc")
                .resizable()
                .frame(width: 23, height: 30)
            VStack(alignment: .leading){
                Text(date)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(Color.gray)
                Text(fileName)
                    .fontWeight(.bold)
                
            }
            
            Spacer()
            
        }.padding(.leading, 26.0)
            .padding(.vertical)
    }
}

