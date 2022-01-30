

import UIKit
import SwiftUI


struct CreateNewCommView: View {
    @Environment(\.presentationMode) private var presentationMode : Binding<PresentationMode>
    
    @State private var changeImage = false
    @State private var openCameraRoll = false
    @State private var imageSelected = UIImage()
    //------------------------------------------------
    @State private var textOfCommunityName: String = ""
    @State private var textOfPrivacy: String = ""
    @State private var textOfCategory: String = ""
    @State private var textOfBio: String = "Enter your Bio"
    //------------------------------------------------
    @State private var showActionSheet = false
    
    var body: some View {
    
        ScrollView {
            Spacer()
            
            VStack(alignment:.leading){
                
                Text("Community Name")
                TextField("Give your community a name", text: $textOfCommunityName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                
                Text("Privacy")
                TextField("Choose a privacy", text: $textOfPrivacy)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onTapGesture {
                        showActionSheet = true
                    }
                    .actionSheet(isPresented: $showActionSheet, content: {
                        ActionSheet(title: Text("Choose a new photo"),
                                    message: Text("Pick a photo that you like"),
                                    buttons: [
                                        .default(Text("Public")) {
                                            self.textOfPrivacy = "Public"
                                        },
                                        .default(Text("Private")) {
                                            self.textOfPrivacy = "Private"
                                        },
                                        .cancel()
                                    ])
                    })
                
                
                Text("Category")
                TextField("Category of your community", text: $textOfCategory)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                
            }
            .padding()
            
            Spacer()
            Divider()
                .padding([.top, .leading, .trailing])
            
            
            VStack(alignment:.leading){
                Text("Bio")
                
                TextEditor(text: $textOfBio)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 6.0)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .cornerRadius(3)
                    .opacity(0.3)
                
                   
                
                
            }
            .padding()
            
            
            Spacer()
            Divider()
                .padding([.top, .leading, .trailing])
            
            VStack(alignment:.leading) {
                
                Text("Choose Community Image")
                
                Rectangle()
                    .padding()
                    .foregroundColor(.white)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .opacity(0.2)
                    .cornerRadius(5)
                    .frame(height: 300)
                    .overlay(
                        
                        Button(action: {
                            changeImage = true
                            openCameraRoll = true
                        }, label: {
                            if changeImage {
                                Image(uiImage: imageSelected)
                                    .resizable()
                                    .frame(width: 356 , height: 300)
                                    .foregroundColor(.gray)
                                   // .opacity(0.7)
                                
                            } else {
                                
                                Image(systemName: "photo.on.rectangle.angled")
                                    .resizable()
                                    .frame(width: 150 , height: 150)
                                    .foregroundColor(.gray)
                                    .opacity(0.7)
                                
                            }
                        })
                    )
                
                
                
                
                
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .sheet(isPresented : $openCameraRoll) {
                ImagePicker(selectedImage: $imageSelected , sourceType: .photoLibrary) //camera
            }
            
            
            
            
            
            
            
            .navigationTitle("Create New Community")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
                    .foregroundColor(Color("AccentColor"))
            }) , trailing:  Button(action: {
                print("000")
            }, label: {
                Text("Next")
                    .foregroundColor(Color("AccentColor"))
            } ) )
            
        }
    }
}

struct CreateNewCommView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewCommView()
    }
}


struct ImagePicker : UIViewControllerRepresentable {

    
   
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) ->  UIViewController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        //
    }
    
    final class Coordinator: NSObject , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
        var parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController , didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
