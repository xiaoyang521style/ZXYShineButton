//
//  ZXYShineClickLayer.m
//  xingxing
//
//  Created by develop5 on 2017/12/27.
//  Copyright © 2017年 yiqihi. All rights reserved.
//

#import "ZXYShineClickLayer.h"
#import "ZXYShineParams.h"
@interface ZXYShineClickLayer()
@property(nonatomic, strong)CALayer *maskLayer;
@end

@implementation ZXYShineClickLayer
-(instancetype)init {
    if ([super init]) {
        self.animDuration = 0.5;
        self.color = [UIColor lightGrayColor];
        self.fillColor = [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0];
        self.image = [ZXYShineImage getImage:Heart];
        self.clicked = false;
    }
    return self;
}

-(CALayer *)maskLayer {
    if (_maskLayer == nil) {
        _maskLayer = [[CALayer alloc]init];
    }
    return _maskLayer;
}
-(void)setColor:(UIColor *)color {
    _color = color;
}
-(void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
}
-(void)setImage:(UIImage *)image {
    _image = image;
    self.maskLayer.contents = (__bridge id)_image.CGImage;
}
-(void)setClicked:(BOOL)clicked {
    _clicked = clicked;
    if (_clicked) {
        if (self.selImg) {
            self.maskLayer.contents = (__bridge id _Nullable)(self.selImg.CGImage);
        }
            self.backgroundColor =self.fillColor.CGColor;
    }else{
        if (self.norImg) {
            self.maskLayer.contents = (__bridge id _Nullable)(self.norImg.CGImage);
        }
        self.backgroundColor = self.color.CGColor;
    }
}
-(void)startAnim {
    CAKeyframeAnimation  *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    anim.duration  = 0.2;
    anim.values = @[@0.4, @1, @0.9, @1];
    anim.calculationMode = kCAAnimationCubic;
    [self.maskLayer addAnimation:anim forKey:@"scale"];
}

-(void)layoutSublayers {
    [super layoutSublayers];
    self.maskLayer.frame = self.bounds;
    if (self.norImg) {
        self.maskLayer.contents = (__bridge id _Nullable)(self.norImg.CGImage);
    }else{
        self.maskLayer.contents = (__bridge id _Nullable)(self.image.CGImage);
        if (_clicked) {
            self.backgroundColor =self.fillColor.CGColor;
        }else{
            self.backgroundColor = self.color.CGColor;
        }
    }
    self.mask = self.maskLayer;
}
@end
