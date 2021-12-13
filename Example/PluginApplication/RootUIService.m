//
//  RootUIService.m
//  CommonApp
//
//  Created by mac on 2021/7/20.
//

#import "RootUIService.h"
#import "YYViewController.h"

@implementation RootUIService

PLUGGABLE_EXPORT_SERVICE(RootUI)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {

    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    application.delegate.window = window;
    
    YYViewController* vc = [[YYViewController alloc] init];
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vc];
    window.rootViewController = nav;
    [window makeKeyAndVisible];
    
    return YES;
}

@end
