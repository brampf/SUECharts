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

struct PieChartView<Number: AdditiveArithmetic & Comparable> : View {
    
    var data : ChartData<Number>
    
    var body: some View {
        let total = data.total
        
        ZStack{
            ForEach(data.chunks){ chunk in
                PieSlice(size: chunk.value, offset: data.offset(to: chunk), total: total)
                    .foregroundColor(chunk.color)
                    
            }
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    
    static var data = ChartData<Int>(data:
                                        DataChunk("Green", value: 10, color: .green),
                                        DataChunk("Red", value: 40, color: .red),
                                        DataChunk("Blue", value: 50, color: .blue)
    )
    
    
    static var previews: some View {
        Group{
            PieChartView(data: data)
                .preferredColorScheme(.light)
                .previewLayout(.fixed(width: 600, height: 400))
            PieChartView(data: data)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 600, height: 400))
        }
    }
}
