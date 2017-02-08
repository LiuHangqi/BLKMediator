//
//  BLKModulA.m
//  BLKMediator
//
//  Created by liu on 2017/2/6.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "BLKModulA.h"
#import "BLKMediator.h"
#import "BLKViewControllerA.h"
@implementation BLKModulA

+ (void)load {
    [BLKMediator registerConnector:[self sharedConnector]];
}

+ (instancetype)sharedConnector {
    static BLKModulA *modula = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        modula = [[BLKModulA alloc]init]; 
    });
    return modula;
}

- (BOOL)canOpenURL:(NSURL *)URL {
    if ([URL.host isEqualToString:@"ModulA"]) {
        return YES;
    }
    
    return NO;
}

- (UIViewController *)connectToOpenURL:(NSURL *)URL paramters:(NSDictionary *)params {
    if ([URL.host isEqualToString:@"ModulA"]) {
        if (params[@"tag"]==nil) {
            return [UIViewController paramsError:params];
        }
        if ([URL.path isEqualToString:@"/vca"]) {
            BLKViewControllerA *vca = [[BLKViewControllerA alloc]init];
            return vca;
        }
    }
    return nil;
}

- (id)connectToHandleProtocol:(Protocol *)servicePrt {
    return nil; 
}

@end
