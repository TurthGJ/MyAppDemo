//
//  CommonFunction.h
//  MyApp
//
//  Created by GJ on 16/8/9.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKIT/UIkit.h>
#import "sys/utsname.h"
#import <MBProgressHUD.h>

typedef NS_ENUM(NSInteger, ErrorType) {
    // 错误的类型
    Error_None                 = 0,     //默认
    Error_NoNetWork            = 100,   //没有网络
    Error_LoginFaile           = 101,   //登录失败
    Error_RegisterFaile        = 102    //注册失败
    //TODO 增加
};

@interface CommonFunction : NSObject

/**
 获取设备的名称
 
 @return 设备的名称
 */
+ (NSString *)deviceString;

/**
 对原先storyboard上已经存在并且需要设置的控件进行统一样式设置
 
 @param navigation UINavigationController
 */
+ (void)setupProfileStyle:(UINavigationController *)navigation;

/**
 统一显示弹窗提示信息
 
 @param textTip 文字
 @param view    提示信息是要add的view
 */
+ (void)showMBProgressHUDWithTextTip:(NSString *)textTip
                              onView:(UIView *)view
                          afterDelay:(int)afterDelay;

/**
 *  IDFA
 *
 *  @return IDFA
 */
+ (NSString *)IDFAStr;

/**
 计算字符串的长度
 
 @param iString   字符串
 @param iFontSize 字体样式的大小
 @return CGSize
 */
+ (CGSize)countStringLength:(NSString *)iString
                   FontSize:(CGFloat)iFontSize;


/**
 *  根据图片data判断图片类型
 *
 *  @param data
 *
 *  @return
 */
+ (NSString*)contentTypeForImageData:(NSData*)data;

/**
 定义计算k阶乘的函数fac()
 
 @param k 阶乘数
 @return 阶乘结果
 
 + (NSInteger)fac:(NSInteger)k;
 */

/**
 计算组合数函数Cmn()
 
 @param M 所有个数
 @param N 选取的个数
 @return 组合数
 */
+ (long long)Cmn:(NSInteger)M N:(NSInteger)N;

/**
 返回组合的数组
 
 @param array 需要进行组合的源数据
 @param m     要取的组合数
 @return 组合的数组
 */
+ (NSMutableArray *)zuHeSuanFa:(NSMutableArray *)array chooseCount:(int)m;

/**
 返回链接地址的参数
 
 @return 返回链接地址的参数
 */
+ (NSString *)urlParams;

/**
 播放声音
 
 @param audioFileName 声音文件名
 @param shock
 */
+ (void)playAudioNamed:(NSString *)audioFileName withShock:(BOOL)shock;


#pragma mark -
#pragma mark 生成灰色图片
/**
 把图片生成灰色图片
 
 @param sourceImage 原图片
 @return 灰色图片
 */
+ (UIImage *)getGrayImageWithImage:(UIImage *)sourceImage;

/**
 把图片生成灰色图片
 
 @param imageName 图片的名称，带后缀的
 @return 灰色图片
 */
+ (UIImage *)getGrayImageWithName:(NSString *)imageName;


/**
 *  高效图片圆型处理
 *
 *  @param img
 *
 *  @return
 */
+ (UIImage *)cutCircleImage:(UIImage*)img;


/**
 *  高效图片圆角处理
 *
 *  @param img
 *  @param radius 角度
 *
 *  @return
 */
+ (UIImage*)getCornerradiusImage:(UIImage*)img radius:(CGFloat)radius;


/**
 *  高效UIView处理
 *
 *  @param view
 *  @param radius
 *  @param orgion
 *  @param size
 *
 *  @return
 */
+ (UIView*)getConrnerRadiusUIView:(CGFloat)radius orgion:(CGPoint)orgion size:(CGSize)size;

#pragma mark -
#pragma mark 动画
/*!
 *  @method +(void)addRollingAnimationToView:(UIView *)targetView withRepeatCount:(NSInteger)repeatCount;
 *
 *  @abstract 给targetView添加旋转动画
 *
 *  @param targetView  指定View
 *  @param repeatCount 旋转次数，无限次数请传入HUGE_VALF
 */
+ (void)addRollingAnimationToView:(UIView *)targetView withRepeatCount:(CGFloat)repeatCount;

#pragma mark -
#pragma mark 文字处理
/*!
 *  @method +(NSString *)urlEncode:(NSString *)oriStr;
 *
 *  @abstract URL编码
 *
 *  @param oriStr 需要做处理的文字
 *
 *  @return URL编码后的字符串
 */
+ (NSString *)urlEncode:(NSString *)oriStr;

/*!
 *  @method +(NSString *)urlDecode:(NSString *)encodeStr;
 *
 *  @abstract URL解码
 *
 *  @param encodeStr 编码的字符串
 *
 *  @return URL解码的字符串
 */
+ (NSString *)urlDecode:(NSString *)encodeStr;


/**
 返回Url地址里面的所有参数
 
 @param url      url地址
 @param encoding 编码
 @return 参数字典
 */
+ (NSDictionary *)paramsDictionaryFromUrl:(NSString*)url
                            usingEncoding:(NSStringEncoding)encoding;


//number:需要处理的数字， position：保留小数点第几位，
+(CGFloat)roundUp:(float)number afterPoint:(int)position;


/**
 在UILabel显示不同的字体和颜色
 
 @param textArr 这是个文本组合的数组，里面存放一个NSDictionary，
 NSDictionary里面存放3个key，
 txt存放的是要显示的文本，类型是NSString
 color存放的是文本的颜色，类型是UIColor
 font存放的是文本的字体大小和样式，类型是UIFont，font可以为nil
 @return 组装好的字符串
 */
+ (NSMutableAttributedString *)attributeStringWithArray:(NSArray *)textArr;


/**
 去掉UITableView没有数据时会出现分隔线
 
 */
+ (void)setExtraCellLineHidden:(UITableView *)tableView;

/**
 *  返回时间戳
 *  只支持yyyy-MM-dd HH:mm:ss和yyyy-MM-dd这2种格式
 *
 *  @param dateStr 日期
 */
+ (double)getTimeIntervalWithDateString:(NSString *)dateStr;

/**
 *  根据时间戳返回时间字符串
 *
 *  @param timeInterval 日期的时间戳
 *  @param format 日期格式
 */
+ (NSString *)getDateStringWithTimeInterval:(double)timeInterval
                                     format:(NSString *)format;

/**
 *  从字典中获取值，主要防止NSNull的情况
 *
 *  @param dic    字典
 *  @param keyStr key的值
 *
 *  @return 值，默认为空字符串
 */
+ (NSString *)getValueFromDictionary:(NSDictionary *)dic
                              keyStr:(NSString *)keyStr;

/**
 *  把字典和数组等转换成json
 *
 *  @param theData
 *
 *  @return
 */
+ (NSString *)toJsonString:(id)theData;


/**
 *  获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
 *
 *  @param aString 字符
 *
 *  @return 首字母
 */
+ (NSString *)firstCharactor:(NSString *)aString;


//测试后台定位
+ (NSDictionary *)getCacheDataForMainView;
//保存首页数据缓存，异步写文件
+ (void)saveCacheDataForMainView:(NSDictionary *)cacheData;

@end
