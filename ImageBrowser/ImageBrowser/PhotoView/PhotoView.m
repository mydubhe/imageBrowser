//
//  PhotoView.m
//  ImageBrowser
//
//  Created by dubhe on 16/8/20.
//  Copyright © 2016年 dubhe. All rights reserved.
//

#import "PhotoView.h"

@interface PhotoView ()<UIScrollViewDelegate>

@end

@implementation PhotoView

#pragma mark - -------------------------- init & dealloc --------------------------
- (void)dealloc {
    
}

- (instancetype)initWithFrame:(CGRect)frmae {
    
    self = [super initWithFrame:frmae];
    if (self) {
        
        self.userInteractionEnabled = YES;
        self.delegate = self;
        self.contentMode = UIViewContentModeCenter;
        DFAnimatedImageView *imageView = [[DFAnimatedImageView alloc] initWithFrame:frmae];
        [self addSubview:imageView];
        self.imageView = imageView;
        
        UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapGestureAction:)];
        doubleTapGesture.numberOfTapsRequired = 2;
        doubleTapGesture.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:doubleTapGesture];
        
        self.delegate = self;
        self.minimumZoomScale = 1.0f;
        self.maximumZoomScale = 2.0f;
    }
    return self;
}

#pragma mark - -------------------------- loadImage --------------------------
- (void)loadImageWithURLString:(NSString *)imageURLString {
    [self.imageView setImage:[UIImage imageNamed:@"1.jpg"]];
}

#pragma mark - -------------------------- UIScrollViewDelegate --------------------------
//图片显示只调用ZOOM相关代理方法

//scrollView滚动时，就调用该方法。任何offset值改变都调用该方法。即滚动过程中，调用多次
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

// 将要开始缩放时执行,并且只执行一次
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {

}

//返回将要缩放的对象,执行多次
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

//当缩放结束后，并且缩放大小回到minimumZoomScale与maximumZoomScale之间后（我们也许会超出缩放范围），调用该方法
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    [self setZoomScale:scale animated:YES];
}

//缩放时调用,多次执行
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGSize boundsSize = self.bounds.size;
    UIView *contentView = self.imageView;
    CGRect contentsFrame = contentView.frame;
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    contentView.frame = contentsFrame;

}

#pragma mark - -------------------------- Action --------------------------
- (void)doubleTapGestureAction:(UITapGestureRecognizer *)sender {
    if (self.zoomScale > self.minimumZoomScale) {
        [self setZoomScale:self.minimumZoomScale animated:YES];
    }else{
        CGPoint pointInView = [sender locationInView:self.imageView];
        CGSize scrollViewSize = self.bounds.size;
        
        CGFloat vFactor = CGRectGetWidth(self.frame)/CGRectGetWidth(self.imageView.frame);
        CGFloat hFactor = CGRectGetHeight(self.frame)/CGRectGetHeight(self.imageView.frame);
        CGFloat factor = MAX(hFactor, vFactor);
        if (factor<2.0) {
            factor = 2.0;
        }
        CGFloat w = scrollViewSize.width / factor;
        CGFloat h = scrollViewSize.height / factor;
        CGFloat x = pointInView.x - (w / 2.0f);
        CGFloat y = pointInView.y - (h / 2.0f);
        
        //CGRect rectToZoomTo = CGRectMake(x, y, w, h);
        //[self zoomToRect:rectToZoomTo animated:YES];
        
        
    }
}
@end
