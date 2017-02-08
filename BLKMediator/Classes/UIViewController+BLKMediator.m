//
//  UIViewController+BLKMediator.m
//  Pods
//
//  Created by liu on 2017/2/8.
//
//

#import "UIViewController+BLKMediator.h"
#import "BLKMediatorViewController.h"

@implementation UIViewController (BLKMediator)

+ (UIViewController *)paramsError:(id)params {
    return [BLKMediatorViewController paramsError:params];
}

+ (UIViewController *)notURLSupport:(NSURL *)URL {
    return [BLKMediatorViewController notURLSupport:URL];
}

+ (UIViewController *)notURLFound:(NSURL *)URL {
    return [BLKMediatorViewController notURLFound:URL];
}

@end
