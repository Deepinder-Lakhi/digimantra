//
//  KUTextViewEffect.m
//  Katchup
//
//  Created by Gonçalo Rodrigues Braz Frade on 04/11/15.
//  Copyright © 2015 KatchUp. All rights reserved.
//

#import "KUTextViewEffect.h"
#import "PureLayout.h"

@implementation KUTextViewEffect
{
    UILabel* placeholderLabel;
    
    NSAttributedString* _attrPlacholder;
    
    NSString* _placeholderText;
    
    NSLayoutConstraint* placeholderConstraint;
    
    BOOL isActive;
    
    CALayer *bottomBorder;
    
}

-(instancetype)init
{
    if(self = [super init])
    {
        [self initialize];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self initialize];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    /*[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidBeginEditing:)
                                                 name:UITextFieldTextDidBeginEditingNotification
                                               object:self];*/
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidEndEditing:)
                                                 name:UITextFieldTextDidEndEditingNotification
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidChange:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self];
    
    
    
    [self setClipsToBounds:false];
    
    self.animationDuration = 0.3f;
    
    self.layer.cornerRadius = self.cornerRadius;
    
    placeholderLabel = [[UILabel alloc] initForAutoLayout];
    
    placeholderLabel.text = _placeholderText = self.placeholder;
    
    [super setPlaceholder:nil];
    
    //placeholderLabel.attributedText = _attrPlacholder = self.attributedPlaceholder;
    
    //[super setAttributedPlaceholder:nil];
    
    if(self.font)
        placeholderLabel.font = self.font;
    
    [self addSubview:placeholderLabel];
    
    self.placeholderinsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [placeholderLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:self.placeholderinsets.left];
    
    [placeholderLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:self.placeholderinsets.right];
    
    [placeholderLabel autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self withOffset:self.placeholderinsets.bottom + self.placeholderinsets.top];
    
    placeholderConstraint = [placeholderLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:self.placeholderinsets.top];
    
    bottomBorder = [CALayer layer];
    
    bottomBorder.frame = CGRectMake(0.0f, self.frame.size.height - 1, self.frame.size.width, 1.0f);
    
    bottomBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    [self.layer addSublayer:bottomBorder];
    
    if(self.text && [self.text isEqualToString:@""])
        [self changeToNormalAnimate:NO];
    else
        [self changeToActiveAnimate:NO];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    bottomBorder.frame = CGRectMake(0.0f, self.frame.size.height - 1, self.frame.size.width, 1.0f);
}

-(void)setText:(NSString *)text
{
    [super setText:text];
    
    if(text)
        [self changeToActiveAnimate:true];
    else
        [self changeToNormalAnimate:true];
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    [placeholderLabel setFont:font];
}

-(void)setNormalPlaceholderColor:(UIColor *)value
{
    self->_normalPlaceholderColor = value;
    
    [placeholderLabel setTextColor:value];
}

-(void)setActivePlaceholderColor:(UIColor *)value
{
    self->_activePlaceholderColor = value;
    
    [placeholderLabel setTextColor:value];
}

-(void)setPlaceholder:(NSString *)value
{
    _placeholderText = value;
    
    placeholderLabel.text = value;
}

-(void)setAttributedPlaceholder:(NSAttributedString *)value
{
    _attrPlacholder = value;
    
    placeholderLabel.attributedText = value;
}

-(void)setCornerRadius:(CGFloat)value
{
    self->_cornerRadius = value;
    
    self.layer.cornerRadius = value;
}

-(void)setNormalBorderColor:(UIColor *)value
{
    self->_normalBorderColor = value;
    
    if(!isActive)
        self.layer.borderColor = value.CGColor;
}

-(void)setActiveBorderColor:(UIColor *)value
{
    self->_activeBorderColor = value;
    
    if(isActive)
        self.layer.borderColor = value.CGColor;
}

-(void)setActiveBorderThickness:(CGFloat)value
{
    self->_activeBorderThickness = value;
    
    if(isActive)
        self.layer.borderWidth = value;

}

-(void)setNormalBorderThickness:(CGFloat)value
{
    self->_normalBorderThickness = value;
    
    if(isActive)
        self.layer.borderWidth = value;

}

-(void)changeToActiveAnimate:(BOOL)animated
{
    [self layoutIfNeeded];
    
    placeholderConstraint.constant = -(placeholderLabel.frame.size.height + self.placeholderinsets.top);
    
    if(animated)
    {
        CABasicAnimation *color = [CABasicAnimation animationWithKeyPath:@"borderColor"];
        color.fromValue = (id)self.normalBorderColor.CGColor;
        color.toValue   = (id)self.activeBorderColor.CGColor;
        self.layer.borderColor = self.activeBorderColor.CGColor;
        
        CABasicAnimation *width = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
        width.fromValue = @(self.normalBorderThickness);
        width.toValue   = @(self.activeBorderThickness);
        self.layer.borderWidth = self.activeBorderThickness;
        
        CAAnimationGroup *bothAnimations = [CAAnimationGroup animation];
        bothAnimations.duration   = self.animationDuration;
        bothAnimations.animations = @[color, width];
        bothAnimations.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.layer addAnimation:bothAnimations forKey:@"color_width"];
        
        [UIView animateWithDuration:self.animationDuration animations:^{
            
            [placeholderLabel setTextColor:self.activePlaceholderColor];
            
            [self layoutIfNeeded];
        }];
    }
    else
    {
        [placeholderLabel setTextColor:self.activePlaceholderColor];
        
        self.layer.borderWidth = self.activeBorderThickness;
        
        self.layer.borderColor = self.activeBorderColor.CGColor;
        
        [self layoutIfNeeded];
    }
    
    isActive = true;
}

-(void)changeToNormalAnimate:(BOOL)animated
{
    [self layoutIfNeeded];
    
    placeholderConstraint.constant = self.placeholderinsets.top;
    
    if(animated)
    {
        CABasicAnimation *color = [CABasicAnimation animationWithKeyPath:@"borderColor"];
        color.fromValue = (id)self.activeBorderColor.CGColor;
        color.toValue   = (id)self.normalBorderColor.CGColor;
        color.duration = self.animationDuration;
        self.layer.borderColor = self.normalBorderColor.CGColor;
        
        CABasicAnimation *width = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
        width.fromValue = @(self.activeBorderThickness);
        width.toValue   = @(self.normalBorderThickness);
        self.layer.borderWidth = self.normalBorderThickness;
        
        CAAnimationGroup *bothAnimations = [CAAnimationGroup animation];
        bothAnimations.duration   = self.animationDuration;
        bothAnimations.animations = @[color, width];
        bothAnimations.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.layer addAnimation:bothAnimations forKey:@"color_width"];
        
        [UIView animateWithDuration:self.animationDuration animations:^{
            
            [placeholderLabel setTextColor:self.normalPlaceholderColor];
            
            [self layoutIfNeeded];
        }];
    }
    else
    {
        [placeholderLabel setTextColor:self.normalPlaceholderColor];
        
        self.layer.borderWidth = self.normalBorderThickness;
        
        self.layer.borderColor = self.normalBorderColor.CGColor;
        
        [self layoutIfNeeded];
    }
    
    isActive = false;
}

- (void)textFieldDidEndEditing:(NSNotification*)notification
{
    if(self.text && [self.text isEqualToString:@""])
        [self changeToNormalAnimate:YES];
}

-(void)textFieldDidChange:(NSNotification*)notification
{
    if([self.text length] > 0)
        [self changeToActiveAnimate:YES];
    else
        [self changeToNormalAnimate:YES];
}

-(void)prepareForInterfaceBuilder
{
    [self initialize];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
