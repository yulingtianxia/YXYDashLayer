//
//  YXYProgressDashLayer.m
//  ProgressDashLayerSample
//
//  Created by 杨萧玉 on 2018/4/11.
//  Copyright © 2018年 杨萧玉. All rights reserved.
//

#import "YXYProgressDashLayer.h"
#import "YXYColorfulDashLayer.h"

@interface YXYProgressDashLayer ()

@property (nonatomic, readwrite) YXYColorfulDashLayer *underLayer;
@property (nonatomic) YXYColorfulDashLayer *progressLayer;

@end

@implementation YXYProgressDashLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.underLayer = [YXYColorfulDashLayer layer];
        self.progressLayer = [YXYColorfulDashLayer layer];
        
        self.dashCornerRadius = 5;
        
        self.dashGap = 5;
        
        self.dashWidth = 3;
        
        self.totalCount = 10;
        
        self.progress = 1;
        
        [self addSublayer:self.underLayer];
        [self addSublayer:self.progressLayer];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.underLayer.frame = self.bounds;
    self.progressLayer.frame = self.bounds;
}

- (void)setProgressColor:(UIColor *)progressColor
{
    _progressColor = progressColor;
    self.progressLayer.colors = @[(id)self.progressColor.CGColor, (id)self.progressColor.CGColor];
}

- (void)setDashCornerRadius:(CGFloat)dashCornerRadius
{
    _dashCornerRadius = dashCornerRadius;
    self.underLayer.dashCornerRadius = dashCornerRadius;
    self.progressLayer.dashCornerRadius = dashCornerRadius;
}

- (void)setDashGap:(CGFloat)dashGap
{
    _dashGap = dashGap;
    self.underLayer.dashGap = self.dashGap;
    self.progressLayer.dashGap = self.dashGap;
}

- (void)setDashWidth:(CGFloat)dashWidth
{
    _dashWidth = dashWidth;
    self.underLayer.dashWidth = dashWidth;
    self.progressLayer.dashWidth = dashWidth;
}

- (void)setTotalCount:(NSUInteger)totalCount
{
    _totalCount = totalCount;
    self.underLayer.totalCount = totalCount;
    self.progressLayer.totalCount = totalCount;
    self.underLayer.showIndexes = [self indexesOfRange:NSMakeRange(0, totalCount)];
}

- (void)setProgress:(NSUInteger)progress
{
    _progress = progress;
    self.progressLayer.showIndexes = [self indexesOfRange:NSMakeRange(0, progress)];
    NSUInteger underLayerLength = 0;
    if (progress <= self.totalCount) {
        underLayerLength = self.totalCount - progress;
    }
    self.underLayer.showIndexes = [self indexesOfRange:NSMakeRange(progress, underLayerLength)];
}

- (NSArray<NSNumber *> *)indexesOfRange:(NSRange)range
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:range.length];
    for (NSUInteger i = range.location; i < range.location + range.length; i ++) {
        [array addObject:@(i)];
    }
    return array;
}

- (void)refresh
{
    [self.underLayer refresh];
    [self.progressLayer refresh];
}

- (void)refreshProgress
{
    [self.underLayer refreshDash];
    [self.progressLayer refreshDash];
}

@end
