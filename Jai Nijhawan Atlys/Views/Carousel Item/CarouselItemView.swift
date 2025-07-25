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
                Image(data.imageName)
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Image("checkmark_cloud_Normal")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .padding()
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .topTrailing)
                
                Text(data.title)
                    .font(.system(size: 22, weight: .heavy))
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                    .padding()
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .bottomLeading)
                
            }
            .scaleEffect(scale)
        }
        .frame(width: 300, height: 300)
    }
    
    private func calculateScale(frame: CGRect) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let screenCenter = screenWidth / 2
        let midX = frame.midX
        let distance = abs(midX - screenCenter)
        return max(0.9, 1 - (distance / screenWidth) * 0.3)
    }
}

#Preview {
    ContentView()
}


#Preview {
    CarouselItemView(data: CarouselItemData(id: 0,
                                            title: "Jai",
                                            imageName: "yourImageName"))
}
