//
//  SocketViewController.m
//  MyApp
//
//  Created by GJ on 16/8/16.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "SocketViewController.h"
#import "CDEchoClient.h"
#import "CommonFunction.h"
#import "AFHttpNetHelperAPIClient.h"

@implementation SocketViewController
{
    CDEchoClient *client;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    client = [[CDEchoClient alloc] initWithAddress:@"127.0.0.1" port:1234];
}

- (IBAction)sendButtonClicked:(UIButton *)sender {
    // 发送bye消息会断开与服务器的连接 不能再发送消息
    if (client && client.errorCode == NoError) {
        NSString *msg = [self.msgField.text stringByTrimmingCharactersInSet:
                         [NSCharacterSet whitespaceCharacterSet]];
        if (msg.length > 0) {
            [self.msgField resignFirstResponder];
            self.echoMsgLabel.text = [client sendMessage:msg];
        }
    }
    else {
        NSLog(@"Cannot send message!!!");
    }
}

@end
