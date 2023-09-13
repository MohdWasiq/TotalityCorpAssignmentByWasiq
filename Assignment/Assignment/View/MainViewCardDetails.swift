//
//  MainViewCardDetails.swift
//  Assignment
//
//  Created by Ahmad Qureshi on 13/09/23.
//

import SwiftUI

struct MainViewCardDetails: View {
    
    let namespace: Namespace.ID
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 16) {
                ImageAsset.icon.set
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .matchedGeometryEffect(id: "topIcon", in: namespace)
                
                Text("CANDY BUST")
                    .multilineTextAlignment(.leading)
                    .frame(width: 100, alignment: .leading)
                    .matchedGeometryEffect(id: "title", in: namespace)
                Spacer()
                
                // Dismiss button
                dismissButton
                
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            
            
            ZStack {
                if viewModel.showCardDetailAnimation {
                    Text("What is lorem ipsum? Lorem ipsum is simply a dummy text of the printing and typesetting")
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .transition(.opacity)
                }
            }
            .animation(.linear.delay(0.3), value: viewModel.showCardDetailAnimation)
            
            
            ZStack {
                if viewModel.showCardDetailAnimation {
                    Button {
                        debugPrint("Read more")
                    } label: {
                        Text("READ MORE")
                            .foregroundColor(.green)
                            .font(.system(size: 15))
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                    .transition(.opacity)
                }
            }
            .animation(.linear.delay(0.4), value: viewModel.showCardDetailAnimation)
            
            ZStack {
                if viewModel.showCardDetailAnimation {
                    ScrollView(.horizontal) {
                        HStack(spacing: 8) {
                            ForEach(0...3, id: \.self) { _ in
                                ImageAsset.thumbnail.set
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(width: UIScreen.main.bounds.width / 2)
                            }
                        }
                    }
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                }
            }
            .animation(.linear.delay(0.8), value: viewModel.showCardDetailAnimation)
            
            
            Spacer()
            
            
            ZStack {
                if viewModel.showPlayButton {
                    playButton
                        .padding([.leading, .bottom, .trailing], 20)
                        .padding(.top, 40)
                        .transition(.move(edge: .bottom))
                } else {
                    MainViewCardButton(namespace: namespace, viewModel: viewModel)
                        .matchedGeometryEffect(id: "mainViewCardButton", in: namespace)
                        .padding([.leading, .bottom, .trailing], 20)
                        .padding(.top, 40)
                }
            }
            .animation(.default, value: viewModel.showPlayButton)
            
            
        }
    }
    
    private var dismissButton: some View {
        Button {
            withAnimation {
                viewModel.showCardDetailView = false
            }
        } label: {
            Image(systemName: "multiply")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 16, height: 16)
        }
        .offset(y: viewModel.showCardDetailAnimation ? 0 : 10)
        .animation(.linear.delay(0.2), value: viewModel.showCardDetailAnimation)
    }
    
    private var playButton: some View {
        
        Button {
            viewModel.showSheet = true
        } label: {
            Text("Play Now")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.blue)
                }
        }
    }
}

struct MainViewCardDetails_Previews: PreviewProvider {
    static var previews: some View {
        MainViewCardDetails(namespace: Namespace().wrappedValue, viewModel: MainViewModel())
    }
}
