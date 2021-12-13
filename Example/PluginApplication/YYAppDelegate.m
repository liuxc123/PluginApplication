//
//  YYAppDelegate.m
//  PluginApplication
//
//  Created by liuxc123 on 12/13/2021.
//  Copyright (c) 2021 liuxc123. All rights reserved.
//

#import "YYAppDelegate.h"

@implementation YYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
    // Override point for customization after application launch.
    
    ///------------------------------------------------------------------------------------------┐
    // This file is NOT neccessary. You can use MLSOAppDelegate directly, without any subclasses.│
    ///------------------------------------------------------------------------------------------┘
    // Do something before all other app services
    // ...
    
    // PluggableAppDelegate (the super) does not implement -application:didFinishLaunchingWithOptions: actually.
    // It forwards the message to all registered services.
    // You MUST call super to ensure all registered service implementation get called.
    if ([super respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
        [super application:application didFinishLaunchingWithOptions:launchOptions];
    }
    // do something
    
    return YES;
}

@end
