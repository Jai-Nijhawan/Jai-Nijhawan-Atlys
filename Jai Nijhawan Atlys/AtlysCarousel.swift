//
//  AtlysCarousel.swift
//  Jai Nijhawan Atlys
//
//  Created by Jai Nijhawan on 25/07/25.
//

import SwiftUI

struct AtlysCarousel: View {
    @StateObject private var viewModel = AtlysCarouselViewModel()
    
        var body: some View {
        VStack(spacing: 30) {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
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
                .contentMargins(60, for: .scrollContent)
                .scrollTargetBehavior(.viewAligned)
                .frame(height: 360)
                .onScrollTargetVisibilityChange(idType: Int.self) { visibleIDs in
                    if let newCurrentIndex = visibleIDs.first {
                        viewModel.updateCurrentIndex(newIndex: newCurrentIndex)
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        if !viewModel.carouselData.isEmpty {
                            proxy.scrollTo(viewModel.currentIndex, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
