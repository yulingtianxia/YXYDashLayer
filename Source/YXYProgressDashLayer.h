//
//  YXYProgressDashLayer.h
//  ProgressDashLayerSample
//
//  Created by 杨萧玉 on 2018/4/11.
//  Copyright © 2018年 杨萧玉. All rights reserved.
//

#import "YXYColorfulDashLayer.h"

@class YXYColorfulDashLayer;

@interface YXYProgressDashLayer : CALayer

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
 进度段数
 */
@property (nonatomic) NSUInteger progress;
/**
 底层 Layer，可以自定义渐变颜色
 */
@property (nonatomic, readonly) YXYColorfulDashLayer *underLayer;
/**
 进度条颜色
 */
@property (nonatomic) UIColor *progressColor;


/**
 刷新整个Layer
 */
- (void)refresh;

/**
 仅刷新 Dash 的 totalCount、dashGap 和 progress
 */
- (void)refreshProgress;

@end
