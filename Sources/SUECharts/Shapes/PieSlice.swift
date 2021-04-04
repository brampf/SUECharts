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

struct PieSlice<Number: AdditiveArithmetic>: Shape {
    
    let size : Double
    let offset : Double
    let total : Double
    
    public init(size: Number, offset: Number, total: Number){
        self.size = size.double
        self.offset = offset.double
        self.total = total.double
    }
    
    public func path(in rect: CGRect) -> Path {
        
        var path = Path()
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        
        let offset = 360.0 * (self.offset / self.total)
        let angle = 360.0 *  (self.size / self.total)
        
        //path.addLine(to: center)
        path.addArc(center: center, radius: rect.size.height / 2, startAngle: .degrees(offset-90), endAngle: .degrees(offset+angle-90), clockwise: false)
        path.addLine(to: center)
        path.closeSubpath()
        
        
        return path
    }
}

struct PieSlice_Previews: PreviewProvider {
    
    static var previews: some View {
        Group{
            PieSlice(size: 33, offset:0, total: 99)
                .stroke(Color.blue, lineWidth: 1)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
            PieSlice(size: 33, offset:33, total: 99)
                .stroke(Color.blue, lineWidth: 1)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
            PieSlice(size: 33, offset:66, total: 99)
                .stroke(Color.blue, lineWidth: 1)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
            PieSlice(size: 25, offset:0, total: 100)
                .stroke(Color.red, lineWidth: 1)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
            PieSlice(size: 25, offset:25, total: 100)
                .stroke(Color.red, lineWidth: 1)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
            PieSlice(size: 25, offset:50, total: 100)
                .stroke(Color.red, lineWidth: 1)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
            PieSlice(size: 25, offset:75, total: 100)
                .stroke(Color.red, lineWidth: 1)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
        }
    }
}
