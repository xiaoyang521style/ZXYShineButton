//
//  ZXYShineButton.h
//  xingxing
//
//  Created by develop5 on 2017/12/27.
//  Copyright © 2017年 yiqihi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXYShineParams.h"
@interface ZXYShineButton : UIControl
@property(nonatomic, strong)ZXYShineParams *params;
@property(nonatomic, strong)UIColor *color;
@property(nonatomic, strong)UIColor *fillColor;
@property(nonatomic, strong)UIImage *image;
@property(nonatomic, assign)BOOL isSelected;
@property(nonatomic,strong)UIImage *selImg;
@property(nonatomic,strong)UIImage *norImg;
-(instancetype)initWithFrame:(CGRect)frame  parmas:(ZXYShineParams *)param;
-(void)setClicked:(BOOL)clicked animated:(BOOL)animated;
@end
