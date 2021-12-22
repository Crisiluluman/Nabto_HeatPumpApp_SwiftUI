# Nabto_HeatPumpApp_SwiftUI

This app helps to illustrate how Nabto's technology is used and works with a demo "Heat Pump" device.

## Installation 
* Make sure to have https://cocoapods.org installed


Open a terminal and navigate to:
*Nabto_HeatPumpApp_SwiftUI/Nabto_HeatPumpApp_SwiftUI*

Inside the folder, run the following command:

```bash
pod install
```

This will install all needed SDK's to run the code. 


## Overview of project
The project has *three* main folders, that attempt to follow the "MVVM" design pattern.

* Models
  * Classes and Structs for data like "Device" and "User" etc

* NabtoAccessFunctions
  * Classes that involve and handle Nabto technologies to, for example, pair devices using CoAP

* View
  * Includes a list os subfolders with Views and ViewModels for the different application Views.
