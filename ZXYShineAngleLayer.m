//
//  ZXYShineAngleLayer.m
//  xingxing
//
//  Created by develop5 on 2017/12/27.
//  Copyright © 2017年 yiqihi. All rights reserved.
//

#import "ZXYShineAngleLayer.h"
@interface ZXYShineAngleLayer()<CAAnimationDelegate>
@property(nonatomic, strong)NSMutableArray*shineLayers;
@property(nonatomic, strong)NSMutableArray *smallShineLayers;
@property(nonatomic, strong)CADisplayLink *displaylink;
@end

@implementation ZXYShineAngleLayer
-(instancetype)initFrame:(CGRect )frame params:(ZXYShineParams *)params {
    self = [[ZXYShineAngleLayer alloc]init];
    self.frame = frame;
    self.params = params;
    [self addShines];
    return self;
}
-(instancetype)init{
    if ([super init]) {
        
    }
    return self;
}

-(NSMutableArray *)shineLayers{
    if (_shineLayers == nil) {
        _shineLayers = [NSMutableArray new];
    }
    return _shineLayers;
}
-(NSMutableArray *)smallShineLayers {
    if (_smallShineLayers == nil) {
        _smallShineLayers = [NSMutableArray new];
    }
    return _smallShineLayers;
}
-(void)setParams:(ZXYShineParams *)params {
    _params = params;
}
-(void)addShines {
    CGFloat startAngle = 0.f;
    CGFloat angle = M_PI*2/self.params.shineCount + startAngle;
    if (self.params.shineCount%2 != 0) {
        startAngle = M_PI * 2.0 - (angle / self.params.shineCount);
    }
    
    CGFloat radius = self.frame.size.width/2 * self.params.shineDistanceMultiple;
    for (int i = 0; i < self.params.shineCount; i++) {
        CAShapeLayer *bigShine = [CAShapeLayer new];
        CGFloat  bigWidth = self.frame.size.width*0.15;
        if (self.params.shineSize != 0) {
            bigWidth = self.params.shineSize;
        }
        CGPoint center = [self getShineCenter: startAngle + angle*i radius:radius];
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:bigWidth startAngle: 0 endAngle:M_PI * 2 clockwise:false];
        bigShine.path = path.CGPath;
      
        if (self.params.allowRandomColor) {
            int index = arc4random()%self.params.colorRandom.count;
            bigShine.fillColor = self.params.colorRandom[index].CGColor;
        }else{
              bigShine.fillColor = self.params.bigShineColor.CGColor;
        }
        [self addSublayer:bigShine];
        [self.shineLayers addObject:bigShine];
        
        CGFloat smallShineOffsetAngle = 20;
        CAShapeLayer *smallShine = [CAShapeLayer new];
        CGFloat smallWidth = bigWidth*0.66;
        CGPoint smallCenter = [self getShineCenter:startAngle + angle * i -smallShineOffsetAngle * M_PI/180 radius:radius-bigWidth];
        UIBezierPath *smallPath = [UIBezierPath bezierPathWithArcCenter:smallCenter radius:smallWidth startAngle:0 endAngle:M_PI * 2.0 clockwise:false];
        smallShine.path = smallPath.CGPath;
    
        if (self.params.allowRandomColor) {
            int index = arc4random()%self.params.colorRandom.count;
            smallShine.fillColor = self.params.colorRandom[index].CGColor;
        }else{
            smallShine.fillColor = self.params.smallShineColor.CGColor;
        }
        [self addSublayer:smallShine];
        [self.smallShineLayers addObject:smallShine];
    }
}
-(CGPoint )getShineCenter:(CGFloat) angle radius:(CGFloat)radius {
    CGFloat cenx = CGRectGetMidX(self.bounds);
    CGFloat ceny = CGRectGetMidY(self.bounds);
    int multiple = 0;
    if (angle >= 0 && angle <= 90 * M_PI/180) {
        multiple = 1;
    }else if (angle <= M_PI && angle > 90 * M_PI/180) {
        multiple = 2;
    }else if (angle > M_PI && angle <= 270 * M_PI/180) {
        multiple = 3;
    }else {
        multiple = 4;
    }
    
    CGFloat resultAngel = multiple*(90 * M_PI/180) - angle;
    CGFloat a = sin(resultAngel)*radius;
    CGFloat b = cos(resultAngel)*radius;
    if (multiple == 1) {
        return CGPointMake(cenx+b, ceny-a);
    }else if (multiple == 2) {
        return CGPointMake(cenx+a, ceny+b);
    }else if (multiple == 3) {
        return CGPointMake(cenx-b, ceny+a);
    }else {
        return CGPointMake(cenx-a, ceny-b);
    }
}

-(void)startAnim {
    CGFloat startAngle = 0.f;
    float radius = self.frame.size.width/2 * self.params.shineDistanceMultiple*1.4;
    CGFloat angle = M_PI * 2 / self.params.shineCount + startAngle;
    if (self.params.shineCount%2 != 0) {
        startAngle = M_PI * 2.0 - (angle / self.params.shineCount);
    }
    
    for (int i = 0; i < self.params.shineCount; i++) {
        CAShapeLayer *bigShine = self.shineLayers[i];
        CABasicAnimation *bigAnim = [self getAngleAnim:bigShine angle:startAngle + angle * i radius:radius];
        CAShapeLayer *smallShine = self.smallShineLayers[i];
        CGFloat radiusSub = self.frame.size.width*0.15*0.66;
        if (self.params.shineSize !=0) {
            radiusSub = self.params.shineSize*0.66;
        }
        CABasicAnimation *smallAnim = [self getAngleAnim:smallShine angle:startAngle + angle * i - self.params.smallShineOffsetAngle * M_PI /180  radius: radius-radiusSub];
        
        [bigShine addAnimation:bigAnim forKey:@"path"];
        [smallShine addAnimation:smallAnim forKey:@"path"];
        
        if (self.params.enableFlashing) {
            CABasicAnimation *bigFlash = [self getFlashAnim];
            CABasicAnimation *smallFlash = [self getFlashAnim];
            [bigShine addAnimation:bigFlash forKey:@"bigFlash"];
            [smallShine addAnimation:smallFlash forKey:@"smallFlash"];
        }
    }
    
    CABasicAnimation *angleAnim = [CABasicAnimation animationWithKeyPath: @"transform.rotation"];
    angleAnim.duration = self.params.animDuration  * 0.87;
    angleAnim.timingFunction =  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear];
    angleAnim.fromValue = @0;
    angleAnim.toValue = @(self.params.shineTurnAngle*M_PI/180);
    angleAnim.delegate = self;
    [self addAnimation:angleAnim forKey:@"rotate"];
    if (self.params.enableFlashing) {
        [self startFlash];
    }
}
-(void)startFlash {
    self.displaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(flashAction)];
    if (@available(iOS 10.0, *)) {
        self.displaylink.preferredFramesPerSecond = 10;
    }else{
        self.displaylink.frameInterval = 6;
    }
    [self.displaylink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}
-(void)flashAction {
    for (int i = 0; i <self.params.shineCount ; i++) {
        CAShapeLayer *bigShine = self.shineLayers[i];
        CAShapeLayer *smallShine = self.smallShineLayers[i];
        int index1 = arc4random()%self.params.colorRandom.count;
        bigShine.fillColor = self.params.colorRandom[index1].CGColor;
        int index2 = arc4random()%self.params.colorRandom.count;
        smallShine.fillColor = self.params.colorRandom[index2].CGColor;
    }
}
-(CABasicAnimation *)getFlashAnim {
    CABasicAnimation *flash= [CABasicAnimation animationWithKeyPath:@"path"];
    flash.fromValue = @1;
    flash.toValue = @0;
    double duration = (arc4random()%20+60)/1000;
    flash.duration = duration;
    flash.repeatCount = MAXFLOAT;
    flash.removedOnCompletion  = false;
    flash.autoreverses = true;
    flash.fillMode = kCAFillModeForwards;
    return flash;
}
-(CABasicAnimation *)getAngleAnim:(CAShapeLayer *)shine angle:(CGFloat)angle radius:(CGFloat)radius {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
    anim.duration = self.params.animDuration * 0.87;
    anim.fromValue = (__bridge id _Nullable)(shine.path);
    CGPoint center = [self getShineCenter:angle radius:radius];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:0.1 startAngle:0 endAngle:M_PI * 2.0  clockwise:false];
    anim.toValue = (__bridge id _Nullable)(path.CGPath);
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.removedOnCompletion = false;
    anim.fillMode = kCAFillModeForwards;
    return anim;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        [self.displaylink invalidate];
        self.displaylink = nil;
        [self removeAllAnimations];
        [self removeFromSuperlayer];
    }
}
@end
