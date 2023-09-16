//  Sam Security Developer
//  NavigationBar.swift
//  weather
//  www.silvaneimartins.com.br
//  Created by Silvanei  Martins on 04/10/22.
//  silvaneimartins_rcc@hotmail.com

import SwiftUI

struct NavigationBar: View {
    // MARK: - Propriedade
    
    @Binding var searchText: String
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Conteudo
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 5) {
                        // MARK: Back button Icon
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23).weight(.medium))
                        .foregroundColor(.secondary)
                        
                        // MARK: Back button label
                        Text("Weather")
                            .font(.title)
                            .foregroundColor(.primary)
                    }// MARK: HSTACK
                    .frame(height: 44)
                }
                
                Spacer()
                
                // MARK: More button
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 28))
                    .frame(width: 44, height: 44, alignment: .trailing)

            }// MARK: HSTACK
            .frame(height: 52)
            
            // MARK: Search Bar
            HStack(spacing: 2) {
                Image(systemName: "magnifyingglass")
                
                TextField("Pesquisar por cidade ou aeroporto", text: $searchText)
            }// MARK: HSTACK SEARCH
            .foregroundColor(.secondary)
            .padding(.horizontal, 6)
            .padding(.vertical, 7)
            .frame(height: 36, alignment: .leading)
            .background(Color.bottomSheetBackground, in: RoundedRectangle(cornerRadius: 10))
            .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: .black.opacity(0.25), lineWidth: 2, offsetX: 0, offsetY: 0, blur: 2)
            
        }// MARK: VSTACK
        .frame(height: 106, alignment: .top)
        .padding(.horizontal, 16)
        .padding(.top, 49)
        .backgroundBlur(radius: 20, opaque: true)
        .background(Color.navBarBackground)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
    }
}

// MARK: - Visualização
struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(searchText: .constant(""))
    }
}
