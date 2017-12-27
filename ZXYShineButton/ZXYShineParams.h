//
//  ZXYShineParams.h
//  xingxing
//
//  Created by develop5 on 2017/12/27.
//  Copyright © 2017年 yiqihi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZXYShineParams : NSObject
/// shine是否随机颜色
@property(nonatomic, assign) BOOL allowRandomColor;

/// shine动画时间，秒
@property(nonatomic, assign) double animDuration;

/// 大Shine的颜色
@property(nonatomic, strong)UIColor *bigShineColor;

/// 是否需要Flash效果
@property(nonatomic, assign) BOOL enableFlashing;

/// shine的个数
@property(nonatomic, assign) int shineCount;

/// shine的扩散的旋转角度
@property(nonatomic, assign) float shineTurnAngle;

/// shine的扩散的范围的倍数
@property(nonatomic, assign) float shineDistanceMultiple;

/// 小shine与大shine之前的角度差异
@property(nonatomic, assign) float  smallShineOffsetAngle;

/// 小shine的颜色
@property(nonatomic, strong)UIColor *smallShineColor;
/// shine的大小
@property(nonatomic, assign) float shineSize;
/// 随机的颜色列表
@property(nonatomic, strong) NSArray<UIColor *> *colorRandom;

@end


/// 图片选择的枚举
///
/// - heart: 心形
/// - like: 点赞
/// - smile: 微笑
/// - star: 星星
/// - custom: 自定义图片
/// - defaultAndSelect: 自定义默认和选中的图片

typedef NS_ENUM(NSInteger, ShineImage)
{
    Heart = 0,
    Like,
    Smile,
    Star,
    Custom,
    DefaultAndSelect,
};

@interface ZXYShineImage:NSObject
+(UIImage *)getImage:(ShineImage)shineImage;
@end


