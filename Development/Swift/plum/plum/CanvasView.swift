//
//  CanvasView.swift
//  plum
//
//  Created by /fam on 2/19/21.
//

import SwiftUI
import PencilKit
import UIKit
struct CanvasView: View {
    @State var color = UIColor.black
      @State var clear = false
    @State var canvas = PKCanvasView()
    @State var type : PKInkingTool.InkType = .pencil
    @State var isDraw=true
    @State var colorPicker = false
      var body: some View {
        NavigationView{
            
          VStack{
            PKCanvas(canvas: $canvas, isDraw: $isDraw, color: $color,type: $type, clear:$clear)
               
              VStack(){
                  Button("Change to BLUE"){ self.color = UIColor.blue }
                  Button("Change to GREEN"){ self.color = UIColor.green }
                  Button("Clear Canvas"){ self.clear.toggle() }
              }
          }
          .navigationBarItems(trailing: Button(action:{ isDraw.toggle()}){
            Image(systemName: "pencil.slash")
                .font(.title)
          })
           
                
        }
      }
    
}
  

  struct PKCanvas: UIViewRepresentable {
      class Coordinator: NSObject, PKCanvasViewDelegate {
          var pkCanvas: PKCanvas

          init(_ pkCanvas: PKCanvas) {
              self.pkCanvas = pkCanvas
          }
      }
      @Binding var canvas:PKCanvasView
    @Binding var isDraw: Bool
      @Binding var color:UIColor
    @Binding var type:PKInkingTool.InkType
      @Binding var clear:Bool

      func makeCoordinator() -> Coordinator {
          Coordinator(self)
      }
    var ink:PKInkingTool{
        PKInkingTool(type,color: color)
    }
    let eraser = PKEraserTool(.bitmap)
      func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        canvas.tool = isDraw ? ink : eraser
          return canvas
      }

    func updateUIView(_ canvasView: PKCanvasView, context: Context) {
        canvasView.tool = isDraw ? ink : eraser
        
        }

  }

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
