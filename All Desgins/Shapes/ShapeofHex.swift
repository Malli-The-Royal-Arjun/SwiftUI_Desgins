//
//  ShapeofHex.swift
//  All Desgins
//
//  Created by Happy on 09/03/21.
//

import SwiftUI

struct ShapeofHex: View {
    var body: some View {
        Path { path in
            
            path.move(to: CGPoint(x: 50, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 50))
            
            path.move(to: CGPoint(x: 50, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 150))
            
            path.move(to: CGPoint(x: 100, y: 50))
            path.addLine(to: CGPoint(x: 250, y: 50))
            
            path.move(to: CGPoint(x: 100, y: 150))
            path.addLine(to: CGPoint(x: 250, y: 150))
            
            
            path.move(to: CGPoint(x: 300, y: 100))
            path.addLine(to: CGPoint(x: 250, y: 50))

            path.move(to: CGPoint(x: 300, y: 100))
            path.addLine(to: CGPoint(x: 250, y: 150))
            
            
        }.strokedPath(StrokeStyle(lineWidth: 2))
        .foregroundColor(Color.red)
        
        
        Path { path in
            
            let width: CGFloat = UIScreen.main.bounds.width+150
            
            //north
            path.move(to: CGPoint(x: width/2, y: 60))
            path.addLine(to: CGPoint(x: width/5.6, y: 60))
            
            //south
            path.move(to: CGPoint(x: width/2, y: 0))
            path.addLine(to: CGPoint(x: (width)/5.6, y: 0))
            
            //northwest
            path.move(to: CGPoint(x: width/10.6, y: 30))
            path.addLine(to: CGPoint(x: width/5.6, y: 0))
            
            
            //southwest
            path.move(to: CGPoint(x: width/10.6, y: 30))
            path.addLine(to: CGPoint(x: width/5.6, y: 60))
            
            //northeast
            path.move(to: CGPoint(x: width/2, y: 0))
            path.addLine(to: CGPoint(x: width/1.7, y: 30))
            
            //southwest
            path.move(to: CGPoint(x: width/1.7, y: 30))
            path.addLine(to: CGPoint(x: width/2, y: 60))
            
            
        }.strokedPath(StrokeStyle(lineWidth: 2))
        .foregroundColor(Color.red)
    }
}

struct ShapeofHex_Previews: PreviewProvider {
    static var previews: some View {
        ShapeofHex()
    }
}
