//
//  CardView.swift
//  ShapesCurvesCustomSheet
//
//  Created by Maxim Macari on 09/11/2020.
//

import SwiftUI

struct CardView: View {
    
    @State var server: Server
    var subTitle: String
    
    var body: some View {
        HStack(spacing: 15){
            Image(server.flag)
                .resizable()
                .frame(width: 45, height: 45)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(server.name)
                    .font(.title)
                    .foregroundColor(.black)
                
                if subTitle != "" {
                    Text(subTitle)
                        .foregroundColor(.gray)
                }
            }
               
            
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 24))
                .foregroundColor(.black)
        }
        .padding(.leading, 10)
        .padding(.trailing)
        .padding(.vertical)
    }
}

