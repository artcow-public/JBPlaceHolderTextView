//
//  JBPlaceHolderTextView.m
//  JBPlaceHolderTextView
//
//  Created by aram on 2015. 9. 14..
//  Copyright (c) 2015년 artcow. All rights reserved.
//

#import "JBPlaceHolderTextView.h"

@interface JBPlaceHolderTextView ()

@property (nonatomic, assign) BOOL placeHolderFlag;
@property (nonatomic, strong) UIColor *textColorHolder;

@end

@implementation JBPlaceHolderTextView

- (BOOL)canBecomeFirstResponder
{
    [self _becomeFirstResponder_];
    return YES;
}

- (BOOL)canResignFirstResponder
{
    [self _resignFirstResponder_];
    return YES;
}

- (void)_becomeFirstResponder_
{
    if (self.placeHolderFlag)
    {
        [super setText:@""];
        [super setTextColor:self.textColorHolder];
        self.placeHolderFlag = NO;
    }
}

- (void)_resignFirstResponder_
{
    if (self.placeHolder != nil && self.text.length == 0)
    {
        [super setText:self.placeHolder];
        self.placeHolderFlag = YES;
        [super setTextColor:[self _placeHolderColor]];
    }
}

- (void)setTextColor:(UIColor *)textColor
{
    if (self.placeHolderFlag == NO)
        [super setTextColor:textColor];
    self.textColorHolder = textColor;
}

- (void)setText:(NSString *)text
{
    if (text.length == 0)
    {
        [super setText:self.placeHolder];
        [super setTextColor:[self _placeHolderColor]];
        self.placeHolderFlag = YES;
    }
    else
    {
        [super setText:text];
        
        if (self.placeHolderFlag)
        {
            self.placeHolderFlag = NO;
            [super setTextColor:self.textColorHolder];
        }
    }
}

- (void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolder = placeHolder;
    
    if (self.text.length == 0 || self.placeHolderFlag)
    {
        [super setText:placeHolder];
        [super setTextColor:[self _placeHolderColor]];
        self.placeHolderFlag = YES;
    }
}

#pragma mark - private method

- (UIColor *)_placeHolderColor
{
    return self.placeHolderColor ? self.placeHolderColor : [UIColor lightGrayColor];
}

@end
