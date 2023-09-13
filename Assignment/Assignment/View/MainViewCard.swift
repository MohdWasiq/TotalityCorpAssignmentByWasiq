//
//  MainViewCard.swift
//  Assignment
//
//  Created by Ahmad Qureshi on 13/09/23.
//

import SwiftUI

struct MainViewCard: View {
    
    let namespace: Namespace.ID
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                ImageAsset.icon.set
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .matchedGeometryEffect(id: "topIcon", in: namespace)
                Spacer()
            }
            Spacer()
            
            MainViewCardButton(namespace: namespace, viewModel: viewModel)
                .matchedGeometryEffect(id: "mainViewCardButton", in: namespace)
        }
        .padding(.all, 16)
        .frame(height: UIScreen.main.bounds.height / 1.8)
        .background {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.orange)
        }
    }
}

struct MainViewCard_Previews: PreviewProvider {
    static var previews: some View {
        MainViewCard(namespace: Namespace().wrappedValue, viewModel: MainViewModel())
    }
}
