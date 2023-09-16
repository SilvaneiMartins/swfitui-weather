//  Sam Security Developer
//  WeatherWidget.swift
//  weather
//  www.silvaneimartins.com.br
//  Created by Silvanei  Martins on 04/10/22.
//  silvaneimartins_rcc@hotmail.com

import SwiftUI

struct WeatherWidget: View {
    // MARK: - Propriedade
    
    var forecast: Forecast
    
    // MARK: - Conteudo
    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: Trapezoid
            Trapezoid()
                .fill(Color.weatherWidgetBackground)
                .frame(width: 342, height: 174)
            
            // MARK: Content
            HStack(alignment: .bottom) {
                
                VStack(alignment: .leading, spacing: 8) {
                    // MAR: Forecast Temperature
                    Text("\(forecast.temperature)°")
                        .font(.system(size: 64))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        // MARK: Forecast temperature range
                        Text("H:\(forecast.high)° L:\(forecast.low)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        
                        // MARK: Forecast location
                        Text(forecast.location)
                            .font(.body)
                            .lineLimit(1)
                    }// MARK: VSTACK
                }// MARK: VSTACK
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 0) {
                    // MARK: Forecast lorge icon
                    Image("\(forecast.icon) large")
                        .padding(.trailing, 4)
                    
                    // MARK: Weather
                    Text(forecast.weather.rawValue)
                        .font(.footnote)
                        .padding(.trailing, 24)
                }// MARK: VSTACK
                
            }// MARK: HSTACK
            .foregroundColor(.white)
            .padding(.bottom, 20)
            .padding(.leading, 20)
            
        }// MARK: ZSTACK
        .frame(width: 342, height: 184, alignment: .bottom)
    }
}

// MARK: - Visualização
struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidget(forecast: Forecast.cities[0])
            .preferredColorScheme(.dark)
    }
}
