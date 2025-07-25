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
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                ScrollViewReader { proxy in
                    Image("Atlys_Color_Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 70, alignment: .center)
                    
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
                
                PaginationDotsView(itemCount: viewModel.carouselData.count,
                                   currentIndex: viewModel.currentIndex)
                
                Text("Get Visas \n On Time")
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundColor(.black)
                    .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
