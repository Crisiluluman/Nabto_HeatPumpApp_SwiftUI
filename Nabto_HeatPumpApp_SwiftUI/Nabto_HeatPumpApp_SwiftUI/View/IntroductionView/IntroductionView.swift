//
//  MainScreenView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 01/10/2021.
//

import SwiftUI

struct IntroductionView: View {
    @State var device: String = ""
    @State var selection: Int? = nil
    
    
  /*
   init() {
        
        UINavigationBar.appearance().backgroundColor = UIColor(named: "NabtoOrange")
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)

        }
   */
     
    
    
    var body: some View {
    
        NavigationView {
            
            ZStack
            {
                Color("Background")
                    .ignoresSafeArea()
                    .opacity(0.6)
                    //.navigationTitle(Text("NabtoHeatPumpApp"))
                
                
                
                VStack{
                    
                    Image("")
                        .resizable()
                        .frame(width: 300.0, height: 300.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                    
                    Divider()
                    Spacer()
                    

                    
                    TextField("Name from phone", text: $device)
                        .padding(.vertical, 6.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .font(Font.headline.weight(.bold))
                    
                    
                    Spacer()
                    
                    
                    
                    Text("This name will be the friendly name which will identify you when accessing devices.\nThis is used when the administrator and other users of the device give you access permissions, so it should be something recognizable.")
                    Spacer()
                    
                    
                    
                    HStack{
                        Spacer()
                        
                        NavigationLink(destination: NotPairedView(), tag: 1, selection: $selection)
                        {
                            Button(action: {
                                self.selection  = 1

                            }) {
                                Text("Not paired yet")
                                    .fontWeight(.bold)
                                    .padding(5.0)
                                    .background(Color("NabtoOrange"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                            
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: PairedDevicesView(), tag: 2, selection: $selection)
                        {
                            Button(action: {
                                self.selection  = 2
                            }) {
                                Text("Paired Devices")
                                    .fontWeight(.bold)
                                    .padding(5.0)
                                    .background(Color("NabtoOrange"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                            
                        }
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: AvailableDevicesView(), tag: 3, selection: $selection)
                    {
                        Button(action: {
                            self.selection  = 3
                        }) {
                            Text("Pair New Device")
                                .fontWeight(.bold)
                                .padding(5.0)
                                .background(Color("NabtoOrange"))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                        
                    }
                    
                    
                }.padding()
                   //.toolbar{ToolbarView()}
                
            }
            
            
        }
    }
    
    struct MainScreenView_Previews: PreviewProvider {
        static var previews: some View {
            IntroductionView()
        }
    }
    /*
    struct SampleDetails: View {
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image("arrowshape.turn.up.backward.fill") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    Text("Go back")
                }
            }
        }
        
        var body: some View {
                VStack {
                    Text("sample code")
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
        }
    }
     */
    
    
    struct ToolbarView: ToolbarContent{
        
        var body: some ToolbarContent{
            
            ToolbarItem(placement: .primaryAction, content: {
                
                HStack
                {
                    Button(action: {
                        // Button
                    }, label: {
                        Image(systemName: "questionmark.circle")
                })
                    
                    Button(action: {
                        // Button
                    }, label: {
                        Image(systemName: "gearshape.fill")
                })
                }
                .padding(.top, 50.0)
            })
            
        
            
            
        }
    }
     
}
