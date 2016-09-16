//
//  KUTextViewEffect.h
//  Katchup
//
//  Created by Gonçalo Rodrigues Braz Frade on 04/11/15.
//  Copyright © 2015 KatchUp. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface KUTextViewEffect : UITextField<UITextFieldDelegate>

@property (nonatomic) IBInspectable UIColor* activeBorderColor;
@property (nonatomic) IBInspectable UIColor* normalBorderColor;

@property (nonatomic) IBInspectable CGFloat activeBorderThickness;
@property (nonatomic) IBInspectable CGFloat normalBorderThickness;

@property (nonatomic) IBInspectable UIColor* activePlaceholderColor;
@property (nonatomic) IBInspectable UIColor* normalPlaceholderColor;

@property (nonatomic) IBInspectable BOOL isUnderlineActive;
@property (nonatomic) IBInspectable UIColor* activeUnderlineColor;
@property (nonatomic) IBInspectable UIColor* normalUnderlineColor;

@property (nonatomic) IBInspectable CGFloat activeUnderlineThickness;
@property (nonatomic) IBInspectable CGFloat normalUnderlineThickness;

@property (nonatomic) IBInspectable UIFontDescriptor* activePlaceholderFont;
@property (nonatomic) IBInspectable UIFontDescriptor* normalPlaceholderFont;

@property (nonatomic) IBInspectable CGFloat cornerRadius;

@property (nonatomic) CFTimeInterval animationDuration;

@property (nonatomic) UIEdgeInsets placeholderinsets;

@end
