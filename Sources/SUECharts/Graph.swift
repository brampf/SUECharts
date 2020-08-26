/*
 
 Copyright (c) <2020>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
 */

import SwiftUI

public struct Graph<F: FixedWidthInteger> : Shape {
    
    var striped : Bool = false
    
    var points : [F]
    
    public init(dataPoints: [F]){
        self.points = dataPoints
    }
    
    public func path(in rect: CGRect) -> Path {
        
        let amplitude = rect.maxY /  CGFloat(points.max() ?? F.max)
        let frequency = rect.maxX / CGFloat(points.count + 1)
        
        var path = Path()
        
        var x : CGFloat = 0
        var y : CGFloat = rect.maxY
        
        path.move(to: CGPoint(x: x, y: y))
        
        points.forEach { point in
            x += frequency
            y = CGFloat(rect.maxY - CGFloat(point) * amplitude)
            
            if striped {
                path.move(to: CGPoint(x: x, y: rect.maxY))
            }
            path.addLine(to: CGPoint(x: x, y: y))
        }
        if !striped {
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        }
        //path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct Graph_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            Graph(dataPoints: [12,42,0,36])
                .stroke(Color.blue, lineWidth: 1)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
            Graph(dataPoints: [12,42,0,36])
                .foregroundColor(Color.orange)
                .preferredColorScheme(.light)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
        }
    }
}
