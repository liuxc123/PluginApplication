//
//  PluggableAppServiceManager.h
//  PluggableAppDelegate
//
//  Created by mac on 2021/7/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define PLUGGABLE_EXPORT_SERVICE(name) \
+ (void)load {[[PluggableAppServiceManager sharedManager] registerService:[self new]];} \
- (NSString *)serviceName { return @#name; }

NS_ASSUME_NONNULL_BEGIN

@protocol PluggableAppService <UIApplicationDelegate>

@required
- (NSString *)serviceName;

@end

@interface PluggableAppServiceManager : NSObject

+ (instancetype)sharedManager;

- (void)registerService:(id<PluggableAppService>)service;

- (BOOL)proxyCanResponseToSelector:(SEL)aSelector;
- (void)proxyForwardInvocation:(NSInvocation *)anInvocation;

@end

NS_ASSUME_NONNULL_END
