//  Sam Security Developer
//  Blur.swift
//  weather
//  www.silvaneimartins.com.br
//  Created by Silvanei  Martins on 04/10/22.
//  silvaneimartins_rcc@hotmail.com

import SwiftUI

class UIBackdropView: UIView {
    override class var layerClass: AnyClass {
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}

struct Backdrop: UIViewRepresentable {
    func makeUIView(context: Context) -> UIBackdropView {
        UIBackdropView()
    }
    
    func updateUIView(_ uiView: UIBackdropView, context: Context) {}
}

struct Blur: View {
    // MARK: - Propriedade
    
    var radius: CGFloat = 3
    var opaque: Bool = true
    
    // MARK: - Conteudo
    var body: some View {
        Backdrop()
            .blur(radius: radius, opaque: opaque)
    }
}

// MARK: - Visualização
struct Blur_Previews: PreviewProvider {
    static var previews: some View {
        Blur()
    }
}
