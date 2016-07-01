//
//  PublicMethod.h
//  URL加解密
//
//  Created by Christian on 16/7/1.
//  Copyright © 2016年 slq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicMethod : NSObject

/**
 *  base64加密
 *
 *  @param data <#data description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)encodeBase64Data:(NSData *)data;
/**
 *  base64解密
 *
 *  @param input <#input description#>
 *
 *  @return <#return value description#>
 */
+ (NSData*)decodeBase64String:(NSString * )input;
@end
