//
//  DataArchiveHelper.h
//  MyApp
//
//  Created by GJ on 16/8/25.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataArchiveHelper : NSObject

- (instancetype)shareInstance;

- (void)addCommonInfosWithKey:(NSString*)key value:(id)value;

- (id)readCommonInfosWithKey:(NSString*)key;

- (void)removeCommonInfosWithKey:(NSString*)key;

@end
