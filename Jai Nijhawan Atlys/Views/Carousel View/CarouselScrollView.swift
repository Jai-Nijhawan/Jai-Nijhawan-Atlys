//
//  CarouselScrollView.swift
//  Jai Nijhawan Atlys
//
//  Created by Jai Nijhawan on 25/07/25.
//

import SwiftUI

struct CarouselScrollView: View {
    @ObservedObject var viewModel: CarouselScrollViewModel
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    HStack(spacing: 0) {
                        ForEach(viewModel.carouselData) { item in
                            Group {
                                CarouselItemView(data: item)
                                    .id(item.id)
                                    .scrollTransition { content, phase in
                                        content
                                            .scaleEffect(phase.isIdentity ? 1.22 : 1)
                                    }
                            }
                            .zIndex(item.id == viewModel.currentIndex ? 1 : 0)
                        }
                    }
                    .scrollTargetLayout()
                }
            }
            .contentMargins(60, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
            .frame(width: UIScreen.main.bounds.width, alignment: .top)
            .onScrollTargetVisibilityChange(idType: Int.self) { visibleIDs in
                if let newCurrentIndex = visibleIDs.first {
                    viewModel.updateCurrentIndex(newIndex: newCurrentIndex)
                }
            }
            .onAppear {
                proxy.scrollTo(viewModel.currentIndex, anchor: .center)
            }
        }
    }
}

#Preview {
    CarouselScrollView(viewModel: CarouselScrollViewModel())
}
