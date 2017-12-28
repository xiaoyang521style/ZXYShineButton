//
//  ZXYShineLayer.h
//  xingxing
//
//  Created by develop5 on 2017/12/27.
//  Copyright © 2017年 yiqihi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "ZXYShineParams.h"

typedef void (^endAnim)(void);
@interface ZXYShineLayer : CALayer
@property(nonatomic,strong)ZXYShineParams *params;
@property(nonatomic, strong)UIColor *fillColor;
@property (nonatomic, copy) endAnim endAnim;
-(void)startAnim;
@end
