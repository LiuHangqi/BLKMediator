//
//  BLKMediator.h
//  Pods
//
//  Created by liu on 2017/2/6.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIViewController+BLKMediator.h"
#import "BLKMediatorPrt.h"

@interface BLKMediator : NSObject

+ (void)registerConnector:(nonnull id<BLKMediatorPrt>)connector;

+ (nullable UIViewController *)viewControllerForURL:(nonnull NSURL *)URL;
+ (nullable UIViewController *)viewControllerForURL:(nonnull NSURL *)URL paramters:(nullable NSDictionary *)params;

+ (nullable id)serviceForProtocol:(nonnull Protocol *)protocol;

@end
