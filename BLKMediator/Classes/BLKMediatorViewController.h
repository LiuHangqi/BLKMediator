//
//  BLKMediatorViewController.h
//  Pods
//
//  Created by liu on 2017/2/7.
//
//

#import <UIKit/UIKit.h>

@interface BLKMediatorViewController : UIViewController


+ (nonnull UIViewController *)paramsError:(id)params;

+ (nonnull UIViewController *)notURLSupport:(NSURL *)URL;

+ (nonnull UIViewController *)notURLFound:(NSURL *)URL;

@end
