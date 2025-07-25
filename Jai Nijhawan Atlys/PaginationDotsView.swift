//
//  PaginationDotsView.swift
//  Jai Nijhawan Atlys
//
//  Created by Jai Nijhawan on 25/07/25.
//

import SwiftUI

struct PaginationDotsView: View {
    let itemCount: Int
    let currentIndex: Int

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<itemCount, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? Color.gray.opacity(0.9) : Color.gray.opacity(0.3))
                    .frame(width: 10, height: 10)
            }
        }
    }
}
