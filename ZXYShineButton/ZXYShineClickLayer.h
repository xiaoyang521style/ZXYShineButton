//
//  ZXYShineClickLayer.h
//  xingxing
//
//  Created by develop5 on 2017/12/27.
//  Copyright © 2017年 yiqihi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface ZXYShineClickLayer : CALayer
@property(nonatomic, assign)double animDuration;
@property(nonatomic, strong)UIColor *fillColor;
@property(nonatomic, assign)BOOL clicked;
@property(nonatomic, strong)UIColor *color;
@property(nonatomic, strong)UIImage *image;
@property(nonatomic,strong)UIImage *selImg;
@property(nonatomic,strong)UIImage *norImg;

-(void)startAnim;
@end
