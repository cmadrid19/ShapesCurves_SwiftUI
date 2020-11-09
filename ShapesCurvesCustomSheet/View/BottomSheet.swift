//
//  BottomSheet.swift
//  ShapesCurvesCustomSheet
//
//  Created by Maxim Macari on 09/11/2020.
//

import SwiftUI

struct BottomSheet: View {
    
    @ObservedObject var serverData: ServerViewModel
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        VStack{
            Spacer()
            
            VStack(spacing: 12){
                Capsule()
                    .fill(Color.gray)
                    .frame(width: 60, height: 4)
                
                Text("Select server: ")
                    .foregroundColor(.gray)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 0){
                        ForEach(serverData.servers){ server in
                            CardView(server: server, subTitle: serverData.currentServer.name == server.name ? "Currently selected" : "")
                                .contentShape(Rectangle())
                                .onTapGesture( perform: {
                                    
                                    self.serverData.currentServer = server
                                    
                                    withAnimation{
                                        
                                        serverData.showSheet.toggle()
                                    }
                                })
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom)
                    .padding(.bottom, edges?.bottom)
                })
                .frame( height: UIScreen.main.bounds.height / 3)
            }
            .padding(.top)
            .background(BlurView().clipShape(CustomCorner(corners: [.topLeft, .topRight])))
            .offset(y: offset)
            //Bottom sheet remove -> swipe gesture
            .gesture(DragGesture()
                        .onChanged(onChanged(value:))
                        .onEnded(onEnded(value:))
            )
            .offset(y: serverData.showSheet ? 0 : UIScreen.main.bounds.height)
        }
        .ignoresSafeArea()
        .background(
            Color.black.opacity( serverData.showSheet ? 0.3 : 0).ignoresSafeArea()
                .onTapGesture(perform: {
                    withAnimation{
                        serverData.showSheet.toggle()
                    }
                })
        )
    }
    
    func onChanged(value: DragGesture.Value) {
        
        if value.translation.height > 0 {
            offset = value.translation.height
        }
        
    }
    
    func onEnded(value: DragGesture.Value) {
        
        if value.translation.height > 0 {
            
            withAnimation(
                Animation.easeIn(duration: 0.2)){
                
                //CHecking
                let height = UIScreen.main.bounds.height / 3
                
                if value.translation.height > height / 1.5 {
                    serverData.showSheet.toggle()
                }
                offset = 0
            }
            
            
        }
        
    }
    
}

