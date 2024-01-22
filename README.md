## Purpose

This is a test project to show a memory leak caused by the `FlowNavigator` environment object of [FlowStacks](https://github.com/johnpatrickmorgan/FlowStacks).

## Setup

The app has the latest version of FlowStacks 0.3.8 added as a local dependecy. 

Simply open the project in Xcode and run the app.

## How to see the memory leak?

1. Run the app.
2. After a few seconds a loading screen will be replaced by a simple screen with a button.
3. The reset button will restart the flow.
4. Press the reset button at least once.
5. Look into the log statements (or alternatively, use the memory graph debugger from Xcode).

Whenever an instance of `TabBarCoordinatorViewModel` gets created, there will be this log statement '### Creates instance ObjectIdentifier([Object identifier])'.\
On the other hand, there will be another log statement '### Deinit called \(ObjectIdentifier([ObjectIdentifier]))' as soon as an object gets released.

You should see the first instance will be created but never released again. In our production app, we have the same issue and even more instances are kept which makes it very hard whenever a user switches the country/market.
All subscriptions are kept around which also causes too many requests to be made in an increasing number.

__Example logs:__
```
### Creates instance ObjectIdentifier(0x0000600000221b40)
### Creates instance ObjectIdentifier(0x0000600000233280)
### Deinit called ObjectIdentifier(0x0000600000233280)
### Creates instance ObjectIdentifier(0x000060000021fe20)
```

__Expected behavior:__\
All instances are released correctly since there is no strong reference to them anymore.

__Actual behavior:__\
At least one instance (the first one in this example project) is kept around and would also still cause subscriptions to fire.

__What fixes this issue?__\
Commenting out this line `.environmentObject(FlowNavigator($routes))` in Router.swift of FlowStacks resolves the issue. Even though, this is not a solution obviously for the framework.

