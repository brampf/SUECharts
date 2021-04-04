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

public struct LinearFunction : Shape {

    private let a : CGFloat
    private let b: CGFloat
    
    public init<B: BinaryFloatingPoint>(a: B, b: B){
        self.a = CGFloat(a)
        self.b = CGFloat(b)
    }
    
    public init<B: BinaryInteger>(a: B, b: B){
        self.a = CGFloat(a)
        self.b = CGFloat(b)
    }
    
    public func path(in rect: CGRect) -> Path {
        
        let f0 = CGPoint(x: 0.0, y: rect.height - f(0, in: rect))
        let f1 = CGPoint(x: 1.0 * rect.width, y: rect.height - f(1, in: rect))
        
        var path = Path()
        
        path.move(to: f0)
        path.addLine(to: f1)
        path.closeSubpath()
        
        return path
    }
    
    func f(_ x: CGFloat, in rect: CGRect) -> CGFloat {
        
        CGFloat(a) * rect.width * x + CGFloat(b) * rect.height
    }
    
}

struct LinearFunction_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LinearFunction(a: 1, b: 0).stroke(Color.red, lineWidth: 1).aspectRatio(1, contentMode: .fit).border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).padding()
            LinearFunction(a: -1, b: 1).stroke(Color.red, lineWidth: 1)
                .aspectRatio(1, contentMode: .fit)
                .preferredColorScheme(.dark)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).padding()
        }
    }
}
