//
//  ContentView.swift
//  Jai Nijhawan Atlys
//
//  Created by Jai Nijhawan on 25/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CarouselScrollViewModel()
    @State private var email: String = ""
    
    var body: some View {
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
            
            EmailTextFeild(email: $email)
            
            ContinueButton()
            
            Text("By continuing, you agree to our terms & privacy policy.")
                .font(.system(size: 13))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top, 10)
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct EmailTextFeild: View {
    @Binding var email: String
    
    var body: some View {
        TextField("Enter your email", text: $email)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
            .font(.system(size: 18))
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
    }
}

struct ContinueButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Continue")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.indigo)
                .cornerRadius(14)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ContentView()
}
