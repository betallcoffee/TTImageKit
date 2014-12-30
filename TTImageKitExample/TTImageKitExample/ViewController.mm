//
//  ViewController.m
//  TTImageKitExample
//
//  Created by liang on 2/9/14.
//  Copyright (c) 2014 liang. All rights reserved.
//

#import <ImageIO/ImageIO.h>
#import "ViewController.h"
#import "TTImageView.h"
//#import "TTQCARCameraViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    TTImageView *imageView = [[TTImageView alloc] initWithFrame:self.view.frame];
    [imageView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:imageView];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"gif"];
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"card1" ofType:@"jpg"];
//    NSURL *imageURL = [NSURL fileURLWithPath:imagePath];
    NSURL *imageURL = [NSURL URLWithString:@"https://camo.githubusercontent.com/1560be050811ab73457e90aee62cd1cd257c7fb9/68747470733a2f2f7261772e6769746875622e636f6d2f41464e6574776f726b696e672f41464e6574776f726b696e672f6173736574732f61666e6574776f726b696e672d6c6f676f2e706e67"];
//    NSURL *imageURL = [NSURL URLWithString:@"http://img5.cache.netease.com/mobile/2014/12/29/2014122919304343665_550.jpg"];
    [imageView setImageURL:imageURL];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 40)];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)press:(id)sender {
//    TTQCARCameraViewController *viewController = [[TTQCARCameraViewController alloc] initWithTrackersDataFilename:nil trackerUpdate:nil];
//    [self.navigationController pushViewController:viewController animated:YES];
}

@end
