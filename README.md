# TwinEndpointApp

Swift iOS12.0 app utilising networking layer in a separate module (MultiNetworking - also in my repository) implemented as a cocoapod (https://cocoapods.org/pods/MultiNetworking).

- The application is to be able to rotate the screen
- The app supports iOS 12 and higher
- The network layer is implemented as a separate module (framework) attached to the project (cocoapods)

The application has 2 screens:
1. List of items.
- Data for the list is to come from two different APIs and merged before displaying.
- Elements presented in UITableView
- The list item has an information about which API they come from

2. The screen with details is to be a simple presentation of the previously selected element
- The screen contains information about which API the data comes from
