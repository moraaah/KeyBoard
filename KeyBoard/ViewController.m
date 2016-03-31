//
//  ViewController.m
//  KeyBoard
//
//  Created by Lidear on 16/3/25.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface KACircleProgressView : UIView {
    CAShapeLayer *_trackLayer;
    UIBezierPath *_trackPath;
    CAShapeLayer *_progressLayer;
    UIBezierPath *_progressPath;
}
@property (nonatomic, strong) UIColor *trackColor;
@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic) float progress;
@property (nonatomic) float progressWidth;

- (void)setProgress:(float)progress animated:(BOOL)animated;

@end

@implementation KACircleProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _trackLayer = [CAShapeLayer new];
        [self.layer addSublayer:_trackLayer];
        _trackLayer.fillColor = nil;
        _trackLayer.frame = self.bounds;
        
        _progressLayer = [CAShapeLayer new];
        [self.layer addSublayer:_progressLayer];
        _progressLayer.fillColor = nil;
        _progressLayer.lineCap = kCALineCapRound;
        _progressLayer.frame = self.bounds;
        
        self.progressWidth = 5;
    }
    return self;
}

- (void)setTrack{
    _trackPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:(self.bounds.size.width - _progressWidth) / 2 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    _trackLayer.path = _trackPath.CGPath;
}

- (void)setProgress
{
    _progressPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:(self.bounds.size.width - _progressWidth)/ 2 startAngle:- M_PI_2 endAngle:(M_PI * 2) * _progress - M_PI_2 clockwise:YES];
    _progressLayer.path = _progressPath.CGPath;
}


- (void)setProgressWidth:(float)progressWidth
{
    _progressWidth = progressWidth;
    _trackLayer.lineWidth = _progressWidth;
    _progressLayer.lineWidth = _progressWidth;
    
    [self setTrack];
    [self setProgress];
}

- (void)setTrackColor:(UIColor *)trackColor
{
    _trackLayer.strokeColor = trackColor.CGColor;
}

- (void)setProgressColor:(UIColor *)progressColor
{
    _progressLayer.strokeColor = progressColor.CGColor;
}

- (void)setProgress:(float)progress
{
    _progress = progress;
    
    [self setProgress];
}

- (void)setProgress:(float)progress animated:(BOOL)animated
{
    
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    
//    KACircleProgressView *progress = [[KACircleProgressView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
//    [self.view addSubview:progress];
//    progress.trackColor = [UIColor blackColor];
//    progress.progressColor = [UIColor redColor];
//    progress.progress = .7;
//    progress.progressWidth = 5;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 200, 30)];
    label.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    
    NSString *str = [NSString stringWithFormat:@"%@",@(23)];
    [label setText:str];
    
    [self.view addSubview:label];
    
    UIBezierPath *leftPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 30)];
    leftPath.lineWidth = 10;
    CAShapeLayer *leftLayer = [CAShapeLayer new];
    leftLayer.path = leftPath.CGPath;
    leftLayer.fillColor = [UIColor clearColor].CGColor;
    leftLayer.strokeColor = [UIColor redColor].CGColor;
    [label.layer addSublayer:leftLayer];
    
    UIBezierPath *rightPath = [UIBezierPath bezierPathWithRect:CGRectMake(100, 0, 100, 30)];
    rightPath.lineWidth = 10;
    CAShapeLayer *rightLayer = [CAShapeLayer new];
    rightLayer.path = rightPath.CGPath;
    rightLayer.fillColor = [UIColor redColor].CGColor;
    rightLayer.strokeColor = [UIColor redColor].CGColor;
    [label.layer addSublayer:rightLayer];
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
