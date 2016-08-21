//
//  PhotoView.h
//  ImageBrowser
//
//  Created by dubhe on 16/8/20.
//  Copyright © 2016年 dubhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoView : UIScrollView

@property (nonatomic, strong) DFAnimatedImageView *imageView;
@property (nonatomic, strong) UIScrollView *scrollView;

//加载图片
- (void) loadImageWithURLString:(NSString *)imageURLString;

@end
