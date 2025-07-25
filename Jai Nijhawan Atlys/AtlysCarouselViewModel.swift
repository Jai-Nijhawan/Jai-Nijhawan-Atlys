//
//  AtlysCarouselViewModel.swift
//  Jai Nijhawan Atlys
//
//  Created by Jai Nijhawan on 25/07/25.
//

import SwiftUI
import Combine

@MainActor
class AtlysCarouselViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var carouselData: [CarouselItemData] = []
    @Published var currentIndex: Int = 1
    
    // MARK: - Private Properties
    private let initialCarouselData: [CarouselItemData] = [
        CarouselItemData(id: 0, systemName: "photo.fill", color: .cyan, title: "Dubai"),
        CarouselItemData(id: 1, systemName: "heart.fill", color: .pink, title: "Malaysia"),
        CarouselItemData(id: 2, systemName: "star.fill", color: .yellow, title: "Thailand")
    ]
    
    // MARK: - Computed Properties
    var middleIndex: Int {
        carouselData.count / 2
    }
    
    // MARK: - Initialization
    init() {
        setupInitialData()
    }
    
    // MARK: - Public Methods
        func setupInitialData() {
        carouselData = initialCarouselData
        currentIndex = middleIndex
    }
    
    func updateCurrentIndex(newIndex: Int) {
        guard newIndex != currentIndex && newIndex >= 0 && newIndex < carouselData.count else { return }
        
        withAnimation(.easeInOut(duration: 0.3)) {
            currentIndex = newIndex
        }
    }
}
