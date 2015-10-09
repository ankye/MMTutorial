//
//  MMTutorialPage.h
//  Pods
//
//  Created by ankye on 15/10/8.
//
//

#import <UIKit/UIKit.h>
#import "MMCommon.h"
#import "RTLabel.h"


@interface MMTutorialPage : UIView

-(id) initPageWithBg:(NSString*)background withfixBg4s:(NSString*)bgfix withTitle:(NSString*)title withDesc:(NSString*)desc;
-(void)updateFrame:(CGRect)frame;

@end


@interface MMTutorialPageImage : MMTutorialPage

@property (nonatomic, strong) UIImageView *bgView;

-(id) initPageWithBg:(NSString*)background withfixBg4s:(NSString*)bgfix withTitle:(NSString*)title withDesc:(NSString*)desc;
-(void)updateFrame:(CGRect)frame;
@end

@interface MMTutorialPageImageImgTitle : MMTutorialPageImage

@property (nonatomic, strong) UIImageView *titleView;

-(id) initPageWithBg:(NSString*)background withfixBg4s:(NSString*)bgfix withTitle:(NSString*)title withDesc:(NSString*)desc;
-(void)updateFrame:(CGRect)frame;
@end


@interface MMTutorialPageImageTextTitle : MMTutorialPageImage

@property (nonatomic, strong) RTLabel *titleLabel;
@property (nonatomic, strong) RTLabel *descLabel;

-(id) initPageWithBg:(NSString*)background withfixBg4s:(NSString*)bgfix withTitle:(NSString*)title withDesc:(NSString*)desc;
-(void)updateFrame:(CGRect)frame;

@end

