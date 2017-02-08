//
//  UIViewController+BLKMediator.h
//  Pods
//
//  Created by liu on 2017/2/8.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (BLKMediator)

//URL可处理，参数错误
+ (nonnull UIViewController *)paramsError:(nullable id)params;
//URL可处理，但开发者未针对URL返回ViewController
+ (nonnull UIViewController *)notURLSupport:(nonnull NSURL *)URL;
//URL不可处理
+ (nonnull UIViewController *)notURLFound:(nonnull NSURL *)URL;

@end
