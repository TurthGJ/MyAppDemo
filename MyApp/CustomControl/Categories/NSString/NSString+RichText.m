//
//  NSString+RichText.m
//  YZCommunity
//
//  Created by 曾治铭 on 16/1/21.
//  Copyright © 2016年 压寨团队. All rights reserved.
//

#import "NSString+RichText.h"
#import "NSString+Check.h"

@implementation NSString (RichText)

/**
 *  将带[图片文件名字]符串解析为富文本
 *
 *  @param string 带[图片文件名字]符串解析为富文本
 *  @param font   字体大小
 *
 *  @return NSAttributedString对象
 */
+ (NSAttributedString *)richTextWithSting:(NSString *)string font:(UIFont *)font
{
    // 空值判断
    if ([NSString isNull:string] || font == nil) {
        NSLog(@"--->将带[图片文件名字]符串解析为富文本错误, 参数为空");
        return nil;
    }

    // 创建富文本
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    
    // 解析富文本
    while (YES) {
        NSMutableString *mStr = attrString.mutableString;
        NSRange leftRange = [mStr rangeOfString:@"["];
        NSRange rightRange = [mStr rangeOfString:@"]"];
        if (leftRange.location == NSNotFound || rightRange.location == NSNotFound) {
            break;
        }
        NSRange repRange = NSMakeRange(leftRange.location, rightRange.location-leftRange.location+1);
        NSRange subRange = NSMakeRange(leftRange.location+1, rightRange.location-leftRange.location-1);
        NSString *subStr = [mStr substringWithRange:subRange];
        // 1.创建文本附件包含图片，知道附件 bounds
        NSTextAttachment *attachMent = [[NSTextAttachment alloc] init];
        attachMent.image = [UIImage imageNamed:subStr];
        attachMent.bounds = CGRectMake(0, -font.lineHeight*0.15, font.lineHeight*0.9, font.lineHeight*0.9);
        // 2.使用附件创建属性字符串
        NSAttributedString *repString = [NSAttributedString attributedStringWithAttachment:attachMent];
        // 3.将文件名替换为图片字符串
        [attrString replaceCharactersInRange:repRange withAttributedString:repString];
    }
    return attrString;
}


/**
 *  将带[图片文件名字]符串解析为富文本
 *
 *  @param font   字体大小
 *
 *  @return NSAttributedString对象
 */
- (NSAttributedString *)richTextWithFont:(UIFont *)font
{
    return [NSString richTextWithSting:self font:font];
}


@end
