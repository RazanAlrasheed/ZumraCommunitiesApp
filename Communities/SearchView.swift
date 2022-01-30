//
//  SearchView.swift
//  Zumra
//
//  Created by Razan bin rashed on 17/06/1443 AH.
//

import SwiftUI

struct SearchView: View {
    private var listOfCategories = CategoriesList
     @State var SearchText : String = ""
    var columns = Array(repeating: GridItem(.fixed(175)), count: 2)
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                Divider().padding(.horizontal)
                 Text("Browse Categories")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 355, alignment: .leading)
                LazyVGrid(columns: columns){
                    ForEach(Categories ,id: \.self){ index in
                        if index == "TV & FILMS"{
                        }
                            NavigationLink(destination: SALView(AllCommunitiesForCategory: TV_Film, communityName: "\(index)", communityImage: "\(index)")){
                                ZStack(alignment: .bottom){
                                    Image("\(index)")
                                         .resizable()
                                         .frame(width: 184, height: 150)
                                    VStack(alignment:.leading){
                                           Text("\(index)")
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                         .padding(.all)
                                         .frame(width: 175 , alignment:.bottomLeading)
                            }
                    }
                            
                        
                    }
                }  .searchable(text: $SearchText, placement:.navigationBarDrawer(displayMode: .always))
            }
            .navigationBarTitle("Search", displayMode: .large)
          
        }
    }
    var Categories : [String] {
        let lowCategories = listOfCategories.map{ $0}
        return  SearchText == "" ? lowCategories : lowCategories.filter{
            $0.contains(SearchText)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
