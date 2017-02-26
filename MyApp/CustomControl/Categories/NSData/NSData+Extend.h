//
//  NSData+Extend.h
//  YZCommunity
//
//  Created by yizhi on 16/3/2.
//  Copyright © 2016年 压寨团队. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "YZSocketVoiceModel.h"

@interface NSData (Extend)
@property (nonatomic, strong) NSNumber * readIdx;

-(int) getIdx;
-(int) readInt;
-(long long) readLong;
-(NSString *) readString:(NSInteger) len;
-(NSData *) readData:(NSInteger) len;

//-(YZSocketVoiceModel *) toVoiceModel;
@end
