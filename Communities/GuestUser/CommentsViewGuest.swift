//
//  CommentsView.swift
//  Zumra App
//
//  Created by Farah Ashraf on 24/01/2022.
//

import SwiftUI
struct CommentsViewGuest:View{
    @EnvironmentObject var user: User
    @State var textFieldText :String = ""
//    @State var isPostClicked : Bool = false
    @State var isGuest:Bool=false
    @State var commentsArray:[String]=[]
    @State var GoLogin : Bool=false
    @State var GoSignUp : Bool=false
  
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
            NavigationLink("",destination: LoginView(),isActive: $GoLogin)
            NavigationLink("",destination: SignUpView(isLogin:$GoSignUp ).environmentObject(user),isActive: $GoSignUp)
            
        }
     
//        .alert("You’re not Logged in", isPresented: $isGuest) {
//           Button("Log in") {
//               GoLogin = true
//           }
//           Button("Sign up") {
//               GoSignUp = true
//           }
//           Button("Cancle", role: .cancel) { }
//
//
//           }
    }
     
 
}

struct DummyCommentsModelGuest: View {
    @EnvironmentObject var user: User
    @State var GoLogin : Bool = false
    @State var GoSignUp : Bool = false
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
//
            NavigationLink("",destination: LoginView().environmentObject(user),isActive: $GoLogin)
            NavigationLink("",destination: SignUpView(isLogin: $GoLogin).environmentObject(user),isActive: $GoSignUp)


        }

        .alert("You’re not Logged in", isPresented: $isGuest) {
           Button("Log in") {
               GoLogin = true
           }
           Button("Sign up") {
               GoSignUp = true
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


