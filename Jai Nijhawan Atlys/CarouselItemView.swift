//
//  CarouselItemView.swift
//  Jai Nijhawan Atlys
//
//  Created by Jai Nijhawan on 25/07/25.
//

import SwiftUI

struct CarouselItemView: View {
    let data: CarouselItemData
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(data.color.gradient)
            
            VStack(spacing: 16) {
                Image(systemName: data.systemName)
                    .font(.system(size: 70, weight: .bold))
                    .foregroundColor(.white)
                
                Text(data.title)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
            }
        }
        .zIndex(data.isScaled ? 100 : 99)
        .frame(width: 280, height: 280)
    }
}

#Preview {
    CarouselItemView(data: CarouselItemData(id: 0,
                                            systemName: "star.fill",
                                            color: Color.orange,
                                            title: "Jai",
                                            isScaled: true))
}
