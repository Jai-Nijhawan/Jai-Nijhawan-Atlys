//
//  RootView.swift
//  Jai Nijhawan Atlys
//
//  Created by Jai Nijhawan on 25/07/25.
//

import SwiftUI

struct RootView: View {
    @State private var isVideoFinished = false

    var body: some View {
        Group {
            if isVideoFinished {
                ContentView()
                    .transition(.opacity)
            } else {
                LaunchVideoView(isVideoFinished: $isVideoFinished)
            }
        }
    }
}

