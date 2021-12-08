//
//  MainScreenView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 01/10/2021.
//

import SwiftUI
import AlertToast


struct IntroductionView: View {
    
    @State private var viewModel = IntroductionViewModel()
    
    @State private var showToast = false
    @State private var selection: Int? = nil
    
    @State var _username: String = ""
    
    
    var body: some View {
        
        //This navigationview follows through the whole application
        NavigationView {
            
            ZStack
            {
                Color("Background")
                    .ignoresSafeArea()
                    .opacity(0.6)
                
                VStack{
                    
                    Image("emptyImg")
                        .resizable()
                        .frame(width: 300.0, height: 300.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                    
                    Divider()
                    Spacer()
                    
                    //Probably not best in practive for navigating here, but I tried
                    NavigationLink(destination: NotPairedView(), tag: 1, selection: $selection)
                    {
                    }
                    NavigationLink(destination: PairedDevicesView(), tag: 2, selection: $selection)
                    {
                    }
                    
                    //Textfield for username (Phone name)
                    TextField(
                        "\(UIDevice.current.name)",
                        text: $_username,
                        
                        onCommit: {
                            if(_username.isEmpty){
                                showToast.toggle()
                            }
                            else{
                                viewModel.createUser(username: _username)
                                //TODO: Check if the username exists, then decide which view to take
                                self.selection  = 1
                            }
                        }
                    ).padding(.vertical, 6.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .font(Font.headline.weight(.bold))
                        .textInputAutocapitalization(.never)
                        .background(.white)
                    
                    
                    Spacer()
                    
                    
                    Text("This name will be the friendly name which will identify you when accessing devices.\nThis is used when the administrator and other users of the device give you access permissions, so it should be something recognizable.")
                    Spacer()
                    
                    
                }.padding()
                    .toast(isPresenting: $showToast){
                        // `.alert` is the default displayMode
                        AlertToast(type: .regular, title: "Please type a username")
                        //Choose .hud to toast alert from the top of the screen
                        //AlertToast(displayMode: .hud, type: .regular, title: "Message Sent!")
                    }
                
            }
            
            //Hides the navigationbar on the IntroductionView, but colors the other navigationbarTexts with an orange color
        }.navigationBarHidden(true).accentColor((Color("NabtoOrange")))
        
    }
    
    struct MainScreenView_Previews: PreviewProvider {
        static var previews: some View {
            IntroductionView()
        }
    }
    
    
    
}
