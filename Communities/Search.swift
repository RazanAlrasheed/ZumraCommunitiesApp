//
//  Search.swift
//  Zumra
//
//  Created by Razan bin rashed on 16/06/1443 AH.
//

import SwiftUI

struct Search: View {
    private var samplePhotos = ["TV & FILMS", "Sport", "Music", "Travel", "Craft",  "Fitness","Shop"]

    private var samplePhotos2 = [ "Game", "Art",  "Technology", "Book", "Food",  "Photography", "Education"]
    @State var text : String = ""
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                 Text("Browse Categories")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 340, alignment: .leading)
                VStack{
                    ForEach(samplePhotos.indices) { index in
                    HStack{
                        NavigationLink(
                            destination: Text(samplePhotos[index])){
                                ZStack(alignment: .bottom){
                                    Image(samplePhotos[index])
                                         .resizable()
                                         .frame(width: 170, height: 150)
                                    VStack(alignment:.leading){
                                           Text(samplePhotos[index])
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                         .padding(.all)
                                         .frame(width: 160 , alignment:.bottomLeading)
                            }
                            
                        }
                  
                        NavigationLink(
                            destination: Text(samplePhotos2[index])){
                                ZStack(alignment: .bottom){
                                    Image(samplePhotos2[index])
                                         .resizable()
                                         .frame(width: 170, height: 150)
                                    VStack(alignment:.leading){
                                           Text(samplePhotos2[index])
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                         .padding(.all)
                                         .frame(width: 160 , alignment:.bottomLeading)
                            }
                            
                        }

                     }
                    }
                }
             }
              

              .navigationBarTitle("Search", displayMode: .large)
                .searchable(text: $text, placement:.navigationBarDrawer(displayMode: .always))
             
                   
        }
        
     
        }
    
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}

//            LazyVGrid(columns: gridLayout, spacing: 10) {
//
//                     ForEach(samplePhotos.indices) { index in
//                         ZStack(alignment: .bottom){
//                             Image(samplePhotos[index])
//                                 .resizable()
//                                 .frame(width: 170, height: 150)
//                             VStack(alignment:.leading, spacing: 5){
//                                 Text(samplePhotos[index])
//                                     .font(.title3)
//                                     .fontWeight(.bold)
//                                     .foregroundColor(.white)
//                             }
//                             .padding(.all)
//                             .frame(width: 160 , alignment:.bottomLeading)
//
//                         }
//
//                     }
//                 }
//                 .padding(.all)
