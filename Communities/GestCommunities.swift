//
//  SwiftUIView.swift
//  Zumra
//
//  Created by Razan bin rashed on 16/06/1443 AH.
//

import SwiftUI

struct GestCommunities: View {
    var body: some View {
        VStack{
            Text("Looking for communities?")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 2.0)
                
            Text("The communities you join will apear here.")
                .font(.body)
                .foregroundColor(Color.gray)
                .padding(.bottom, 2.0)
                .frame(width:300)
            
            NavigationLink(
                destination: Text("exploar")){
                    Text("Explore communities")
                        .underline()
                        .foregroundColor(Color("AccentColor"))
                
            }
        }
        }
       
    }


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GestCommunities()
    }
}
