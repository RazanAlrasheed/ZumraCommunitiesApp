//
//  CommentsView.swift
//  Zumra App
//
//  Created by Farah Ashraf on 24/01/2022.
//

import SwiftUI
struct CommentsViewGuest:View{
    @State var textFieldText :String = ""
//    @State var isPostClicked : Bool = false
    @State var isGuest:Bool=false
    @State var commentsArray:[String]=[]
  
    var body: some View{
        
        VStack {
        
        Text("Comments")
            .font(.headline)
            .fontWeight(.bold)
            .padding(.top)
            
            DummyCommentsModelGuest(userName: "Nora Moore", profilePic: "member1", comment: "Wow nice trip I have been wanting to go there like FOREVER !!!")
        Divider()
            DummyCommentsModelGuest(userName: "Alan Dymon", profilePic: "member2", comment: "I Like the Pic 😲❤️")
            Divider()
            ForEach(commentsArray,id:\.self){
                comment in
                VStack(alignment: .leading) {
                    HStack{
                        Image("profilePic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 45.0, height: 45.0)
                        Text("Nora Saleem")
                            .fontWeight(.bold)
                       Spacer()

                    }

                }.padding(.horizontal, 16.0)
                    .padding(.top)
            }
          
            Spacer()
         
        }
        
        .alert("You’re not Logged in", isPresented: $isGuest) {
           Button("Log in") {
           }
           Button("Sign up") {
           }
           Button("Cancle", role: .cancel) { }
           
   
           }
    }
     
 
}

struct DummyCommentsModelGuest: View {
    @State var isGuest: Bool = false
    var userName:String
    var profilePic:String
    var comment:String
    var body: some View {
        
        VStack{
           
//            Spacer()
            
            VStack(alignment: .leading) {
                HStack{
                    Image(profilePic)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 45.0, height: 45.0)
                    Text(userName)
                        .fontWeight(.bold)
                   Spacer()
                    
                }
                
                HStack {
                    Text(comment)
                        .padding(.trailing)
                    Spacer()
                    HStack{
                        let randomInt = 3
                        Button(action: {isGuest.toggle()}) {
                            
                            
                         
                                HStack{
                                    Image(systemName: "suit.heart")
                                    .foregroundColor(.black) }
                                Text(String(randomInt))
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                            
                       
                            
                        }
                    }
                }
//              Spacer()
           
            }.padding(.horizontal, 16.0)
                .padding(.top)
                
            
            
        }
        .alert("You’re not Logged in", isPresented: $isGuest) {
           Button("Log in") {
           }
           Button("Sign up") {
           }
           Button("Cancle", role: .cancel) { }
           
   
           }
    }
}


struct CommentsViewGuset_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}


