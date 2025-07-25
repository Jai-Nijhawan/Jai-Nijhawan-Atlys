//
//  LaunchVideoView.swift
//  Jai Nijhawan Atlys
//
//  Created by Jai Nijhawan on 25/07/25.
//

import SwiftUI
import AVKit

struct LaunchVideoView: View {
    @Binding var isVideoFinished: Bool
    private let player: AVPlayer

    init(isVideoFinished: Binding<Bool>) {
        self._isVideoFinished = isVideoFinished

        if let path = Bundle.main.path(forResource: "LaunchVideoFade", ofType: "mp4") {
            self.player = AVPlayer(url: URL(fileURLWithPath: path))
        } else {
            self.player = AVPlayer()
        }
    }

    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear {
                player.play()
                
                triggerHapticBurst(from: 0.7, to: 2.5, interval: 0.01, style: .heavy)

                triggerHapticBurst(from: 3.0, to: 5.0, interval: 0.02, style: .heavy)

                triggerHapticBurst(from: 6.5, to: 8.0, interval: 0.01, style: .heavy)

                NotificationCenter.default.addObserver(
                    forName: .AVPlayerItemDidPlayToEndTime,
                    object: player.currentItem,
                    queue: .main
                ) { _ in
                    withAnimation {
                        isVideoFinished = true
                    }
                }
            }
    }

    /// Repeatedly triggers haptics over a time window
    func triggerHapticBurst(from start: TimeInterval,
                            to end: TimeInterval,
                            interval: TimeInterval,
                            style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let count = Int((end - start) / interval)
        for i in 0...count {
            let delay = start + (interval * Double(i))
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                let generator = UIImpactFeedbackGenerator(style: style)
                generator.prepare()
                generator.impactOccurred()
            }
        }
    }
}
