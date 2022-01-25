//
//  ImageView.swift
//  Zumra App
//
//  Created by Farah Ashraf on 22/01/2022.
//

import SwiftUI

struct ImageView: View {
    @EnvironmentObject var mediaData : ViewModel
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            TabView(selection: $mediaData.selectedImagesID){
                ForEach(mediaData.allImages,id:\.self){
                    image in Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .overlay(
                
//                    close Button
                    Button(action: {
                        withAnimation(.default){
                            mediaData.showImageViewer.toggle()
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.35))
                            .clipShape(Circle())
                    })
                        .padding(10),alignment: .topTrailing
                
                
                )
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityPage(TitleName: "", imageTitle: "")
    }
}
