//
//  GridImageView.swift
//  Zumra App
//
//  Created by Farah Ashraf on 22/01/2022.
//

import SwiftUI

struct GridImageView: View {
   
    @EnvironmentObject var mediaData:ViewModel
    var index:Int
   
   
    
    var body: some View {
        Button(action: {
            
            withAnimation(.easeInOut){
                mediaData.selectedImagesID = mediaData.allImages[index]
                mediaData.showImageViewer.toggle()
                //for page tab view automatic scrolling ...
             
            }
            
        }, label: {
            ZStack{
                Image(mediaData.allImages[index])
                    .resizable()
                    .frame(width: 115, height: 115)
                    .cornerRadius(4)
            }.padding(.horizontal)
        })
    }
}

struct GridImageView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityPage(TitleName: "tr", imageTitle: "travel")
    }
}
// extending view to get screen size
//extension View{
//    func getReact()-> CGRect {
//        return UIScreen.main.bounds
//    }
//}
