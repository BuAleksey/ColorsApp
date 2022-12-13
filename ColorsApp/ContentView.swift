//
//  ContentView.swift
//  ColorsApp
//
//  Created by Buba on 12.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redColor = Double.random(in: 1...255)
    @State private var greenColor = Double.random(in: 1...255)
    @State private var blueColor = Double.random(in: 1...255)
    
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 270, height: 100)
                .cornerRadius(20)
                .foregroundColor(Color(
                    red: redColor/255,
                    green: greenColor/255,
                    blue: blueColor/255)
                )
            
            SliderSet(colorText: .red, value: $redColor)
                .padding(.trailing, 50)
            SliderSet(colorText: .green, value: $greenColor)
                .padding(.trailing, 50)
            SliderSet(colorText: .blue, value: $blueColor)
                .padding(.trailing, 50)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderSet: View {
    let colorText: Color
    
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(colorText)
                .frame(width: 50)
            
            Slider(value: $value, in: 1...255, step: 1)
        }
    }
}
