# URL-Encryption
## 背景介绍

- iOS 下URL加解密，项目使用AFNetworking
- 虽然是使用HTTPS，但是从安全方面考虑，在很多情况下还是需要对url的参数进行加密的。
- 接口如 https://192.160.0.123:92/frame/webInteface.do?(method=addNew&uid=123&pass=131)
- 不管是get请求还是post请求，都可以对后边的参数进行加密
- get请求比较简单，这里直接说post请求吧

## 使用

```objc
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"method"] = @"securityAdd";
    para[@"userId"] = userId;
    para[@"userPsw"] = userPsw;
    para[@"content"] = @"ddddd123891237";

    // 开始加密****************************
    NSString *str = [NSString stringWithFormat:@"'method':'securityAdd','userId':'%@','userPsw':'%@','content':'%@'",userId,userPsw,content];
    NSLog(@"原始数据：%@",str);
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSData *aaa = [data AES128EncryptWithKey:@"song.com"]; // aes加密
    NSLog(@"加密AES128后：%@",aaa);
    NSString *bbb = [PublicMethod encodeBase64Data:aaa];//base64加密
    NSLog(@"base64加密后：%@",bbb);

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"info"] = bbb;

    // 开始解密****************************
    NSData *da = [PublicMethod decodeBase64String:bbb]; //base64解密
    NSString *ccc = [[NSString alloc] initWithData:da encoding:NSUTF8StringEncoding];
    NSLog(@"base64解密后：%@",ccc);
    NSData *ddd = [da AES128DecryptWithKey:@"song.com"];// aes解密
    NSString *eee = [[NSString alloc] initWithData:ddd encoding:NSUTF8StringEncoding];
    NSLog(@"解密AES128后：%@",eee);

    NSString *url = [NSString stringWithFormat:@"https://%@:82/frame/webInteface.do?", NHBaseURL];
    AFHTTPRequestOperation *operation = [NetWorkInst POST:url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {

    }];
```
