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

struct Bar<Number: AdditiveArithmetic>: Shape {
    
    let size : Double
    let total : Double
    let count : Int
    let bars : Int
    
    var outline = false
    
    public init(count: Int, of: Int, size: Number, max: Number){
        self.size = size.double
        self.total = max.double
        self.count = count
        self.bars = of
    }
    public func path(in rect: CGRect) -> Path {
        
        let amplitude = rect.maxY /  CGFloat(total)
        let frequency = rect.maxX / CGFloat(bars)
        
        
        var x : CGFloat = CGFloat(count)
        
        var new = Path()
        new.move(to: CGPoint(x: x * frequency, y: rect.height))
        
        
            let y = CGFloat(size)
            new.addLine(to: CGPoint(x: x * frequency, y: rect.height - y * amplitude))
            x += 1
            if outline {
                new.addLine(to: CGPoint(x: x * frequency, y: rect.height -  y * amplitude))
                new.addLine(to: CGPoint(x: x * frequency, y: rect.height -  y * amplitude))
                new.addLine(to: CGPoint(x: x * frequency, y: rect.height))
            }
            new.addLine(to: CGPoint(x: x * frequency, y: rect.height -  y * amplitude))
        new.addLine(to: CGPoint(x: x * frequency, y: rect.height))
        
        return new
    }
}

struct Pane_Previews: PreviewProvider {
    
    static var previews: some View {
        Group{
            Bar(count: 0, of: 3, size: 25, max: 100)
                .foregroundColor(.green)
            Bar(count: 1, of: 3, size: 50, max: 100)
                .foregroundColor(.green)
            Bar(count: 2, of: 3, size: 100, max: 100)
                .foregroundColor(.green)
        }
    }
}
