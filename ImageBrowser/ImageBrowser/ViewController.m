//
//  ViewController.m
//  ImageBrowser
//
//  Created by dubhe on 16/8/20.
//  Copyright © 2016年 dubhe. All rights reserved.
//

#import "ViewController.h"
#import "PhotoView.h"
@interface ViewController ()

@property (nonatomic, strong) PhotoView *photoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    PhotoView *photoView = [[PhotoView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:photoView];
    [photoView loadImageWithURLString:@"1.jpg"];
    self.photoView = photoView;
    self.photoView.backgroundColor = [UIColor redColor];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
