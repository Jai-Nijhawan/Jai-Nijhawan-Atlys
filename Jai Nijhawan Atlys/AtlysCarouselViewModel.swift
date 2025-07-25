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
        CarouselItemData(id: 0, title: "Thailand", imageName: "thailand_cover_Normal"),
        CarouselItemData(id: 1, title: "Malaysia", imageName: "malaysia_cover_Normal"),
        CarouselItemData(id: 2, title: "Dubai", imageName: "uae_cover_Normal")
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
        guard newIndex != currentIndex && newIndex >= 0
                && newIndex < carouselData.count else { return }
        currentIndex = newIndex
    }
}

