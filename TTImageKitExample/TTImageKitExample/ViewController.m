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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"gif"];
    NSURL *imageURL = [NSURL fileURLWithPath:imagePath];
    TTImageView *imageView = [[TTImageView alloc] initWithFrame:self.view.frame];
    [imageView setBackgroundColor:[UIColor whiteColor]];
    [imageView setImageURL:imageURL];
    imageView.frame = CGRectMake(0, 0, imageView.size.width, imageView.size.height);
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
