//
//  ViewModel.swift
//  Zumra App
//
//  Created by Farah Ashraf on 22/01/2022.
//

import SwiftUI

class ViewModel : ObservableObject{
    var index: Int = 0
    
    @Published var allImages : [String] = ["postimage1","postimage2","travel1","travel2","travel3","travel4","travel5","travel6","travel7","travel8","travel9","travel10"]
    
//    properties for the image viewer
    
    @Published var showImageViewer = false
    @Published var selectedImagesID : String = ""
}
