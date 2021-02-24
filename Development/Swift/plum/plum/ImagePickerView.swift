//
//  ImagePickerView.swift
//  plum
//
//  Created by /fam on 2/22/21.
//

import SwiftUI
import UIKit
struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
        
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
//        imagePicker.delegate = context.coordinator// confirming the delegate
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    // Connecting the Coordinator class with this struct
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(picker: self)
//    }
}
struct ImagePickerView: View {
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
        @State private var selectedImage: UIImage?
        @State private var isImagePickerDisplay = false
    var body: some View {
        NavigationView {
                    VStack {
                        
                        if selectedImage != nil {
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 300, height: 300)
                        } else {
                            Image(systemName: "snow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 300, height: 300)
                        }
                        
                        Button("Camera") {
                            self.sourceType = .camera
                            self.isImagePickerDisplay.toggle()
                        }.padding()
                        
                        Button("photo") {
                            self.sourceType = .photoLibrary
                            self.isImagePickerDisplay.toggle()
                        }.padding()
                    }
                    .navigationBarTitle("Demo")
                    .sheet(isPresented: self.$isImagePickerDisplay) {
                        ImagePicker(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                    }
                    
                }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
