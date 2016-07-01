//
//  PublicMethod.m
//  URL加解密
//
//  Created by Christian on 16/7/1.
//  Copyright © 2016年 slq. All rights reserved.
//

#import "PublicMethod.h"

#import <GTMBase64.h>

@implementation PublicMethod
+ (NSString*)encodeBase64Data:(NSData *)data {
    data = [GTMBase64 encodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

+ (NSData*)decodeBase64String:(NSString * )input {
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 decodeData:data];
    return data;
}
@end
