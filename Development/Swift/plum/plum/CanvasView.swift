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
        
          VStack{
            PKCanvas(canvas: $canvas,isDraw: $isDraw, color: $color,type: $type, clear:$clear)
              VStack(){
                  Button("Change to BLUE"){ self.color = UIColor.blue }
                  Button("Change to GREEN"){ self.color = UIColor.green }
                  Button("Clear Canvas"){ self.clear.toggle() }
              }
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

      func makeUIView(context: Context) -> PKCanvasView {
          let canvas = PKCanvasView()
          canvas.tool = PKInkingTool(.pen, color: color, width: 10)

          canvas.delegate = context.coordinator
          return canvas
      }

    func updateUIView(_ canvasView: PKCanvasView, context: Context) {
            if clear != context.coordinator.pkCanvas.clear{
                canvasView.drawing = PKDrawing()
            }
            canvasView.tool = PKInkingTool(.pen, color: color, width: 10)
        }

  }

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
