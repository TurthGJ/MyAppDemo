//
//  NSData+Extend.m
//  YZCommunity
//
//  Created by yizhi on 16/3/2.
//  Copyright © 2016年 压寨团队. All rights reserved.
//

#import "NSData+Extend.h"
#import <objc/runtime.h>

char* const ASSOCIATION_NUMBER_READ_IDX = "ASSOCIATION_NUMBER_READ_IDX";

@implementation NSData(Extend)

-(int) getIdx{
    NSNumber * idx = (NSNumber *)objc_getAssociatedObject(self,ASSOCIATION_NUMBER_READ_IDX);
    if(idx) return [idx intValue];
    return 0;
}

-(void) setIdx:(NSInteger) idx{
    objc_setAssociatedObject(self, ASSOCIATION_NUMBER_READ_IDX, [NSNumber numberWithInteger:idx ], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//-(int) readInt{
//    int idx = [self getIdx];
//    int v = [YZSocketParse decoderIntWithData:self begin:idx];
//    [self setIdx:idx+4];
//    return v;
//}
//-(long long) readLong{
//    int idx = [self getIdx];
//    long long v = [YZSocketParse decoderLongWithData:self begin:idx];
//    [self setIdx:idx+8];
//    return v;
//}
//-(NSString *) readString:(NSInteger) len{
//    int idx = [self getIdx];
//    NSString * v = [YZSocketParse decoderStringWithData:self begin:idx length:len];
//    [self setIdx:idx+len];
//    return v;
//}
//-(NSData *) readData:(NSInteger) len{
//    int idx = [self getIdx];
//    NSData * v = [YZSocketParse subDataWithDataSource:self begin:idx length:len];
//    [self setIdx:idx+len];
//    return v;
//}
//
//-(YZSocketVoiceModel *) toVoiceModel{
//    if(self.length < 34) return nil;
//    NSString * magic1   = [self readString:1];
//    NSString * magic2   = [self readString:1];
//    int version         = [self readInt];
//    int cid             = [self readInt];
//    long long uid       = [self readLong];
//    int barid           = [self readInt];
//    int barseat         = [self readInt];
//    int serId           = [self readInt];
//    int len             = [self readInt];
//    if(self.length < 34+len) return nil;
//    NSData * data       = [self readData:len];
//    return [[YZSocketVoiceModel alloc] initWithMagic1:magic1 magic2:magic2 version:version cid:cid uid:uid barid:barid barseat:barseat serid:serId len:len data:data];
//}
@end
