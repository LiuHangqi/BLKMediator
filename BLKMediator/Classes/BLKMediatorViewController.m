//
//  BLKMediatorViewController.m
//  Pods
//
//  Created by liu on 2017/2/7.
//
//

#import "BLKMediatorViewController.h"

@interface BLKMediatorViewController ()

@end

@implementation BLKMediatorViewController {
    UILabel *_contentLabel;
}

- (instancetype)init {
    if (self = [super init]) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textColor = [UIColor greenColor];
        _contentLabel.backgroundColor = [UIColor blackColor];
        _contentLabel.font = [UIFont systemFontOfSize:13];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.numberOfLines = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _contentLabel.frame = self.view.bounds;
    [self.view addSubview:_contentLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+ (UIViewController *)paramsError:(id)params {
    BLKMediatorViewController *vc = [[BLKMediatorViewController alloc]init];
    vc->_contentLabel.text = [NSString stringWithFormat:@"Paramters error \n\n%@",params];
    return vc;
}

+ (UIViewController *)notURLSupport:(NSURL *)URL {
    BLKMediatorViewController *vc = [[BLKMediatorViewController alloc]init];
    vc->_contentLabel.text = [NSString stringWithFormat:@"The module does not support this URL\n\n<%@>",URL];
    return vc;
}

+ (UIViewController *)notURLFound:(NSURL *)URL {
    BLKMediatorViewController *vc = [[BLKMediatorViewController alloc]init];
    vc->_contentLabel.text = [NSString stringWithFormat:@"The BLKMediator does not fond this URL\n\n<%@>",URL];
    return vc;
}

@end
