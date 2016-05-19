//
//  BackgroundLayer.h
//  CoverFlow
//
//  Created by projas on 5/18/16.
//  Copyright © 2016 projas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface BackgroundLayer : NSObject

+(CAGradientLayer*) greyGradient;
+(CAGradientLayer*) blueGradient;

@end
