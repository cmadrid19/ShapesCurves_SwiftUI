//
//  CustomCorner.swift
//  ShapesCurvesCustomSheet
//
//  Created by Maxim Macari on 09/11/2020.
//

import SwiftUI

struct CustomCorner: Shape {
    
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}


