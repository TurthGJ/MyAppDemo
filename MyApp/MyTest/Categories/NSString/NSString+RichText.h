//
//  NSString+RichText.h
//  YZCommunity
//
//  Created by 曾治铭 on 16/1/21.
//  Copyright © 2016年 压寨团队. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (RichText)


/**
 *  将带[图片文件名字]符串解析为富文本
 *
 *  @param string 带[图片文件名字]符串解析为富文本
 *  @param font   字体大小
 *
 *  @return NSAttributedString对象
 */
+ (NSAttributedString *)richTextWithSting:(NSString *)string font:(UIFont *)font;


/**
 *  将带[图片文件名字]符串解析为富文本
 *
 *  @param font   字体大小
 *
 *  @return NSAttributedString对象
 */
- (NSAttributedString *)richTextWithFont:(UIFont *)font;


@end
