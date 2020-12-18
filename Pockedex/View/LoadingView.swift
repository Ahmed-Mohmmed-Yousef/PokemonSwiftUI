//
//  LoadingView.swift
//  Pockedex
//
//  Created by Ahmed on 16/12/2020.
//

import SwiftUI

struct LoadingView: View {
    @State private var rotationValue: Double = 0
    var body: some View {
        VStack {
            HStack {
                Circle().stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 30, height: 30)
                Circle().stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 30, height: 30)
                
            }.rotationEffect(.degrees(rotationValue), anchor: .center)
            
            HStack {
                Circle().stroke(Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 30, height: 30)
                Circle().stroke(Color.yellow, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 30, height: 30)
                
            }.rotationEffect(.degrees(rotationValue), anchor: .center)
        }.animation(Animation.linear(duration: 1).repeatForever())
        .onAppear{
            rotationValue = -360
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
