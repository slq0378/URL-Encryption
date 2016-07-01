//
//  ViewController.m
//  URL加解密
//
//  Created by Christian on 16/7/1.
//  Copyright © 2016年 slq. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <AFHTTPSessionManager.h>
#import "NSData+Encryption.h"
#import "PublicMethod.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *str = [NSString stringWithFormat:@"'method':'securityAdd','userId':'%@','userPsw':'%@','content':'%@'",@"song",@"123",@"content"];
    NSLog(@"原始数据：%@",str);
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSData *aaa = [data AES128EncryptWithKey:@"song.com"]; // aes加密
    NSLog(@"加密AES128后：%@",aaa);
    NSString *bbb = [PublicMethod encodeBase64Data:aaa];//base64加密
    NSLog(@"base64加密后：%@",bbb);
    
    // 加密打包后数据，这个传到服务端，由服务端来解析
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"info"] = bbb;
    
    NSData *da = [PublicMethod decodeBase64String:bbb]; //base64解密
    NSString *ccc = [[NSString alloc] initWithData:da encoding:NSUTF8StringEncoding];
    NSLog(@"base64解密后：%@",ccc);
    NSData *ddd = [da AES128DecryptWithKey:@"song.com"];// aes解密
    NSString *eee = [[NSString alloc] initWithData:ddd encoding:NSUTF8StringEncoding];
    NSLog(@"解密AES128后：%@",eee);
    
    [[AFHTTPSessionManager manager] POST:@"https://192.168.1.23:82/frame/webInteface.do?" parameters:para success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
