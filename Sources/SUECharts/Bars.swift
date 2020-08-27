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

public struct Bars<F: FixedWidthInteger> : Shape {
    
    var outline : Bool = false
    
    var points : [F]
    
    public init(_ continous: Bool = false, dataPoints: [F]){
        self.points = dataPoints
        self.outline = continous
    }

    public func path(in rect: CGRect) -> Path {
        
        let amplitude = rect.maxY /  CGFloat(points.max() ?? F.max)
        let frequency = rect.maxX / CGFloat(points.count)

        
        var x : CGFloat = 0
        
        var new = Path()
        new.move(to: CGPoint(x: x * frequency, y: rect.height))
        
        points.forEach { point in
            let y = CGFloat(point)
            new.addLine(to: CGPoint(x: x * frequency, y: rect.height - y * amplitude))
            x += 1
            if outline {
                new.addLine(to: CGPoint(x: x * frequency, y: rect.height -  y * amplitude))
                new.addLine(to: CGPoint(x: x * frequency, y: rect.height -  y * amplitude))
                new.addLine(to: CGPoint(x: x * frequency, y: rect.height))
            }
            new.addLine(to: CGPoint(x: x * frequency, y: rect.height -  y * amplitude))
        }
        new.addLine(to: CGPoint(x: x * frequency, y: rect.height))
        
        return new
    }
    
}

struct Bars_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            Bars(false, dataPoints: [1,2,6,4,5,3])
                .foregroundColor(.green)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
            Bars(true, dataPoints: [1,2,6,4,5,3])
                .stroke(Color.purple, lineWidth: 2.0)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
                .preferredColorScheme(.light)
        }
    }
}
