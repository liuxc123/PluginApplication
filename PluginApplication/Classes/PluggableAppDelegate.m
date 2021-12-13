//
//  PluggableAppDelegate.m
//  PluggableAppDelegate
//
//  Created by mac on 2021/7/20.
//

#import "PluggableAppDelegate.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation PluggableAppDelegate

#pragma mark -
#pragma mark Method Resolution

- (NSArray<NSString *> *)appDelegateMethods {
    static NSMutableArray *methods = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unsigned int methodCount = 0;
        struct objc_method_description *methodList = protocol_copyMethodDescriptionList(@protocol(UIApplicationDelegate), NO, YES, &methodCount);
        methods = [NSMutableArray arrayWithCapacity:methodCount];
        for (int i = 0; i < methodCount; i ++) {
            struct objc_method_description md = methodList[i];
            [methods addObject:NSStringFromSelector(md.name)];
        }
        free(methodList);
    });
    return methods;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    BOOL canResponse = [self methodForSelector:aSelector] != nil && [self methodForSelector:aSelector] != _objc_msgForward;
    if (!canResponse && [[self appDelegateMethods] containsObject:NSStringFromSelector(aSelector)]) {
        canResponse = [[PluggableAppServiceManager sharedManager] proxyCanResponseToSelector:aSelector];
    }
    return canResponse;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [[PluggableAppServiceManager sharedManager] proxyForwardInvocation:anInvocation];
}

@end
