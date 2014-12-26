//
//  TTImageView.h
//  TTImageKitExample
//
//  Created by liang on 2/9/14.
//  Copyright (c) 2014 liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTImageView : UIView

@property (nonatomic, readonly) CGSize size;

- (void)setImageData:(NSData *)data;
- (void)setImageURL:(NSURL *)url;

@end
