//
//  CreateAPostView.swift
//  CreatePost
//
//  Created by Maha Alhathloul on 22/06/1443 AH.
//

import SwiftUI

struct CreatePostView: View {
    
    
    @State private var texts: String = ""
//  @State var textEditiorText : String = "Share Something with us..."
    @State var showSheet: Bool = false
    @State var GoCancle: Bool = false
    var TitleName : String
    var imageTitle :String
    
    var body: some View {
         
                VStack {
                HStack {
                
                    Image("Noura's")
                        .resizable()
                        .frame(width:50,height:50)
                           
                    TextField("Share something with us", text: $texts)
//                    TextEditor(text :$textEditiorText)
//                    Spacer()
                       }
                }
                .padding(20.0)
                
                Spacer()
                    .navigationTitle("Create Post")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: Button(action: {
                       GoCancle = true
                    }, label: {
                        Text("Cancel")
                    }) , trailing:  Button(action: {
                        print("000")
                    }, label: {
                        Text("Post")
                    } ) )
        NavigationLink("",destination: CommunityPage(TitleName: "\(TitleName)", imageTitle: "\(imageTitle)"),isActive: $GoCancle)
                    .foregroundColor(Color("AccentColor"))
           //     if (showModal) {
                    
              //      VStack { }
                    .toolbar {
                                      ToolbarItemGroup(placement: .keyboard) {
                                        Button(action: {}) {
                                        Image(systemName: "photo.on.rectangle.angled")
                                    }
                                        Button(action: {}) {
                                        Image(systemName: "video.fill")
                                    }
                                        Button(action: {}) {
                                        Image(systemName: "paperclip")
                                    }
                            
                                          Button(action: { showSheet.toggle() }) {
                                        Image(systemName: "ellipsis")
                                    }
                                          .halfSheet(showSheet: $showSheet) {
                                              
                                              // My Half Sheet Content Here
                                              VStack(alignment:.leading,spacing:40){
                                                  HStack{
                                                      Image(systemName: "photo.on.rectangle.angled")
                                                      Text("Add a photo")
                                                  }
                                                  HStack{
                                                      Image(systemName: "video.fill")
                                                      Text("Add a video")
                                                  }
                                                  HStack{
                                                      Image(systemName: "paperclip")
                                                      Text("Add a document")
                                                  }
                                                  HStack{
                                                      Image(systemName: "chart.bar.xaxis")
                                                      Text("Create a poll")
                                                      
                                                  }
                                              }
                                              .padding([.bottom, .trailing], 155.0)
                                              .padding(.top , 0)
                                              .font(.system(size: 22))
                                              .foregroundColor(Color("AccentColor"))
                                              Spacer()
                                    }
                                          Spacer()
            }
            
            
        
    }
}
}



struct CreateAPostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView(TitleName: "", imageTitle: "")
    }
}

extension View {
    
    func halfSheet<SheetView:View>(showSheet: Binding<Bool> , @ViewBuilder sheetView: @escaping ()->SheetView ) -> some View {
        return self
            .background(
                
                HalfSheetHelper(sheetView: sheetView() , showSheet: showSheet)
                
            )
    }
}

struct HalfSheetHelper<SheetView : View> : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheet {
            
            
            let sheetController = CustomHostingController(rootView: sheetView)
            uiViewController.present(sheetController,animated: true)
            
            DispatchQueue.main.async {
                self.showSheet.toggle()
            }
        }
    }
    
    
    var sheetView : SheetView
    @Binding var showSheet: Bool
    
    let controller = UIViewController()
    
    
}

class CustomHostingController<Content:View> : UIHostingController<Content> {
    
    override func viewDidLoad() {
        if let presentationController = presentationController as? UISheetPresentationController{
            presentationController.detents = [
                .medium()
             //   , .large()
            ]
            
            presentationController.prefersGrabberVisible = true
        }
    }
}
