//
//  CommentsView.swift
//  Zumra App
//
//  Created by Farah Ashraf on 24/01/2022.
//

import SwiftUI
struct CommentsView:View{
    @State var textFieldText :String = ""
//    @State var isPostClicked : Bool = false
    @State var isLoved:Bool=false
    @State var commentsArray:[String]=[]
  
    var body: some View{
        
        VStack {
        
        Text("Comments")
            .font(.headline)
            .fontWeight(.bold)
            .padding(.top)
            
        DummyCommentsModel(userName: "Nora Moore", profilePic: "member1", comment: "Wow nice trip I have been wanting to go there like FOREVER !!!")
        Divider()
        DummyCommentsModel(userName: "Alan Dymon", profilePic: "member2", comment: "I Like the Pic 😲❤️")
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

                    HStack {
                        Text(comment)
                            .padding(.trailing)
                        Spacer()
                        HStack{
                            let numberOfLikes = 0
                            Button(action: {isLoved.toggle()}) {


                                if isLoved == false {
                                    HStack{
                                        Image(systemName: "suit.heart")
                                        .foregroundColor(.black) }
                                    Text(" ")
                                        .font(.caption)
                                        .foregroundColor(Color.gray)
                                }
                                else {
                                    HStack{
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.red)
                                        Text(String(numberOfLikes+1))
                                            .font(.caption)
                                            .foregroundColor(Color.gray)
                                    }
                                }

                            }
                        }
                    }
        Divider()

                }.padding(.horizontal, 16.0)
                    .padding(.top)
            }
          
            Spacer()
            HStack {
                Image("profilePic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45.0, height: 45.0)
                
                TextField("Type a comment", text: $textFieldText)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.09))
                .frame(height: 50.0))
                    .padding()
                
                Button(action: { PostAComment()
                   
                    
                }, label: {Text("Post").foregroundColor(textFieldText.isEmpty ? .gray : .accentColor)}).disabled(textFieldText.isEmpty)
            }.padding()
         
        }
        
    
    }
    
   func PostAComment(){
       commentsArray.append(textFieldText)
       textFieldText=""
//        var comment :String=textFieldText

  }
 
 
}

struct DummyCommentsModel: View {
    @State var isLoved : Bool = false
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
                        Button(action: {isLoved.toggle()}) {
                            
                            
                            if isLoved == false {
                                HStack{
                                    Image(systemName: "suit.heart")
                                    .foregroundColor(.black) }
                                Text(String(randomInt))
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                            }
                            else {
                                HStack{
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                    Text(String(randomInt+1))
                                        .font(.caption)
                                        .foregroundColor(Color.gray)
                                }
                            }
                            
                        }
                    }
                }
//              Spacer()
           
            }.padding(.horizontal, 16.0)
                .padding(.top)
                
            
            
        }
    }
}


struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}


