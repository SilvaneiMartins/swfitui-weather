//  Sam Security Developer
//  WeatherView.swift
//  weather
//  www.silvaneimartins.com.br
//  Created by Silvanei  Martins on 04/10/22.
//  silvaneimartins_rcc@hotmail.com

import SwiftUI

struct WeatherView: View {
    // MARK: - Propriedade
    
    @State private var searchText = ""
    
    var searchResults: [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter { $0.location.contains(searchText)
            }
        }
    }
    
    // MARK: - Conteudo
    var body: some View {
        ZStack {
            // MARK: Background
            Color.background
                .ignoresSafeArea()
            
            // MARK: Weather Widgets
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(searchResults) { forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }// MARK: VSTACK
            }// MARK: SCROLL
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
            
        }// MARK: ZSTACK
        .overlay {
            // MARK: Navigation bar
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)
//        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Pesquisar uma cidade ou aeroporto")
    }
}

// MARK: - Visualização
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
