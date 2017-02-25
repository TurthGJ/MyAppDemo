//
//  CommonFunction.m
//  MyApp
//
//  Created by GJ on 16/8/9.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "CommonFunction.h"
#import "CommonDefine.h"
#import <AVFoundation/AVFoundation.h>
#import <AdSupport/ASIdentifierManager.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import "UIImage+Gray.h"

#define MY_FOUR_CC(c1,c2,c3,c4) ((UInt32)(((c4) << 24)|((c3) << 16)|((c2) << 8)|(c1)))
#define MY_TWO_CC(c1,c2) ((UInt16)(((c2) << 8)|(c1)))

@implementation CommonFunction

+ (NSString *)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([deviceString isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([deviceString isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([deviceString isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([deviceString isEqualToString:@"iPad2,1"])   return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])   return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,4"])   return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    if ([deviceString isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    if ([deviceString isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([deviceString isEqualToString:@"iPad3,1"])   return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,2"])   return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])   return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([deviceString isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,3"])   return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    if ([deviceString isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    if ([deviceString isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    
    if ([deviceString isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([deviceString isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    //NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}

+ (void)setupProfileStyle:(UINavigationController *)navigation
{
    //导航栏bar样式设置
    if (IS_IOS_7)
    {
        [navigation.navigationBar setTintColor:MY_COLOR_GRAY_BLACK];
        [navigation.navigationBar setTranslucent:NO];
        [navigation.navigationBar setBarTintColor:MY_COLOR_NAVIGATION];
        [navigation.navigationBar setTranslucent:NO];
        navigation.edgesForExtendedLayout = UIRectEdgeNone;
    }
    else
    {
        [navigation.navigationItem.leftBarButtonItem setTintColor:MY_COLOR_NAVIGATION];
        [navigation.navigationItem.rightBarButtonItem setTintColor:MY_COLOR_NAVIGATION];
        [navigation.navigationBar setTintColor:MY_COLOR_NAVIGATION];
    }
    
    [navigation.navigationBar setTitleTextAttributes:@{
                                                       UITextAttributeTextColor : MY_COLOR_GRAY_BLACK,
                                                       UITextAttributeFont : [UIFont boldSystemFontOfSize:18.]
                                                       }];
    //navigation.navigationBar.barStyle = UIBarStyleDefault;
}


+ (void)showMBProgressHUDWithTextTip:(NSString *)textTip onView:(UIView *)view afterDelay:(int)afterDelay
{
    
    if (!view) {
        return ;
    }
    if(afterDelay && afterDelay<=0)
        afterDelay=1;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.mode = MBProgressHUDModeText;
    //    hud.labelText = textTip;
    hud.detailsLabelText = textTip;
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.];
    
    hud.color=MY_COLOR_GRAY;
    
    //hud.margin = 10.f;
    //hud.yOffset = 0.f;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:afterDelay];
    
}

+ (CGSize)countStringLength:(NSString *)iString FontSize:(CGFloat)iFontSize
{
    CGSize actualsize;
    
    //CGFont ifont=
    if (IS_IOS_7) {
        //给一个比较大的高度，宽度不变
        CGSize size =CGSizeMake(1000,1000);
        //获取当前文本的属性
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:iFontSize],NSFontAttributeName,nil];
        //ios7方法，获取文本需要的size，限制宽度
        actualsize =[iString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
        
        //NSLog(@"iso7计算出来的CGSize=%@",NSStringFromCGSize(actualsize));
    }
    else {
        iString = [[iString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\r"]] componentsJoinedByString:@""];
        actualsize = [iString sizeWithFont:[UIFont systemFontOfSize:iFontSize]];
        //NSLog(@"iso6计算出来的CGSize=%@",NSStringFromCGSize(actualsize));
    }
    return actualsize;
}


+ (NSString*)contentTypeForImageData:(NSData*)data
{
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
            break;
        case 0x89:
            return @"png";
            break;
        case 0x47:
            return @"gif";
            break;
        case 0x49:
        case 0x4D:
            return @"tiff";
            break;
        case 0x52:
            if ([data length] < 1) {
                return nil;
            }
            NSString* string = [[NSString alloc]initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([string hasPrefix:@"RIFF"]&&[string hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}

/*
 + (NSInteger)fac:(NSInteger)k
 {
 NSInteger t=1;
 for(int i=1;i<=k;i++)
 t*=i;
 return t;
 }
 */

+ (long long)Cmn:(NSInteger)M N:(NSInteger)N
{
    if(M==0 || N==0 || M<N)
        return 0;
    if(M==N)
        return 1;
    
    long long p;
    NSInteger count=M-N;
    long long valueM=1;
    for (int i=M; i>count; i--)
    {
        valueM*=i;
    }
    
    long long valueN=1;
    for (int i=N; i>0; i--)
    {
        valueN*=i;
    }
    
    p=valueM/valueN;
    
    /*
     NSInteger ttt1=[self fac:M];
     NSInteger ttt2=[self fac:N];
     NSInteger ttt3=[self fac:M-N];
     NSInteger hhhh=ttt1/(ttt2*ttt3);
     
     p= [self fac:M]/([self fac:N]*[self fac:(M-N)]);//调用求阶乘函数fac(),注意此时是将结果强制转化为float类型
     */
    //DELOG(@"M=%d,N=%d,valueM=%d,valueN=%d,p=%d",M,N,valueM,valueN,p);
    return p;
}

+ (NSMutableArray *)zuHeSuanFa:(NSMutableArray *)array chooseCount:(int)m
{
    int n = [array count];
    
    if (m > n)
    {
        return nil;
    }
    
    NSLog(@"从1到%d中取%d个数的组合。。。",n,m);
    
    NSMutableArray *allChooseArray = [[NSMutableArray alloc] init];
    NSMutableArray *retArray = [array mutableCopy];
    
    for(int i=0;i < n;i++)
    {
        if (i < m)
        {
            [array replaceObjectAtIndex:i withObject:@"1"];
        }
        else
        {
            [array replaceObjectAtIndex:i withObject:@"0"];
        }
    }
    
    NSMutableArray *firstArray = [[NSMutableArray alloc] init];
    
    for(int i=0; i<n; i++)
    {
        if ([[array objectAtIndex:i] intValue] == 1)
        {
            [firstArray addObject:[retArray objectAtIndex:i]];
        }
    }
    
    [allChooseArray addObject:firstArray];
    int count = 0;
    for(int i = 0; i < n-1; i++)
    {
        if ([[array objectAtIndex:i] intValue] == 1 && [[array objectAtIndex:(i + 1)] intValue] == 0)
        {
            [array replaceObjectAtIndex:i withObject:@"0"];
            [array replaceObjectAtIndex:(i + 1) withObject:@"1"];
            
            for (int k = 0; k < i; k++)
            {
                if ([[array objectAtIndex:k] intValue] == 1)
                {
                    count ++;
                }
            }
            if (count > 0)
            {
                for (int k = 0; k < i; k++)
                {
                    if (k < count)
                    {
                        [array replaceObjectAtIndex:k withObject:@"1"];
                    }
                    else
                    {
                        [array replaceObjectAtIndex:k withObject:@"0"];
                    }
                }
            }
            
            NSMutableArray *middleArray = [[NSMutableArray alloc] init];
            
            for (int k = 0; k < n; k++)
            {
                if ([[array objectAtIndex:k] intValue] == 1)
                {
                    [middleArray addObject:[retArray objectAtIndex:k]];
                }
            }
            
            [allChooseArray addObject:middleArray];
            i = -1;
            count = 0;
        }
    }
    
    return allChooseArray;
}

+ (NSString *)urlParams
{
    //	//NSString *imei;
    //    //imei = [self IDFAStr];
    //
    //	//NSLog(@"========IMEI=%@",imei);
    //
    //    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:TOKEN_KEY];
    //    if(!deviceToken)
    //    {
    //        deviceToken = @"";
    //    }
    //
    ////	NSString *tokenStr;
    ////	if([UserInfoData instance].userInfo.token && [UserInfoData instance].userInfo.token.length>0)
    ////		tokenStr=[CommonFunction urlEncode:[UserInfoData instance].userInfo.token];
    ////	else
    ////		tokenStr=@"";
    //
    //	//获取1到1000000之间的整数
    //	NSInteger randNum = (arc4random() % 1000000) + 1;
    //    //&device_token=%@
    //
    //	NSString *_params = [NSString stringWithFormat:@"tid=%d&clientver=%@&random=%ld",TID,[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],(long)randNum];
    //	//NSLog(@"地址参数=%@",_params);
    //	return _params;
    return @" ";
}

#pragma mark - 播放声音
+ (void)playAudioNamed:(NSString *)audioFileName withShock:(BOOL)shock
{
    NSArray * fileNames = [audioFileName componentsSeparatedByString:@"."];
    NSString *pathe=[[NSBundle mainBundle] pathForResource:[fileNames objectAtIndex:0]
                                                    ofType:[fileNames objectAtIndex:1]];
    CFURLRef url =(__bridge CFURLRef)[NSURL fileURLWithPath:pathe];
    
    SystemSoundID soundID = 0;
    AudioServicesCreateSystemSoundID(url,&soundID);
    AudioServicesPlaySystemSound(soundID);
    
    if (shock) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
}

#pragma mark -
#pragma mark IDFA

//+ (NSString *)IDFAStr
//{
//    return [SecurityHelper getKeyChainValue];
//    /*
//    if(TID!=1000)
//    {
//        return [SecurityHelper getKeyChainValue];
//    }
//    else
//    {
//        CGFloat version = [[[UIDevice currentDevice] systemVersion] floatValue];
//        if (version < 6.0)
//            return [SecurityHelper getKeyChainValue];
//        return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//    }
//     */
//}

#pragma mark -
#pragma mark MAC地址
/**
 获取mac地址
 
 @return MAC地址
 */
+ (NSString *)macaddress
{
    CGFloat version = [[[UIDevice currentDevice] systemVersion] floatValue];
    //    if (version >= 6.0)
    //		return @"";
    int                    mib[6];
    size_t                len;
    char                *buf;
    unsigned char        *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl    *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        //printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        //printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        //printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        //printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    // NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    return [outstring uppercaseString];
    
}


+ (void)addRollingAnimationToView:(UIView *)targetView withRepeatCount:(CGFloat)repeatCount
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.delegate = self;
    rotationAnimation.toValue = [NSNumber numberWithFloat: 2 * M_PI ];
    rotationAnimation.duration = 1.0;
    rotationAnimation.repeatCount = repeatCount;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [rotationAnimation setValue:@"rotationAnimation" forKey:@"MyAnimationType"];
    rotationAnimation.removedOnCompletion = NO;
    [targetView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

+ (NSString *)urlEncode:(NSString *)oriStr
{
    NSString * encodedString = (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)oriStr,NULL,           (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    
    return encodedString;
}

+ (NSString *)urlDecode:(NSString *)encodeStr
{
    NSString *decodeString = [encodeStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return decodeString;
}

+ (UIImage *)getGrayImageWithImage:(UIImage *)sourceImage
{
    if(!sourceImage)
        return nil;
    
    return [sourceImage imageToGray];
    
    // 有效但无法透明
    /*
     int bitmapInfo = kCGImageAlphaNone;
     int width = sourceImage.size.width;
     int height = sourceImage.size.height;
     CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
     CGContextRef context = CGBitmapContextCreate (nil,
     width,
     height,
     8,      // bits per component
     0,
     colorSpace,
     bitmapInfo);
     CGColorSpaceRelease(colorSpace);
     if (context == NULL) {
     return nil;
     }
     CGContextDrawImage(context,
     CGRectMake(0, 0, width, height), sourceImage.CGImage);
     UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
     CGContextRelease(context);
     return grayImage;
     */
}

+ (UIImage *)getGrayImageWithName:(NSString *)imageName
{
    NSString *grayImageName=[NSString stringWithFormat:@"grayImage_%@",imageName];
    
    NSString *imagePath=[NSTemporaryDirectory() stringByAppendingPathComponent:grayImageName];
    
    int ifilesize=0;
    NSFileManager* manager = [NSFileManager defaultManager];
    BOOL isHasImage=NO;
    if([manager fileExistsAtPath:imagePath])
    {
        float temp=[[manager attributesOfItemAtPath:imagePath error:nil] fileSize];
        temp=temp/1024;
        ifilesize= ceilf(temp);
        if(ifilesize>2)
        {
            //图片存在
            //DELOG(@"找到本地灰色图片:%@",imagePath);
            UIImage *iImage=[UIImage imageWithContentsOfFile:imagePath];
            return iImage;
        }
    }
    
    UIImage *sourceImage=[UIImage imageNamed:imageName];
    if(!isHasImage && sourceImage)
    {
        UIImage *image = [self getGrayImageWithImage:sourceImage];
        
        //保存到本地
        NSRange rg=[imageName rangeOfString:@".png"];
        if(rg.location!=NSNotFound)
        {
            //NSLog(@"gggggggggggggg保存png图片到本地");
            NSData *imagedata= UIImagePNGRepresentation(image);
            [imagedata writeToFile:imagePath atomically:YES];
        }
        else
        {
            //NSLog(@"gggggggggggggg保存jpg图片到本地");
            NSRange rg2=[imageName rangeOfString:@".jpg"];
            if(rg2.location!=NSNotFound)
            {
                NSData *imagedata=UIImageJPEGRepresentation(image, 1.0);
                [imagedata writeToFile:imagePath atomically:YES];
            }
        }
        return image;
    }
    
    return nil;
}


+ (NSDictionary *)paramsDictionaryFromUrl:(NSString*)url usingEncoding:(NSStringEncoding)encoding
{
    NSRange range = [url rangeOfString:@"?"];
    if(range.location==NSNotFound)
        return nil;
    NSString *newUrlStr = [url substringFromIndex:range.location+1];
    
    NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    NSScanner* scanner = [[NSScanner alloc] initWithString:newUrlStr];
    while (![scanner isAtEnd]) {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 2) {
            NSString* key = [[kvPair objectAtIndex:0]
                             stringByReplacingPercentEscapesUsingEncoding:encoding];
            NSString* value = [[kvPair objectAtIndex:1]
                               stringByReplacingPercentEscapesUsingEncoding:encoding];
            [pairs setObject:value forKey:key];
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:pairs];
}

+ (UIImage *)cutCircleImage:(UIImage*)img{
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0.0);    // 获取上下文
    CGContextRef ctr = UIGraphicsGetCurrentContext();    // 设置圆形
    CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
    CGContextAddEllipseInRect(ctr, rect);    // 裁剪
    CGContextClip(ctr);    // 将图片画上去
    [img drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


+ (UIImage*)getCornerradiusImage:(UIImage*)img radius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
    UIGraphicsBeginImageContextWithOptions(img.size, false, 0.0);
    CGContextRef ctr = UIGraphicsGetCurrentContext();    // 设置圆形
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctr, path.CGPath);
    CGContextClip(ctr);
    [img drawInRect:rect];
    CGContextDrawPath(ctr, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIView*)getConrnerRadiusUIView:(CGFloat)radius orgion:(CGPoint)orgion size:(CGSize)size
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(orgion.x, orgion.y, size.width, size.height)];
    view.backgroundColor = [UIColor clearColor];
    UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0);
    CGContextRef ctr = UIGraphicsGetCurrentContext();    // 设置圆形
    CGContextMoveToPoint(ctr,0,0);
    CGContextAddArcToPoint(ctr, size.width, 0, size.width, size.height, radius);
    
    CGContextAddArcToPoint(ctr, size.width, size.height, 0, size.height, radius);
    
    CGContextAddArcToPoint(ctr, 0, size.height, 0, 0, radius);
    
    CGContextAddArcToPoint(ctr, 0, 0, size.width, 0, radius);
    CGContextDrawPath(ctr, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView* img = [[UIImageView alloc]initWithImage:image];
    [view insertSubview:img atIndex:0];
    return view;
}

//number:需要处理的数字， position：保留小数点第几位，
+(CGFloat)roundUp:(float)number afterPoint:(int)position
{
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:number];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return [roundedOunces floatValue];
    //return [NSString stringWithFormat:@"%@",roundedOunces];
}


+ (NSMutableAttributedString *)attributeStringWithArray:(NSArray *)textArr
{
    if(!textArr || textArr.count<=0)
        return nil;
    
    NSMutableString *resultStr=[NSMutableString stringWithString:@""];
    for (NSDictionary *dic in textArr) {
        if(dic && dic.count>0)
        {
            NSString *tempStr=[dic objectForKey:@"txt"];
            [resultStr appendString:tempStr];
        }
    }
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:resultStr];
    NSInteger strIndex=0;//字符串的起始下标
    NSInteger strLength=0;//字符长度
    for (NSDictionary *dic in textArr) {
        if(dic && dic.count>0)
        {
            NSString *tempStr=[dic objectForKey:@"txt"];
            UIColor *color=(UIColor *)[dic objectForKey:@"color"];
            UIFont *iFont=(UIFont *)[dic objectForKey:@"font"];
            strLength=tempStr.length;
            [str addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(strIndex,strLength)];
            if(iFont)
                [str addAttribute:NSFontAttributeName value:iFont range:NSMakeRange(strIndex,strLength)];
            strIndex+=strLength;
        }
    }
    return str;
}

+ (double)getTimeIntervalWithDateString:(NSString *)dateStr
{
    NSString *KDateFormat=@"yyyy-MM-dd";
    if(dateStr.length==10)
    {
        KDateFormat=@"yyyy-MM-dd";
    }
    else if (dateStr.length==16)
    {
        KDateFormat=@"yyyy-MM-dd HH:mm";
    }
    else if (dateStr.length==19)
    {
        KDateFormat=@"yyyy-MM-dd HH:mm:ss";
    }
    else
    {
        return 0;
    }
    
    NSDateFormatter* dateFormat=[[NSDateFormatter alloc] init];
    dateFormat.dateFormat=KDateFormat;
    
    NSDate* date=[dateFormat dateFromString:dateStr];
    NSTimeInterval interval=[date timeIntervalSince1970];//timeIntervalSince1970返回的是单位是秒
    return interval;
}

+ (NSString *)getDateStringWithTimeInterval:(double)timeInterval format:(NSString *)format
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式 输出格式为：2010-10-27
    [dateFormatter setDateFormat:format?format:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    
    dateStr = [dateStr stringByReplacingOccurrencesOfString:@" 00:00:00" withString:@""];
    return dateStr;
}


+ (NSString *)getValueFromDictionary:(NSDictionary *)dic
                              keyStr:(NSString *)keyStr
{
    if(dic && dic.count>0)
    {
        NSString *valstr=(NSString *)[dic objectForKey:keyStr];
        if ([valstr isKindOfClass:[NSNumber class]])
        {
            NSInteger valstrTemp=[valstr integerValue];
            return [NSString stringWithFormat:@"%ld",(long)valstrTemp];
        }
        
        if(valstr && (NSNull *)valstr!=[NSNull null] && valstr.length>0)
        {
            return valstr;
        }
    }
    return @"";
}

+ (NSString *)toJsonString:(id)theData{
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if ([jsonData length] > 0 && error == nil){
        
        NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                     encoding:NSUTF8StringEncoding];
        return jsonString;
    }else{
        return nil;
    }
}

+ (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}


+(NSString *) jsonStringWithString:(NSString *) string{
    return [NSString stringWithFormat:@"\"%@\"",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}

+ (NSString *)jsonStringWithArray:(NSArray *)array{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [self jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}
+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary{
    NSArray *keys = [dictionary allKeys];
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"{"];
    NSMutableArray *keyValues = [NSMutableArray array];
    for (int i=0; i<[keys count]; i++) {
        NSString *name = [keys objectAtIndex:i];
        id valueObj = [dictionary objectForKey:name];
        NSString *value = [self jsonStringWithObject:valueObj];
        if (value) {
            [keyValues addObject:[NSString stringWithFormat:@"\"%@\":%@",name,value]];
        }
    }
    [reString appendFormat:@"%@",[keyValues componentsJoinedByString:@","]];
    [reString appendString:@"}"];
    return reString;
}

+(NSString *) jsonStringWithObject:(id) object{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        value = [self jsonStringWithString:object];
    }else if([object isKindOfClass:[NSDictionary class]]||[object isKindOfClass:[NSMutableDictionary class]]){
        value = [self jsonStringWithDictionary:object];
    }else if([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSMutableArray class]]){
        value = [self jsonStringWithArray:object];
    }
    return value;
}




#pragma mark UITableView相关

+ (void)setExtraCellLineHidden:(UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}



//测试后台定位
+ (NSDictionary *)getCacheDataForMainView
{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(
                                                            NSLibraryDirectory,
                                                            NSUserDomainMask, YES) objectAtIndex: 0];
    NSString * filePath = [NSString stringWithFormat:@"%@/%@",docDir, @"locationFileKey"];
    
    NSDictionary *cacheData = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    return cacheData;
}
//保存首页数据缓存，异步写文件
+ (void)saveCacheDataForMainView:(NSDictionary *)cacheData
{
    if (cacheData && cacheData.count>0) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSString *docDir = [NSSearchPathForDirectoriesInDomains(
                                                                    NSLibraryDirectory,
                                                                    NSUserDomainMask, YES) objectAtIndex: 0];
            NSString * filePath = [NSString stringWithFormat:@"%@/%@",docDir, @"locationFileKey"];
            DLOG(@"首页数据缓存路径：%@",filePath);
            [cacheData writeToFile:filePath atomically:YES];
        });
    }
}


+ (ImageType)imageDetectType:(CFDataRef)data
{
    if (!data) {
        return ImageType_Unkown;
    }
    UInt64 length = CFDataGetLength(data);
    if (length < 16) {
        return ImageType_Unkown;
    }
    const char* bytes = (char*)CFDataGetBytePtr(data);
    UInt32 magic4 = *((UInt32*)bytes);
    switch (magic4) {
        case MY_FOUR_CC(0x4D, 0x4D, 0x00, 0x2A):
        {
            return ImageType_TIFF;
        }break;
        case MY_FOUR_CC(0x49, 0x49, 0x2A, 0x00):
        {
            return ImageType_TIFF;
        }break;
        case MY_FOUR_CC(0x00, 0x00, 0x01, 0x00):
        {
            return ImageType_ICO;
        }break;
        case MY_FOUR_CC(0x00, 0x00, 0x02, 0x00):
        {
            return ImageType_CUR;
        }break;
        case MY_FOUR_CC('i', 'c', 'n', 's'):
        {
            return ImageType_ICNS;
        }break;
        case MY_FOUR_CC('G', 'I', 'F', '8'):
        {
            return ImageType_GIF;
        }
        case MY_FOUR_CC(0x89, 'P', 'N', 'G'):
        {
            return ImageType_PNG;
        }break;
        case MY_FOUR_CC('R', 'I', 'F', 'F'):
        {
            UInt32 tmp = *((UInt32*)(bytes+8));
            if (tmp == MY_FOUR_CC('W', 'E', 'B', 'P')) {
                return ImageType_WEBP;
            }
        }break;
    }
    UInt16 magic2 = *((UInt16*)bytes);
    switch (magic2) {
        case MY_TWO_CC('B', 'A'):
        case MY_TWO_CC('B', 'M'):
        case MY_TWO_CC('I', 'C'):
        case MY_TWO_CC('P', 'I'):
        case MY_TWO_CC('C', 'I'):
        case MY_TWO_CC('C', 'P'):
        {
            return ImageType_BMP;
        }break;
        case MY_TWO_CC(0xFF, 0x4F):
        {
            return ImageType_JPEG2000;
        }break;
    }
    if (memcmp(bytes, "\377\330\377", 3) == 0) {
        return ImageType_JPG;
    }
    if (memcmp(bytes+4, "\152\120\040\040\015", 5) == 0) {
        return ImageType_JPEG2000;
    }
    return ImageType_Unkown;
}

@end
