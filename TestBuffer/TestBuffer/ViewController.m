//
//  ViewController.m
//  TestBuffer
//
//  Created by mac on 2019/1/29.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ViewController.h"
#import "User.pbobjc.h"
#import <AFNetworking.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    User *user = [User new];
    
    NSLog(@"user = %@",user);
    // 序列化
    NSData *data = [user data];
    // 反序列化
    User *u = [User parseFromData:data error:nil];
    
    
}

#define url @""

- (void)protoPost{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //设置超时时间(默认60s)
    request.timeoutInterval = 15;
    //设置请求方式
    request.HTTPMethod = @"POST";
    //设置请求体
//    NSString *param = [NSString stringWithFormat:@"username=%@&pwd=%@", loginUser,loginPwd];
//    // NSString --> NSData
//    request.HTTPBody =  [param dataUsingEncoding:NSUTF8StringEncoding];
    User *user = [User new];
    NSData *data = [user data];
    request.HTTPBody = data;
    // 设置请求头信息
    [request setValue:@"iphone" forHTTPHeaderField:@"User-Agent"];    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //隐藏蒙板

    }];
    
}
        
@end
