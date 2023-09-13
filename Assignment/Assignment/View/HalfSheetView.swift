//
//  HalfSheetView.swift
//  Assignment
//
//  Created by Ahmad Qureshi on 12/09/23.
//

import SwiftUI


enum ViewHierarchy {
    case first
    case second
    case third
}

struct HalfSheetView: View {
    
    @Namespace var namespace /// to match the geometry of views
    @Binding var showSheet: Bool /// to dismiss half sheet
    @State var showFirstViewAnimation: Bool = false /// to show animation on first view
    @State var showSecondViewAnimation: Bool = false /// to show animation on second view
    @State var showThirdViewAnimation: Bool = false /// to show animation on third view
    @State var viewHierarchy: ViewHierarchy = .first /// to change the view on half sheet on button click
    
    
    var body: some View {
        ZStack {
            switch viewHierarchy {
            case .first:
                firstView
            case .second:
                secondView
            case .third:
                thirdView
            }
        }
        .frame(maxHeight:  UIScreen.main.bounds.height / 2)
        .frame(maxWidth: UIScreen.main.bounds.width)
    }
    
    //MARK: - First View on half sheet
    private var firstView: some View {
        VStack(spacing: 0) {
            ZStack {
                if showFirstViewAnimation {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.gray.opacity(0.5))
                        .frame(width: 140, height: 20)
                        .padding(.top, 40)
                        .transition(.scale(scale: 0.1))
                }
            }
            .animation(.default.delay(0.3), value: showFirstViewAnimation)
            
            
            ZStack {
                if showFirstViewAnimation {
                    HStack(spacing: 20) {
                        firstViewinfo
                        firstViewinfo
                    }
                    .transition(.move(edge: .trailing))
                    .padding(.top, 20)
                }
            }
            .animation(.default.delay(0.3), value: showFirstViewAnimation)
            
            
            Spacer()
            
            Button {
                withAnimation {
                    viewHierarchy = .second
                }
                
                
            } label: {
                nextButton
            }
            .padding([.leading, .bottom, .trailing], 30)
        }
        .onAppear {
            showFirstViewAnimation = true
        }
        
    }
    
    //MARK: - Second View on half sheet
    private var secondView: some View {
        VStack(spacing: 0) {
            ZStack {
                if showSecondViewAnimation {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.gray.opacity(0.5))
                        .frame(width: 140, height: 20)
                        .padding(.top, 40)
                        .transition(.scale(scale: 0.1))
                }
            }
            .animation(.default.delay(0.2), value: showSecondViewAnimation)
            
            RoundedRectangle(cornerRadius: 5)
                .fill(.gray.opacity(0.5))
                .frame(width: 100, height: 20)
                .padding(.top, 30)
            
            ZStack {
                if showSecondViewAnimation {
                    HStack(spacing: 20) {
                        Text("5")
                            .foregroundColor(.white)
                            .frame(width: 60, height: 70)
                            .background {
                                Circle()
                                    .fill(.green)
                            }
                        Text("10")
                            .foregroundColor(.white)
                            .frame(width: 60, height: 70)
                            .background {
                                Circle()
                                    .fill(.gray.opacity(0.5))
                            }
                        Text("15")
                            .foregroundColor(.white)
                            .frame(width: 60, height: 70)
                            .background {
                                Circle()
                                    .fill(.gray.opacity(0.5))
                            }
                    }
                    .padding(.top, 10)
                    .transition(.move(edge: .trailing))
                }
            }
            .animation(.default.delay(0.3), value: showSecondViewAnimation)
            
            
            ZStack {
                if showSecondViewAnimation {
                    walletBalanceView
                        .padding(.horizontal, 40)
                        .padding(.top, 20)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .animation(.default.delay(0.3), value: showSecondViewAnimation)
            
            Spacer()
            
            Button {
                viewHierarchy = .third
            } label: {
                nextButton
            }
            .padding([.leading, .bottom, .trailing], 30)
            
        }
        .onAppear {
            showSecondViewAnimation = true
        }
        
    }
    
    //MARK: - Third view on half sheet
    private var thirdView: some View {
        VStack(spacing: 0) {
            
            ZStack {
                if showThirdViewAnimation {
                    Text("Ready to play?")
                        .padding(.top, 40)
                        .transition(.scale)
                }
            }
            .animation(.default.delay(0.3), value: showThirdViewAnimation)
            
            ZStack {
                if showThirdViewAnimation {
                    Text("OSWALD")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .padding(.top, 16)
                        .transition(.scale)
                    
                }
            }
            .animation(.default.delay(0.3), value: showThirdViewAnimation)
            
            
            
            HStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray.opacity(0.5))
                    .frame(width: 70, height: 20)
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray.opacity(0.5))
                    .frame(width: 30, height: 20)
            }
            .padding(.top, 20)
            
            
            ZStack {
                if showThirdViewAnimation {
                    HStack {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(.gray.opacity(0.5))
                            .frame(width: 80, height: 60)
                        
                        RoundedRectangle(cornerRadius: 40)
                            .fill(.gray.opacity(0.5))
                            .frame(width: 80, height: 60)
                        
                        RoundedRectangle(cornerRadius: 40)
                            .fill(.gray.opacity(0.5))
                            .frame(width: 80, height: 60)
                    }
                    .padding(.top, 10)
                    .transition(.move(edge: .trailing))
                }
            }
            .animation(.default, value: showThirdViewAnimation)
            
            ZStack {
                if showThirdViewAnimation {
                    walletBalanceView
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                    .transition(.move(edge: .bottom))
                    
                }
            }
            .animation(.default, value: showThirdViewAnimation)
            
            
            
            
            Spacer()
            
            confirmButton
                .padding([.leading, .bottom, .trailing], 30)
        }
        .onAppear {
            showThirdViewAnimation = true
        }
    }
    
    //MARK: - View used on first View
    private var firstViewinfo: some View {
        VStack {
            Circle()
                .fill(.gray.opacity(0.5))
                .frame(width: 70)
            
            RoundedRectangle(cornerRadius: 5)
                .fill(.gray.opacity(0.5))
                .frame(width: 120, height: 20)
                .padding(.top, 10)
            RoundedRectangle(cornerRadius: 5)
                .fill(.gray.opacity(0.5))
                .frame(width: 80, height: 20)
        }
    }
    
    //MARK: - Label for next button
    private var nextButton: some View {
        Text("NEXT")
            .font(.system(size: 14))
            .foregroundColor(.white)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.green)
            }
        
    }
    
    private var walletBalanceView: some View {
        HStack {
            HStack(alignment: .center) {
                Text("Wallet Balance: ")
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray.opacity(0.5))
                    .frame(width: 50, height: 20)
            }
            
            Spacer()
            
            HStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray.opacity(0.5))
                    .frame(width: 35, height: 25)
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray.opacity(0.5))
                    .frame(width: 20, height: 20)
            }
        }
    }
    
    private var confirmButton: some View {
        Button {
            showSheet = false /// dismiss half sheet
        } label: {
            Text("Confirm")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.black.opacity(0.7))
                }
        }
    }
}

struct HalfSheetView_Previews: PreviewProvider {
    static var previews: some View {
        HalfSheetView(showSheet: .constant(false))
    }
}
