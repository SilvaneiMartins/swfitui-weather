//  Sam Security Developer
//  HomeView.swift
//  weather
//  www.silvaneimartins.com.br
//  Created by Silvanei  Martins on 04/10/22.
//  silvaneimartins_rcc@hotmail.com

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83 // 702/844
    case midle = 0.385 // 325/844
}

struct HomeView: View {
    // MARK: - Propriedade
    
    @State var bottomSheetPosition: BottomSheetPosition = .midle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.midle.rawValue
    @State var hasDragged: Bool = false
    
    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.midle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.midle.rawValue)
    }
    
    // MARK: - Conteudo
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36
                
                
                ZStack {
                    // MARK: Background Color
                    Color.background
                        .ignoresSafeArea()
                    
                    // MARK: Background Image
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    // MARK: House Image
                    Image("House")
                        .frame(maxHeight: .infinity,  alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    VStack(spacing: -10 * (1 - bottomSheetTranslationProrated)) {
                        Text("Vilhena")
                            .font(.largeTitle)
                        
                        
                        VStack {
                            Text(attributedString)
                            Text("H:24°    L:18°")
                                .font(.title3.weight(.semibold))
                                .opacity(1 - bottomSheetTranslationProrated)
                        }// MARK: VSTACK
                        Spacer()
                    }// MARK: VSTACK
                    .padding(.top, 51)
                    .offset(y: -bottomSheetTranslationProrated * 46)
                    
                    // MARK: Bottom Sheet
                    BottomSheetView(position: $bottomSheetPosition) {
                         //Text(bottomSheetTranslationProrated.formatted())
                    } content: {
                        ForecastView(bottomSheetTranslationProrated: bottomSheetTranslationProrated)
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                        
                        withAnimation {
                            if bottomSheetPosition ==  BottomSheetPosition.top {
                                hasDragged = true
                            } else {
                                hasDragged = false
                            }
                        }
                    }
                    
                    // MARK: Tab bar
                    TabBar(action: {
                        bottomSheetPosition = .top
                    })
                    .offset(y: bottomSheetTranslationProrated * 115)
                }// MARK: ZSTACK
            }// MARK: GEOMETRY
        }// MARK: NAVIGATION
        .navigationBarHidden(true)
    }
    
    private var attributedString: AttributedString {
        var string = AttributedString("25°" + (hasDragged ? " | " : "\n ") + "Tempo Limpo")
        
        if let temp = string.range(of: "25°") {
            string[temp].font = .system(size: (96 - (bottomSheetTranslationProrated * (96 - 20))), weight: hasDragged ? .semibold : .thin)
            string[temp].foregroundColor = hasDragged ? .secondary : .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
        }
        
        if let weather = string.range(of: "Tempo Limpo") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        
        return string
    }
}

// MARK: - Visualização
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
