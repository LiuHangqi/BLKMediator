//
//  BLKConnectorPrt.h
//  Pods
//
//  Created by liu on 2017/2/6.
//
//

#import <Foundation/Foundation.h>

@protocol BLKMediatorPrt <NSObject>

@optional

- (BOOL)canOpenURL:(nonnull NSURL *)URL;

- (nullable UIViewController *)connectToOpenURL:(nonnull NSURL *)URL paramters:(nullable NSDictionary *)params;

- (nullable id)connectToHandleProtocol:(nonnull Protocol *)servicePrt;

@end
