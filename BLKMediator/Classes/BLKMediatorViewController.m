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
        _contentLabel.textColor = [UIColor whiteColor];
        _contentLabel.backgroundColor = [UIColor redColor];
        _contentLabel.font = [UIFont systemFontOfSize:13];
        _contentLabel.numberOfLines = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _contentLabel.frame = CGRectMake(20, 20, CGRectGetWidth(self.view.bounds)-40, CGRectGetHeight(self.view.bounds)-40);
    [self.view addSubview:_contentLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+ (UIViewController *)paramsError:(id)params {
    BLKMediatorViewController *vc = [[BLKMediatorViewController alloc]init];
    NSString *message = [NSString stringWithFormat:@"Paramters error \n\n%@",params];
    vc->_contentLabel.text = message;
    NSLog(@"\n\n%@\n\n",message);
    return vc;
}

+ (UIViewController *)notURLSupport:(NSURL *)URL {
    BLKMediatorViewController *vc = [[BLKMediatorViewController alloc]init];
    NSString *message = [NSString stringWithFormat:@"The module does not support this URL\n\n<%@>",URL];
    vc->_contentLabel.text = message;
    NSLog(@"\n\n%@\n\n",message);
    return vc;
}

+ (UIViewController *)notURLFound:(NSURL *)URL {
    BLKMediatorViewController *vc = [[BLKMediatorViewController alloc]init];
    NSString *message = [NSString stringWithFormat:@"The BLKMediator does not fond this URL\n\n<%@>",URL];
    vc->_contentLabel.text = message;
    NSLog(@"\n\n%@\n\n",message);
    return vc;
}

@end
