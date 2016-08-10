//
//  UILabel+Color.m
//  YZCommunity
//
//  Created by yizhi on 16/1/22.
//  Copyright © 2016年 压寨团队. All rights reserved.
//

#import "UILabel+Color.h"
#import "UIColor+Conver.h"

@implementation UILabel (Color)

/**
 *  [color=32DD14]TEST[/color]123123[color=32DD14]xxxxxx[/color]
 *
 *  @param text <#text description#>
 */
-(void)setColorText:(NSString *)text{
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[color=+([0-9A-F]{6})+\\]+([\\s\\S]+?)\\[/color\\]" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSMutableString * outStr = [[NSMutableString alloc]init];
    NSMutableArray * colorArr = [[NSMutableArray alloc]init];
    
    NSArray * arr =[regex matchesInString:text options:NSMatchingReportCompletion range:NSMakeRange(0, [text length])];
    NSInteger start = 0;
    for (NSTextCheckingResult *result in arr) {
        NSInteger ra = result.range.location;
        if(start < ra){
            NSString * s =[text substringWithRange:NSMakeRange(start, ra-start)];
            [outStr appendString:s];
        }
        NSString *color = [NSString stringWithString:[text substringWithRange:[result rangeAtIndex:1]]];
        NSString *msg = [NSString stringWithString:[text substringWithRange:[result rangeAtIndex:2]]];
        NSInteger len =outStr.length;
        [outStr appendString:msg];
        [colorArr addObject:@{@"star":@(len),@"length":@(msg.length),@"color":color}];
        start = result.range.location + result.range.length;
    }
    
    if(start < text.length){
        [outStr appendString:[text substringWithRange:NSMakeRange(start, text.length-start)]];
    }
    
    NSMutableAttributedString *msgAttrString = [[NSMutableAttributedString alloc] initWithString:outStr];
    NSMutableParagraphStyle *msgParStyle = [[NSMutableParagraphStyle alloc] init];
    [msgParStyle setLineSpacing:4]; // 调整行间距
    [msgAttrString addAttribute:NSParagraphStyleAttributeName value:msgParStyle range:NSMakeRange(0, outStr.length)];
    
    for (NSDictionary * range in colorArr) {
        [msgAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHex:range[@"color"]] range:NSMakeRange([range[@"star"] integerValue], [range[@"length"] integerValue])];
    }
    self.attributedText = msgAttrString;
}

@end