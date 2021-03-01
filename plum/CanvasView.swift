//
//  CanvasView.swift
//  plum
//
//  Created by /fam on 2/19/21.
//

import SwiftUI
import PencilKit
import UIKit
struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        func imagePickerController( _ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
}
struct TextView:UIViewRepresentable{

    @Binding var text: String
    @Binding var textStyle: UIFont.TextStyle




    @Binding var width:NSLayoutDimension
       func makeUIView(context: Context) -> UITextView {
        let textView = UITextView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100), textContainer: nil)

           textView.font = UIFont.preferredFont(forTextStyle: textStyle)
           textView.autocapitalizationType = .sentences
           textView.isSelectable = true
        textView.isScrollEnabled=false
           textView.isUserInteractionEnabled = true

           return textView
       }

       func updateUIView(_ uiView: UITextView, context: Context) {
           uiView.text = text


           uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
       }
//
}

struct Canvas:View{
   
    
    @Binding var images:[UIImage]?;
    @Binding var inputImage: UIImage?;
    @Binding var imageLoading:Bool
    var body: some View {
        ZStack{
        Color.white
            .frame(width:300,height:350)
        
            inputImage.map {
                            ImageBoxView(image: $0)
                                
                        }
        }
    }
   
};
struct CanvasView: View {
    @State var color = UIColor.black
      @State var clear = false
    @State var image:UIImage?
//    @State var canvas = PKCanvasView()
    @State var type : PKInkingTool.InkType = .pencil
    @State var isDraw=true
//    @State var page:Page
    @State var images :[UIImage]?
    @State var colorPicker = false
    @State var imagePicked:UIImage?
    @State var showImagePicker = false
    @State var imagePickLoading=false
      var body: some View {
                    ZStack{
                        Image("transparent")
                            .resizable()
                            .ignoresSafeArea()
                        HStack(spacing:20){
                            Spacer()
                            Canvas(images:$images,inputImage: $image,imageLoading: $imagePickLoading)
                            ZStack{
                                List{
                                    Image(systemName: "pencil")
                                    Image(systemName:"textbox")
                                    Button(action:{ showImagePicker=true}){
                                    Image(systemName:"camera.fill")
                                }.sheet(isPresented: $showImagePicker,onDismiss: loadImage, content: {
                                    ImagePicker(image:$imagePicked)
                                })
                            }
                            }
                        
                        
                    
                            
                            
                        
                
                
                
            }
           
//          VStack{
//            PKCanvas(canvas: $canvas, isDraw: $isDraw, color: $color,type: $type, clear:$clear)
//
//              VStack(){
//                  Button("Change to BLUE"){ self.color = UIColor.blue }
//                  Button("Change to GREEN"){ self.color = UIColor.green }
//
//                  Button("Clear Canvas"){ self.clear.toggle() }
//              }
//          }
//          .navigationBarItems(trailing: Button(action:{ isDraw.toggle()}){
//            Image(systemName: "pencil.slash")
//                .font(.title)
//          })}
        }
        
      }
    func loadImage(){
        guard let inputImage = imagePicked else{return}
        
        image = inputImage
    }
    
}
  

//  struct PKCanvas: UIViewRepresentable {
//      class Coordinator: NSObject, PKCanvasViewDelegate {
//          var pkCanvas: PKCanvas
//
//          init(_ pkCanvas: PKCanvas) {
//              self.pkCanvas = pkCanvas
//          }
//      }
//      @Binding var canvas:PKCanvasView
//    @Binding var isDraw: Bool
//      @Binding var color:UIColor
//    @Binding var type:PKInkingTool.InkType
//      @Binding var clear:Bool
//
//      func makeCoordinator() -> Coordinator {
//          Coordinator(self)
//      }
//    var ink:PKInkingTool{
//        PKInkingTool(type,color: color)
//    }
//    let eraser = PKEraserTool(.bitmap)
//      func makeUIView(context: Context) -> PKCanvasView {
//        canvas.drawingPolicy = .anyInput
//        canvas.tool = isDraw ? ink : eraser
//          return canvas
//      }
//
//    func updateUIView(_ canvasView: PKCanvasView, context: Context) {
//        canvasView.tool = isDraw ? ink : eraser
//
//        }
//
//  }

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
