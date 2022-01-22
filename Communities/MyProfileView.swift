//
//  MyProfileView.swift
//  Zumra
//
//  Created by Razan bin rashed on 19/06/1443 AH.
//

import SwiftUI

struct MyProfileView: View {
    @State private var selectedSection = 0
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.accentColor)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    var body: some View {
        NavigationView{
        ScrollView {
                    ZStack {
//                        // Bottom Layer
                        VStack {
                            Picker("", selection: $selectedSection) {
                                        Text("My Posts").tag(0)
                                        Text("My Communities").tag(1)
                                    
                                    }
                            .pickerStyle(.segmented)
                                    .padding()
                                          if selectedSection == 0 {
                                            Text("Posts")
                                          } else if selectedSection == 1 {
                                            Text("Communities")
                                          }
                    }.padding(.top, 490)

                        // Top Layer (Header)
                                   GeometryReader { gr in
                                       VStack {
                                           Image("Banner")
                                               .resizable()
                                               .aspectRatio(contentMode: .fill)
                                               .frame(width: getReact().width, height: 195, alignment: .center)
                                           
                                           Image("ProfileImage")
                                               .resizable()
                                               .aspectRatio(contentMode: .fill)
                                               .frame(width: 176, height: 176)
                                               .clipShape(Circle())
                                               .overlay(Circle().stroke(Color.white, lineWidth: 5))
                                               .padding(.top, -87.0)
                                           Text("Nora Salem")
                                               .font(.title)
                                               .foregroundColor(Color.black)
                                               
                                           Text("@Nora_33")
                                               .font(.subheadline)
                                               .fontWeight(.regular)
                                               .foregroundColor(Color.gray)
                                           HStack{
                                               Image(systemName: "mappin.and.ellipse")
                                               Text("Saudi Arabia, Riyadh")
                                           }.padding(.top, 5.0)
                                           HStack{
                                               Image(systemName: "clock")
                                               Text("Joined on June 2022")
                                           }
                                               NavigationLink(
                                                   destination: Text("Edit profile")){
                                                      
                                                           Text("Edit profile")
                                                               .fontWeight(.bold)
                                                               .frame(width: 172, height: 40, alignment: .center)
                                                               .foregroundColor(Color.white)
                                                               .background(Color.accentColor)
                                                               .cornerRadius(10)
                                                       
                                               
                                           }
                                           Spacer() // Push header to top
           
                                       }
                                          
                                    
                                   }
                    }
        }
        .navigationTitle("My profile")
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}

