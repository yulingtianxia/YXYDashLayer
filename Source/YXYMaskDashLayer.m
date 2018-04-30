//
//  YXYMaskDashLayer.m
//  ProgressDashLayerSample
//
//  Created by 杨萧玉 on 2018/4/20.
//  Copyright © 2018年 杨萧玉. All rights reserved.
//

#import "YXYMaskDashLayer.h"

@interface YXYMaskDashLayer ()

@property (nonatomic) CGFloat totalLength;
@property (nonatomic) CGRect dashRect;
@property (nonatomic) CGFloat realDashCornerRadius;

@end

@implementation YXYMaskDashLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dashGap = 5;
        _dashCornerRadius = 5;
        _dashWidth = 3;
        self.lineCap = kCALineCapRound;
        self.fillColor = [UIColor clearColor].CGColor;
        self.strokeColor = [UIColor whiteColor].CGColor;
    }
    return self;
}

- (void)setTotalCount:(NSUInteger)totalCount
{
    _totalCount = MAX(1, totalCount);
}

#pragma mark draw UI

- (void)refresh
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.dashRect = CGRectInset(self.bounds, self.dashWidth / 2, self.dashWidth / 2);
    CGFloat width = self.dashRect.size.width;
    CGFloat height = self.dashRect.size.height;
    self.realDashCornerRadius = MIN(self.dashCornerRadius - self.dashWidth / 2, width / 2);
    self.realDashCornerRadius = MAX(0, self.realDashCornerRadius);
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    [path moveToPoint:CGPointMake(center.x - width / 2 + self.realDashCornerRadius, center.y - height / 2)];
    
    [path addLineToPoint:CGPointMake(center.x + width / 2 - self.realDashCornerRadius, center.y - height / 2)];
    
    [path addArcWithCenter:CGPointMake(center.x + width / 2 - self.realDashCornerRadius, center.y - height / 2 + self.realDashCornerRadius) radius:self.realDashCornerRadius startAngle:M_PI_2 * 3 endAngle:0 clockwise:YES];
    
    [path addLineToPoint:CGPointMake(center.x + width / 2, center.y + height / 2 - self.realDashCornerRadius)];
    
    [path addArcWithCenter:CGPointMake(center.x + width / 2 - self.realDashCornerRadius, center.y + height / 2 - self.realDashCornerRadius) radius:self.realDashCornerRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    
    [path addLineToPoint:CGPointMake(center.x - width / 2 + self.realDashCornerRadius, center.y + height / 2)];
    
    [path addArcWithCenter:CGPointMake(center.x - width / 2 + self.realDashCornerRadius, center.y + height / 2 - self.realDashCornerRadius) radius:self.realDashCornerRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    
    [path addLineToPoint:CGPointMake(center.x - width / 2, center.y - height / 2 + self.realDashCornerRadius)];
    
    [path addArcWithCenter:CGPointMake(center.x - width / 2 + self.realDashCornerRadius, center.y - height / 2 + self.realDashCornerRadius) radius:self.realDashCornerRadius startAngle:M_PI endAngle:M_PI_2 * 3 clockwise:YES];
    
    self.totalLength = (width + height) * 2 - self.realDashCornerRadius * 8 + M_PI * self.realDashCornerRadius * 2;
    
    self.lineWidth = self.dashWidth;
    
    self.path = path.CGPath;
    
    [self refreshDash];
}

- (void)refreshDash
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    CGFloat realDashGap = (self.totalCount == 1) ? 0 : self.dashGap + self.dashWidth;
    NSUInteger realTotalCount = self.totalCount;
    CGFloat pieceLength = self.totalLength / self.totalCount - realDashGap;
    if (pieceLength < 0) {
        pieceLength = 0;
        realTotalCount = self.totalLength / realDashGap;
        pieceLength = self.totalLength / realTotalCount - realDashGap;
        NSLog(@"Can't show! Reduce total count or dash gap! Real Total Count: %lu, Real Dash Gap:%ff", (unsigned long)realTotalCount, realDashGap);
    }
    self.lineDashPhase = - (self.dashRect.size.width / 2 - self.realDashCornerRadius + realDashGap / 2);
    
    NSMutableArray<NSNumber *> *dashPattern = [NSMutableArray arrayWithCapacity:2 * realTotalCount];
    NSInteger needsMovePhaseCount = 0;
    for (int i = 0; i < realTotalCount; i ++) {
        if ([self.showIndexes containsObject:@(i)]) {
            [dashPattern addObject:@(pieceLength)];
            [dashPattern addObject:@(realDashGap)];
        }
        else {
            if (dashPattern.count > 0) {
                dashPattern[dashPattern.count - 1] = @(dashPattern[dashPattern.count - 1].doubleValue + pieceLength + realDashGap);
            }
            else {
                self.lineDashPhase -= (pieceLength + realDashGap);
                needsMovePhaseCount ++;
            }
        }
    }
    if (needsMovePhaseCount > 0 && dashPattern.count > 0) {
        dashPattern[dashPattern.count - 1] = @(dashPattern[dashPattern.count - 1].doubleValue + (pieceLength + realDashGap) * needsMovePhaseCount);
    }
    
    if (self.showIndexes.count > 0) {
        self.lineDashPattern = dashPattern;
    }
    
    [CATransaction commit];
}

@end
