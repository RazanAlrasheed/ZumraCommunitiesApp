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
                                destination: Text("\(values[index])")){
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
