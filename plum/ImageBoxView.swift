//
//  ImageBoxView.swift
//  plum
//
//  Created by /fam on 3/1/21.
//

import SwiftUI

struct ImageBoxView: View {
    var image:UIImage
    @State var magnificationValue: CGFloat = CGFloat(1)
    @State var rotationValue: Angle = .zero
    @State private var location: CGPoint = CGPoint(x: 50, y: 50)
    var body: some View {
        Image(uiImage: image)
    
//            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 300, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .resizable()
            .aspectRatio(contentMode: .fit)
            
            .overlay(
                Rectangle()
                    .strokeBorder(
                                        style: StrokeStyle(
                                            lineWidth: 1,
                                            dash: [10]
                                        ))
                    
                    .scaledToFit()
                    .scaleEffect(magnificationValue)
                    .rotationEffect(rotationValue)
                )
            .position(location)
            .gesture(simpleDrag)
//            .gesture(MagnificationGesture()
//                        .onChanged { value in
//                        self.magnificationValue = value
//                        })
            
            
            
    }
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
            }
    }
}

//struct ImageBoxView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageBoxView(image:)
//    }
//}
