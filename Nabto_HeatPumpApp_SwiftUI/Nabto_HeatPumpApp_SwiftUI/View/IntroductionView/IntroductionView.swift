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
    
    init(){
        //Resets Userdefaults for testing a clean app
        //viewModel.resetUserdefaults()
    }
    
    
    var body: some View {
        
        //This navigationview follows through the whole application
        NavigationView {
            
            ZStack
            {
                //if(viewModel.getUser()){
                    
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
                        
                        //TODO: Needs fixin'
                        //You can just go back from NotPairedView and edit the username (List of usernames)??
                        NavigationLink(destination: NotPairedView(), tag: 1, selection: $selection)
                        {
                        }
                        
                        NavigationLink(destination: PairedDevicesView(username: _username), tag: 2, selection: $selection)
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
                                if(viewModel.getUsername() == _username){
                                    self.selection = 2
                                }
                                else{
                                    viewModel.createAdmin(username: _username)
                                    
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
               /* else {
                    selection = 2
                    NavigationLink(destination: PairedDevicesView(), tag: 2, selection: $selection)
                    {
                    }
                }*/
                
            }.navigationBarHidden(true).accentColor((Color("NabtoOrange")))
            
            //Hides the navigationbar on the IntroductionView, but colors the other navigationbarTexts with an orange color
        //}.navigationBarHidden(true).accentColor((Color("NabtoOrange")))
        
    }
    
    struct IntroductionView_Previews: PreviewProvider {
        static var previews: some View {
            IntroductionView()
        }
    }
    
    
    
}
