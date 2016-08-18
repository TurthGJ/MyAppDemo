//
//  CDEchoClient.h
//  MyApp
//
//  Created by GJ on 16/8/16.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CFNetworkServerErrorCode) {
    NoError,
    SocketError,
    ConnectError
};

static const int kMaxMessageLength = 4096;
static const int kConnectionTimeout = 15;

@interface CDEchoClient : NSObject

@property (nonatomic) NSUInteger errorCode;
@property (nonatomic) CFSocketRef socket;

- (instancetype) initWithAddress:(NSString *) address port:(int) port;

- (NSString *) sendMessage:(NSString *) msg;

@end
