//
//  YXYColorfulDashLayer.h
//  ProgressDashLayerSample
//
//  Created by 杨萧玉 on 2018/4/8.
//  Copyright © 2018年 杨萧玉. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YXYMaskDashLayer;

@interface YXYColorfulDashLayer : CAGradientLayer

/**
 分段的间隙
 */
@property (nonatomic) CGFloat dashGap;
/**
 线宽
 */
@property (nonatomic) CGFloat dashWidth;
/**
 矩形的圆角半径
 */
@property (nonatomic) CGFloat dashCornerRadius;
/**
 分段总数
 */
@property (nonatomic) NSUInteger totalCount;
/**
 需要显示哪些分段的 index
 */
@property (nonatomic) NSArray<NSNumber *> *showIndexes;

@property (nonatomic, readonly) YXYMaskDashLayer *maskLayer;

/**
 刷新整个Layer
 */
- (void)refresh;

/**
 仅刷新 Dash 的 totalCount、dashGap 和 showIndexes
 */
- (void)refreshDash;

@end
