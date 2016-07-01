//
//  NSData+Encryption.h
//  
//
//  Created by Christian on 16/7/1.
//  Copyright © 2016年 slq. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSString;
@interface NSData (Encryption)
#pragma mark - 基本加密方法
/**
 * AES128加密
 */
- (NSData *)AES128EncryptWithKey:(NSString *)key;   //AES128加密

/**
 * AES128解密
 */
- (NSData *)AES128DecryptWithKey:(NSString *)key;   //解密


@end

