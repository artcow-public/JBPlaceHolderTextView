//
//  ViewController.m
//  JBPlaceHolderTextView
//
//  Created by aram on 2015. 9. 14..
//  Copyright (c) 2015년 artcow. All rights reserved.
//

#import "ViewController.h"
#import "JBPlaceHolderTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @(self.navigationController.viewControllers.count).description;
    
    UIButton *back = [[UIButton alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:back];

    
    JBPlaceHolderTextView *textView1 = [[JBPlaceHolderTextView alloc] initWithFrame:CGRectMake(0, 0, 280, 88)];
    textView1.center = CGPointMake(self.view.frame.size.width / 2, 100);
    textView1.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.1];
    textView1.placeHolder = @"Text View 1 Place Holder";
    textView1.font = [UIFont systemFontOfSize:17];
    
    [self.view addSubview:textView1];
    
    JBPlaceHolderTextView *textView2 = [[JBPlaceHolderTextView alloc] initWithFrame:CGRectMake(0, 0, 280, 88)];
    textView2.center = CGPointMake(self.view.frame.size.width / 2, 200);
    textView2.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.1];
    textView2.placeHolder = @"Text View 2 Place Holder";
    textView2.text = @"Text";
    textView2.font = [UIFont systemFontOfSize:15];
    
    [self.view addSubview:textView2];
    
    [back addTarget:textView1 action:@selector(resignFirstResponder) forControlEvents:UIControlEventTouchUpInside];
    [back addTarget:textView2 action:@selector(resignFirstResponder) forControlEvents:UIControlEventTouchUpInside];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
