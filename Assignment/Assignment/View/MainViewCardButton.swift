//
//  MainViewCardButton.swift
//  Assignment
//
//  Created by Ahmad Qureshi on 13/09/23.
//

import SwiftUI

struct MainViewCardButton: View {
    
    let namespace: Namespace.ID
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isButtonPressed {  // to show downloading effect
                HStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.green.opacity(0.3))
                        .frame(height: 50)
                        .overlay {
                            VStack {
                                Text("DOWNLOAD")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                Text("38 MB")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
                            }
                        }
                        .matchedGeometryEffect(id: "button", in: namespace)
                        .background(alignment: .leading) {
                            GeometryReader { geometry in
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.green)
                                    .frame(width: geometry.size.width * viewModel.downloadPercentage)
                                    .animation(.linear, value: viewModel.downloadPercentage)
                            }
                            
                        }
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                                if viewModel.downloadPercentage < 1 {
                                    viewModel.downloadPercentage += 0.2
                                } else {
                                    viewModel.showPlayButton = true
                                    timer.invalidate()
                                }
                            }
                        }
                    
                    
                    Button {
                        debugPrint("cancel")
                    } label: {
                        Image(systemName: "multiply")
                            .padding(.all, 10)
                            .background {
                                Circle()
                                    .fill(Color.yellow)
                            }
                    }
                }
            } else {  // Button state before clicking
                Button {
                    withAnimation {
                        // fixed this
                        viewModel.isButtonPressed = true
                    }
                    
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.green)
                        .frame(height: 50)
                }
                .overlay {
                    if viewModel.showCardDetailAnimation { // to show labels when card is pressed
                        VStack {
                            Text("DOWNLOAD")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Text("38 MB")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                    }
                }
                .matchedGeometryEffect(id: "button", in: namespace)
            }
        }
    }
}

struct MainViewCardButton_Previews: PreviewProvider {
    static var previews: some View {
        MainViewCardButton(namespace: Namespace().wrappedValue, viewModel: MainViewModel())
    }
}
