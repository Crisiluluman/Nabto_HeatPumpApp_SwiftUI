// PairNewDeviceView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 04/10/2021.
//

import SwiftUI
import NabtoEdgeClient

private var client: Client = Client()

private var mdnsResults : [MdnsResult] = []

struct DiscoverDevicesView: View {
    
    @ObservedObject var mdnsReciever: MdnsRecieve = MdnsRecieve()
    @State var isTapped = false
    
    private var scanner = client.createMdnsScanner()
    
    init (){
        
        scanner.addMdnsResultReceiver(mdnsReciever)
        
        do {
            try scanner.start()
            
        }catch NabtoEdgeClientError.INVALID_ARGUMENT{
            print("Invalid level")
        }
        catch NabtoEdgeClientError.INVALID_STATE{
            print("The scan could not be started, e.g. the client is being stopped")
        }
        catch let error{
            print(error)
        }
    }
    
    
    var body: some View {
        
        ZStack {
            
            Color("Background")
                .ignoresSafeArea()
                .opacity(0.6)
            
            VStack {
                
                Spacer()
                
                Image("emptyImg")
                    .resizable()
                    .frame(width: 300.0, height: 150.0)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                
                Spacer()
                
                //If the scanner is empty, this is showed instead
                if (mdnsReciever.discoveredDevices.isEmpty){
                    VStack(alignment: .leading){
                        Spacer()
                        
                        Text("Looking for devices (Spinning icon)")
                        
                        
                        Text("Please make sure you are connected to the local network with the device")
                        Spacer()
                        
                    }
                    
                }
                
                else {
                    
                    //Lists the devices discovered by the MdnsScanner
                    List(mdnsReciever.discoveredDevices)
                    {
                        device in
                        NavigationLink(destination: PairNewDeviceView(deviceId: device.deviceId, productId: device.productId), isActive: $isTapped)
                        {
                            HStack {
                                Image("emptyImg")
                                    .resizable()
                                    .frame(width: 30.0, height: 30.0)
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                                Spacer()
                                VStack(alignment: .leading) {
                                    
                                    
                                    Text("ProductID:  \(device.productId)")
                                    Text("DeviceID:  \(device.deviceId )")
                                    
                                }
                            }.onTapGesture {
                                isTapped = true
                                scanner.stop()
                            }
                        }
                    }
                }
                
                Spacer()
            }.toolbar{HomeToolbar()}
            
            
        .navigationTitle("Pair new device").font(.subheadline)
        }
    }
    
    //MdnsScanner which should not be in this class, but I've tried removing it without luck
    public class MdnsRecieve: MdnsResultReceiver , ObservableObject {
        
        @Published var discoveredDevices : [Device] = []
        
        
        public func onResultReady(result: MdnsResult) {
            
            DispatchQueue.main.async()
            {
                
                let resultProductId : String = result.productId
                let resultDeviceId : String = result.deviceId
                
                let device: Device = Device(productId: resultProductId, deviceId: resultDeviceId)
                
                self.discoveredDevices.append(device)
                
                
            }
        }
    }
}



struct PairNewDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverDevicesView()
        
    }
    
}







