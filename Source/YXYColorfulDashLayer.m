//
//  YXYColorfulDashLayer.m
//  ProgressDashLayerSample
//
//  Created by 杨萧玉 on 2018/4/8.
//  Copyright © 2018年 杨萧玉. All rights reserved.
//

#import "YXYColorfulDashLayer.h"
#import "YXYMaskDashLayer.h"

@interface YXYColorfulDashLayer ()

@property (nonatomic, readwrite) YXYMaskDashLayer *maskLayer;

@end

@implementation YXYColorfulDashLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        _maskLayer = [YXYMaskDashLayer layer];
        self.mask = _maskLayer;
    }
    return self;
}

#pragma mark - getter&setter

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.maskLayer.frame = self.bounds;
}

- (CGFloat)dashGap
{
    return self.maskLayer.dashGap;
}

- (void)setDashGap:(CGFloat)dashGap
{
    self.maskLayer.dashGap = dashGap;
}

- (CGFloat)dashWidth
{
    return self.maskLayer.dashWidth;
}

- (void)setDashWidth:(CGFloat)dashWidth
{
    self.maskLayer.dashWidth = dashWidth;
}

- (CGFloat)dashCornerRadius
{
    return self.maskLayer.dashCornerRadius;
}

- (void)setDashCornerRadius:(CGFloat)dashCornerRadius
{
    self.maskLayer.dashCornerRadius = dashCornerRadius;
}

- (NSUInteger)totalCount
{
    return self.maskLayer.totalCount;
}

- (void)setTotalCount:(NSUInteger)totalCount
{
    self.maskLayer.totalCount = totalCount;
}

- (NSArray<NSNumber *> *)showIndexes
{
    return self.maskLayer.showIndexes;
}

- (void)setShowIndexes:(NSArray<NSNumber *> *)showIndexes
{
    self.maskLayer.showIndexes = showIndexes;
    self.hidden = showIndexes.count == 0;
}

#pragma mark draw UI

- (void)refresh
{
    [self.maskLayer refresh];
}

- (void)refreshDash
{
    [self.maskLayer refreshDash];
}

@end
