//
//  SnowOC.m
//  Animation
//
//  Created by DaiFengyi on 16/1/20.
//  Copyright © 2016年 DaiFengyi. All rights reserved.
//

#import "SnowOC.h"
#import <QuartzCore/QuartzCore.h>


static long steps;
@interface SnowOC ()
@property (strong, nonatomic) CADisplayLink *gameTimer;
@property (strong, nonatomic) UIImage *snowImage;
@end

@implementation SnowOC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    steps = 0;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.snowImage = [UIImage imageNamed:@"雪花.png"];
    
    self.gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(step)];
    [self.gameTimer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)step
{
    steps++;
    
    if (steps%6 == 0) {
        NSLog(@"add snow");
        UIImageView *imageView = [[UIImageView alloc] initWithImage:self.snowImage];
        [self.view addSubview:imageView];
        
        CGFloat size= arc4random_uniform(320)/320.0;
        [imageView setFrame:CGRectMake(arc4random_uniform(320), 0, 10 * size + 10, 10 * size +10)];
        
        
        [UIView animateWithDuration:2.0f animations:^{
            [imageView setCenter:CGPointMake(arc4random_uniform(320), 460 + arc4random_uniform(100))];
            [imageView setTransform:CGAffineTransformMakeRotation(M_PI)];
            [imageView setAlpha:0.2f];
            
        } completion:^(BOOL finished) {
            [imageView removeFromSuperview];
        }];
    }
}
@end
