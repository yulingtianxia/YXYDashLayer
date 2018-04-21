//
//  ViewController.m
//  YXYDashLayerSample
//
//  Created by 杨萧玉 on 2018/4/20.
//  Copyright © 2018年 杨萧玉. All rights reserved.
//

#import "ViewController.h"
#import "YXYProgressDashLayer.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *cornerRadiusSlider;
@property (weak, nonatomic) IBOutlet UISlider *dashGapSlider;
@property (weak, nonatomic) IBOutlet UISlider *dashWidthSlider;
@property (weak, nonatomic) IBOutlet UISlider *totalCountSlider;
@property (weak, nonatomic) IBOutlet UISlider *grayCountSlider;

@property (nonatomic) YXYProgressDashLayer *progressDash;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.progressDash = [YXYProgressDashLayer layer];
    self.progressDash.underLayer.colors = @[(id)[UIColor blueColor].CGColor, (id)[UIColor greenColor].CGColor];
    self.progressDash.progressColor = [UIColor grayColor];

    CGFloat radius = self.cornerRadiusSlider.value;
    self.progressDash.dashCornerRadius = radius;

    CGFloat dashGap = self.dashGapSlider.value;
    self.progressDash.dashGap = dashGap;

    CGFloat dashWidth = self.dashWidthSlider.value;
    self.progressDash.dashWidth = dashWidth;

    NSInteger count = self.totalCountSlider.value;
    self.progressDash.totalCount = count;

    self.progressDash.progress = self.grayCountSlider.value;

    CGRect dashRect = CGRectMake((self.view.frame.size.width - 200) / 2, 50, 200, 300);
    self.progressDash.frame = dashRect;
    [self.progressDash refresh];
    [self.view.layer addSublayer:self.progressDash];
}


- (IBAction)cornerRadiusChanged:(UISlider *)sender {
    self.progressDash.dashCornerRadius = self.cornerRadiusSlider.value;
    [self.progressDash refresh];
}
- (IBAction)dashGapChanged:(UISlider *)sender {
    self.progressDash.dashGap = self.dashGapSlider.value;
    [self.progressDash refreshProgress];
}
- (IBAction)dashWidthChanged:(UISlider *)sender {
    self.progressDash.dashWidth = self.dashWidthSlider.value;
    [self.progressDash refresh];
}
- (IBAction)totalCountChanged:(UISlider *)sender {
    NSInteger count = self.totalCountSlider.value;
    self.progressDash.totalCount = count;
    [self.progressDash refreshProgress];
}
- (IBAction)grayCountChanged:(UISlider *)sender {
    self.progressDash.progress = self.grayCountSlider.value;
    [self.progressDash refreshProgress];
}

@end
