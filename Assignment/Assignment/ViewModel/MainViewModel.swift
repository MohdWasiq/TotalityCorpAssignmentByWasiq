//
//  MainViewModel.swift
//  Assignment
//
//  Created by Ahmad Qureshi on 13/09/23.
//

import Foundation
class MainViewModel: ObservableObject {
    
    @Published var showCardDetailView: Bool = false /// to indicate that card detail view is appeard
    @Published var showSheet: Bool = false /// to open sheet when user tap on play now
    @Published var showCardDetailAnimation: Bool = false /// to show animation on card detail view
    @Published var isButtonPressed: Bool = false /// to show progress animation on download button
    @Published var showPlayButton: Bool = false /// to show play button after downloading completes
    @Published var downloadPercentage: CGFloat = 0 /// indicates the downloading percentage helps in progress animation
    
    
    
    func resetValues() {
        showCardDetailAnimation = false
        isButtonPressed = false
        downloadPercentage = 0
        showPlayButton = false
    }
}
