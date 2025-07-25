//
//  ContentView.swift
//  Jai Nijhawan Atlys
//
//  Created by Jai Nijhawan on 25/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CarouselScrollViewModel()
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Image("Atlys_Color_Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 70, alignment: .center)
                
                CarouselScrollView(viewModel: viewModel)
                
                CustomPageControlView(itemCount: viewModel.carouselData.count,
                                      currentIndex: viewModel.currentIndex)
                
                Text("Get Visas\nOn Time")
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .frame(maxHeight: .infinity, alignment: .top)

        }
    }
}

#Preview {
    ContentView()
}
