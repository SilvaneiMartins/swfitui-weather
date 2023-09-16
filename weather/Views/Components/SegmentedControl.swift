//  Sam Security Developer
//  SegmentedControl.swift
//  weather
//  www.silvaneimartins.com.br
//  Created by Silvanei  Martins on 04/10/22.
//  silvaneimartins_rcc@hotmail.com

import SwiftUI

struct SegmentedControl: View {
    // MARK: - Propiedade
    
    @Binding var selection: Int
    
    // MARK: - Conteudo
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Button {
                    withAnimation(.easeOut(duration: 0.5)) {
                        selection = 0
                    }
                } label: {
                    Text("Previsão por Hora")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Button {
                    withAnimation(.easeOut(duration: 0.5)) {
                        selection = 1
                    }
                } label: {
                    Text("Previsão Semanal")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }// MARK: HSTACK
            .font(.subheadline.weight(.semibold))
            .foregroundColor(.secondary)
            
            Divider()
                .background(.white.opacity(0.5))
                .blendMode(.overlay)
                .shadow(color: .black.opacity(0.2), radius: 0, x: 0, y: 1)
                .blendMode(.overlay)
                .overlay {
                    // MARK: Underline
                    HStack {
                        Divider()
                            .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                            .background(Color.underline)
                            .blendMode(.overlay)
                    }// MARK: HSTACK
                    .frame(maxWidth: .infinity, alignment: selection == 0 ? .leading : .trailing)
                    .offset(y: -1)
                }
            
        }// MARK: VSTACK
        .padding(.top, 25)
    }
}

// MARK: - Visualização
struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl(selection: .constant(0))
    }
}
