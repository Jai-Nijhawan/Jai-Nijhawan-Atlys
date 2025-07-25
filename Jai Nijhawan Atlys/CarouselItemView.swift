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
        GeometryReader { geo in
            let frame = geo.frame(in: .global)
            let scale = calculateScale(frame: frame)

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
            .zIndex(data.isScaled ? 1 : 0)
            .scaleEffect(scale)
        }
        .frame(width: 280, height: 280)
    }
    
    private func calculateScale(frame: CGRect) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let screenCenter = screenWidth / 2
        let midX = frame.midX
        let distance = abs(midX - screenCenter)
        return max(0.9, 1 - (distance / screenWidth) * 0.4)
    }
}

#Preview {
    ContentView()
}


#Preview {
    CarouselItemView(data: CarouselItemData(id: 0,
                                            systemName: "star.fill",
                                            color: Color.orange,
                                            title: "Jai",
                                            isScaled: true))
}
