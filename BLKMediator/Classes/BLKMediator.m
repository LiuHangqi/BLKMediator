//
//  BLKMediator.m
//  Pods
//
//  Created by liu on 2017/2/6.
//
//

#import "BLKMediator.h"
#import "BLKConnectorPrt.h"
#import "UIViewController+BLKMediator.h"

static NSMutableDictionary<NSString *, id<BLKConnectorPrt>> *_connectorDic;

@implementation BLKMediator

+ (void)registerConnector:(id<BLKConnectorPrt>)connector {
    if (![connector conformsToProtocol:@protocol(BLKConnectorPrt)]) {
        return;
    }
    
    @synchronized (_connectorDic) {
        if (_connectorDic == nil) {
            _connectorDic = [NSMutableDictionary dictionary];
        }
        
        NSString *connectorClsStr = NSStringFromClass([connector class]);
        if (_connectorDic[connectorClsStr] == nil) {
            _connectorDic[connectorClsStr] = connector;
        }
    }
}

+ (BOOL)canHandleURL:(NSURL *)URL {
    if (!_connectorDic || _connectorDic.count <= 0) {
        return NO;
    }
    
    __block BOOL success = NO;
    [_connectorDic enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id<BLKConnectorPrt>  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:@selector(canOpenURL:)]) {
            if ([obj canOpenURL:URL]) {
                success = YES;
                *stop = YES;
            }
        }
    }];
    
    return success;
}

+ (UIViewController *)viewControllerForURL:(NSURL *)URL {
    return [self viewControllerForURL:URL paramters:nil];
}

+ (UIViewController *)viewControllerForURL:(NSURL *)URL paramters:(NSDictionary *)params {
    if (_connectorDic == nil || _connectorDic.count <= 0) {
        return [UIViewController notURLFound:URL];
    }
    if (![self canHandleURL:URL]) {
        return [UIViewController notURLFound:URL];
    }
    
    __block UIViewController *returnObj = nil;
    NSDictionary *userParams = [self userParametersWithURL:URL paramters:params];
    [_connectorDic enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id<BLKConnectorPrt>  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:@selector(connectToOpenURL:paramters:)]) {
            id connect = [obj connectToOpenURL:URL paramters:userParams];
            if (connect && [connect isKindOfClass:[UIViewController class]]) {
                returnObj = connect;
                *stop = YES;
            }
        }
    }];
    
#ifdef DEBUG
    if (returnObj == nil) {
        NSLog(@"未找到对应的ViewController<URL:%@>",URL);
        returnObj = [UIViewController notURLSupport:URL];
    }
#endif
    return returnObj;
}

+ (id)serviceForProtocol:(Protocol *)protocol {
    if (_connectorDic == nil || _connectorDic.count <= 0) {
        return nil;
    }
    
    __block id returnObj = nil;
    [_connectorDic enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id<BLKConnectorPrt>  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:@selector(connectToHandleProtocol:)]) {
            returnObj = [obj connectToHandleProtocol:protocol];
            if (returnObj) {
                *stop = YES;
            }
        }
    }];
    
#ifdef DEBUG
    if (returnObj == nil) {
        NSLog(@"未找到对应的Service<Protocol:%@>",NSStringFromProtocol(protocol));
    }
#endif
    return returnObj;
}

+ (NSDictionary *)userParametersWithURL:(nonnull NSURL *)URL paramters:(nullable NSDictionary*)paramters {
    NSArray *pairs = [URL.query componentsSeparatedByString:@"&"];
    NSMutableDictionary *userParams = [NSMutableDictionary dictionary];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        if (kv.count == 2) {
            NSString *key = kv[0];
            NSString *value = [self URLDecodedString:kv[1]];
            userParams[key] = value;
        }
    }
    [userParams addEntriesFromDictionary:paramters];
    return userParams;
}

+(nonnull NSString *)URLDecodedString:(nonnull NSString *)urlString
{
    NSString *result = urlString;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_9_0
    result = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                                   (__bridge CFStringRef)urlString,
                                                                                                   CFSTR(""),
                                                                                                   kCFStringEncodingUTF8);
#else
    result = [urlString stringByRemovingPercentEncoding];
#endif
    return result;
}

@end
