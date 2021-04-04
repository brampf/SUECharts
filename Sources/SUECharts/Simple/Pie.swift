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

struct PieChart<F: FixedWidthInteger>: Shape {
    
    var points : [F]
    let total : F
    
    public init(dataPoints: [F]){
        self.points = dataPoints
        self.total = dataPoints.reduce(0, { sum, point in
            return sum + point
        })
    }
    
    public func path(in rect: CGRect) -> Path {
        
        var path = Path()
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        
        var pointOffset : F = 0
        points.forEach { point in
            
            let offset = 360.0 * (1 + (Double(pointOffset) / Double(total)))
            let angle = 360.0 *  (1 + (Double(point) / Double(total)))
            
            path.addLine(to: center)
            path.addArc(center: center, radius: rect.size.height / 2, startAngle: .degrees(offset-90), endAngle: .degrees(offset+angle-90), clockwise: true)
            path.addLine(to: center)
            path.closeSubpath()
            
            pointOffset += point
        }
        
        
        return path
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        PieChart(dataPoints: [23,42,8])
            .stroke(Color.blue, lineWidth: 1)
            .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .padding()
    }
}
