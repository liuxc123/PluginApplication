//
//  ThemeService.m
//  BEEProject
//
//  Created by mac on 2021/8/11.
//

#import "ThemeService.h"

@implementation ThemeService

PLUGGABLE_EXPORT_SERVICE(Theme)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions
{
    /// 配置主题
    [self setupTheme];
    
    return YES;
}

#pragma mark - private methods

- (void)setupTheme {
}

@end
