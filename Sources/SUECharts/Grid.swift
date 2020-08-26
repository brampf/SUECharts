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

public struct Grid : Shape {
    
    let hguides : CGFloat
    let vguides : CGFloat
    
    public init(_ h: CGFloat, _ v: CGFloat){
        self.hguides = h
        self.vguides = v
    }
    
    public func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        if rect.width > 0 && rect.height > 0 {
            // horizontal
            for index in stride(from: 1, to: rect.width, by: rect.width / hguides){
                
                path.move(to: CGPoint(x: index, y: 0))
                path.addLine(to: CGPoint(x: index, y: rect.height))
                
            }
            // vertical
            for index in stride(from: 1, to: rect.height, by: rect.height / vguides){
                
                path.move(to: CGPoint(x: 0, y: index))
                path.addLine(to: CGPoint(x: rect.width, y: index))
                
            }
        }
        
        return path
    }
    
    
}

struct Grid_Previews: PreviewProvider {
    
    static var previews: some View {
        Grid(5, 3)
            .stroke(Color.gray, style: StrokeStyle(lineWidth: 0.5, dash: [10,5]))
            .border(Color.gray, width: 2)
            .aspectRatio(5/3, contentMode: .fit)
            .padding()
    }
}
