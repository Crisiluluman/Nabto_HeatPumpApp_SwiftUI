//
//  PairNewDeviceView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 04/10/2021.
//

import SwiftUI
import NabtoEdgeClient

private var client: Client = Client()


//private var discoveredDevices : [Device] = []
//private var discoveredDevicesSet = Set<Device>()
//private var discoveredDevices = Array(Set(discoveredDevicesSet))

private var mdnsResults : [MdnsResult] = []

struct AvailableDevicesView: View {

    @ObservedObject var mdnsReciever: MdnsRecieve = MdnsRecieve()
    private var scanner = client.createMdnsScanner()
    
    init (){
        
        client = Client()
        scanner.addMdnsResultReceiver(mdnsReciever)
        
        try? client.setLogLevel(level: "trace")
        client.enableNsLogLogging()
        
        try? scanner.start() //better error handling? INVALID_STATE exception
                
    }
    
    
    var body: some View {
        
        // NavigationView{
        VStack(alignment: .leading) {
            
            if (mdnsReciever.discoveredDevices.isEmpty){
                VStack(alignment: .leading){
                    Spacer()

                    Text("Looking for devices (Spinning icon)")
                    

                    Text("Please make sure you are connected to the local network with the device")
                    Spacer()

                }
                
            }
            
            else {
                NavigationView {
                    
                    
                    List(mdnsReciever.discoveredDevices)
                    {
                        device in
                        NavigationLink(destination: PairNewDevice(deviceId: device.deviceId, productId: device.productId))
                        {
                            //Spacer()
                            HStack {
                                Image(systemName: "photo")
                                Spacer()
                                VStack(alignment: .leading) {
                                    
                                    Text("ProductID:  \(device.productId)")
                                    Text("DeviceID:  \(device.deviceId )")

                                }
                            }
                            //TODO: Onclick i stedet, men mangler mere research
                        }.onAppear {
                            scanner.stop()
                        }
                    }
                }
            }
            
            Spacer()
        }
    }

    
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

    


struct PairNewDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableDevicesView()
        
    }
    
}


//TODO: Make MVVM WORK

class PairNewDeviceViewModel{
}



}



