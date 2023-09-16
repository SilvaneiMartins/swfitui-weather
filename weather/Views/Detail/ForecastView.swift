//  Sam Security Developer
//  ForecastView.swift
//  weather
//  www.silvaneimartins.com.br
//  Created by Silvanei  Martins on 04/10/22.
//  silvaneimartins_rcc@hotmail.com

import SwiftUI

struct ForecastView: View {
    // MARK: - Propriedade
    
    var bottomSheetTranslationProrated: CGFloat = 1
    @State private var selection = 0
    
    // MARK: - Conteudo
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                // MARK: Segmented Control
                SegmentedControl(selection: $selection)
                
                // MARK: Forecast Cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        if selection == 0 {
                            ForEach(Forecast.hourly) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                        } else {
                            ForEach(Forecast.daily) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .daily)
                            }
                            .transition(.offset(x: 430))
                        }
                    }// MARK: HSTACK
                    .padding(.vertical, 20)
                }// MARK: SCROLL
                .padding(.horizontal, 20)
                
                // MARK: Forecast Widgets
                Image("Forecast Widgets")
                    .opacity(bottomSheetTranslationProrated)
            }// MARK: VSTACK
        }// MARK: SCROLL
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationProrated)
        .overlay {
            // MARK: Bottom Sheet Separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

// MARk: - Visualização
struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}
