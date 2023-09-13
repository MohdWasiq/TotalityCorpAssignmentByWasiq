//
//  ContentView.swift
//  Assignment
//
//  Created by Ahmad Qureshi on 11/09/23.
//

import SwiftUI

struct MainView: View {
    
    @Namespace var namespace /// to match the geometry of views
    @StateObject var viewModel: MainViewModel = MainViewModel()
    
    
    var body: some View {
        ZStack {
            if viewModel.showCardDetailView { // to show card details
                
                MainViewCardDetails(namespace: namespace, viewModel: viewModel)
                    .onAppear {
                        viewModel.showCardDetailAnimation = true
                    }
                    .onDisappear {
                        // to reset the states
                        viewModel.resetValues()
                    }
                
            } else {
                VStack(spacing: 20) {
                    header
                    MainViewCard(namespace: namespace, viewModel: viewModel)
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.3)) {
                                self.viewModel.showCardDetailView = true /// to show detail view on card tap
                            }
                        }
                    
                    CustomRoundedRectangle(color: .orange, tl: 30, tr: 30) /// custom Rounded Rectangle with corner radius on top edges
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
                
            }
        }
        .sheet(isPresented: $viewModel.showSheet) {
            HalfSheetView(showSheet: $viewModel.showSheet) /// present custom half sheet
                .presentationDetents([.medium])
                .presentationCornerRadius(0)
        }
        
    }
    
    private var header: some View {
        Text("PLAY")
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .matchedGeometryEffect(id: "title", in: namespace)
    }
    
    private var footer: some View {
        Rectangle()
            .fill(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
