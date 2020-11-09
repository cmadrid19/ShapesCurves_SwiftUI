//
//  BlurView.swift
//  ShapesCurvesCustomSheet
//
//  Created by Maxim Macari on 09/11/2020.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
   
    func makeUIView(context: Context) -> some UIView {
       
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterialLight))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
