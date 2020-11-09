//
//  Home.swift
//  ShapesCurvesCustomSheet
//
//  Created by Maxim Macari on 08/11/2020.
//

import SwiftUI

struct Home: View {
    
    
    
    var gradient = [Color.green, Color.blue, Color.red, Color.purple]
    
    @StateObject var serverData = ServerViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                VStack{
                    Text("AESTHER")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("Status")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text(serverData.isConnected ? "CONNECTED" : "DISCONNECTED")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.top, 5)
                        .padding(.bottom, 20)
                    
                }
                .frame( height: UIScreen.main.bounds.height / 3.3)
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                    
                    
                    LinearGradient(gradient: .init(colors: gradient), startPoint: .top, endPoint: .bottom)
                        .clipShape(CustomShape())
                    
                    
                    //Button
                    VStack {
                        
                        Button(action: {
                            serverData.isConnected.toggle()
                        }, label: {
                            VStack(spacing: 15){
                                Image(systemName: "power")
                                    .font(.system(size: 70))
                                    .foregroundColor(serverData.isConnected ? Color.green.opacity(0.8) : Color.red.opacity(0.8))
                                
                                Text(serverData.isConnected ? "STOP" : "START")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                            }
                            .padding(50)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.green.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                            )
                            .clipShape(Circle())
                            .padding(15)
                            .background(Color.purple.opacity(0.5))
                            .clipShape(Circle())
                            .padding(15)
                            .background(Color.purple.opacity(0.2))
                            .clipShape(Circle())
                            
                            
                        })
                        .offset( y: -65)
                        .padding(.bottom, -65)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation{
                                serverData.showSheet.toggle()
                            }
                        }, label: {
                            
                            CardView(server: serverData.currentServer, subTitle: "")
                                .background(BlurView())
                                .clipShape(Capsule())
                                .padding()
                            
                            
                        })
                        
                        Spacer()
                    }
                    
                })
                .padding(.top, 60)
                
                
            }
            
            BottomSheet(serverData: serverData)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            
            ZStack{
                LinearGradient(gradient: .init(colors: gradient), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Color.black.opacity(0.1)
                    .ignoresSafeArea(.all, edges: .top)
            }
            
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
