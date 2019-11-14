//
//  UIFont+WBAdaptFontSize.m
//  WBCategories
//
//  Created by Mr_Lucky on 2018/9/5.
//  Copyright © 2018年 WENBO. All rights reserved.
//

#import "UIFont+WBAdaptFontSize.h"
#import "NSObject+WBRuntime.h"
#import "WBMacro.h"

@implementation UIFont (WBAdaptFontSize)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /*  < systemFontOfSize > */
        [self wb_exchangeMethodWithOriginMethod:@selector(systemFontOfSize:)
                                         newSel:@selector(_wb_systemFontOfSize:)];
        
        /*  < boldSystemFontOfSize > */
        [self wb_exchangeMethodWithOriginMethod:@selector(boldSystemFontOfSize:)
                                         newSel:@selector(_wb_boldSystemFontOfSize:)];
        
        [self wb_exchangeMethodWithOriginMethod:@selector(fontWithName:size:)
                                         newSel:@selector(_wb_fontWithName:size:)];
    });
}

+ (UIFont *)_wb_systemFontOfSize:(CGFloat)fontSize {
    return [self _wb_systemFontOfSize:WB_AUTOLAYOUTSIZE(fontSize)];
}

+ (UIFont *)_wb_boldSystemFontOfSize:(CGFloat)fontSize {
    return [self _wb_boldSystemFontOfSize:WB_AUTOLAYOUTSIZE(fontSize)];
}

+ (UIFont *)_wb_fontWithName:(NSString *)fontName
                        size:(CGFloat)fontSize {
    return [self _wb_fontWithName:fontName
                             size:WB_AUTOLAYOUTSIZE(fontSize)];
}

@end
