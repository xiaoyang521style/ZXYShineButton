//
//  ZXYShineAngleLayer.h
//  xingxing
//
//  Created by develop5 on 2017/12/27.
//  Copyright © 2017年 yiqihi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "ZXYShineParams.h"
@interface ZXYShineAngleLayer : CALayer
@property(nonatomic,strong)ZXYShineParams *params;
-(instancetype)initFrame:(CGRect )frame params:(ZXYShineParams *)params;
-(void)startAnim;
@end
