//
//  MMTutorialPage.m
//  Pods
//
//  Created by ankye on 15/10/8.
//
//

#import "MMTutorialPage.h"
#import "MMStyle.h"


@implementation MMTutorialPage

-(id) initPageWithBg:(NSString*)background withfixBg4s:(NSString*)bgfix withTitle:(NSString*)title withDesc:(NSString*)desc
{
    if(self = [super init]){
        [self setBackgroundColor:[UIColor redColor]];
    }
    return self;
}

-(void)updateFrame:(CGRect)frame
{
    self.frame = frame;
}
@end


@implementation MMTutorialPageImage

-(id) initPageWithBg:(NSString*)background withfixBg4s:(NSString*)bgfix withTitle:(NSString*)title withDesc:(NSString*)desc
{
    if(self = [super init]){
        [self setBackgroundColor:[UIColor grayColor]];
        if(bgfix){
            if(SCREEN_HEIGHT==IPHONE_4S_HEIGHT){
                background = bgfix;
            }
        }
        self.bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:background]];
       
        [self addSubview:self.bgView];
    }
    return self;
}

-(void)updateFrame:(CGRect)frame
{
    [super updateFrame:frame];
    self.bgView.frame = frame;
}
@end


@implementation MMTutorialPageImageImgTitle

-(id) initPageWithBg:(NSString*)background withfixBg4s:(NSString*)bgfix withTitle:(NSString*)title withDesc:(NSString*)desc
{
    if(self = [super initPageWithBg:background withfixBg4s:bgfix withTitle:title withDesc:desc ]){
        self.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:title]];
        [self.titleView setBackgroundColor:[[MMStyle sharedStyle] titleBgColor]];
        [self addSubview:self.titleView];
    }
    return self;
}

-(void)updateFrame:(CGRect)frame
{
    [super updateFrame:frame];
     NSInteger offsetTitleX = (SCREEN_WIDTH - [[MMStyle sharedStyle] titleWidth])/2.0f;
    
    self.titleView.frame = CGRectMake(self.titleView.frame.origin.x+offsetTitleX, self.titleView.frame.origin.y + [[MMStyle sharedStyle] getTitleOriginY], [[MMStyle sharedStyle] titleWidth], [[MMStyle sharedStyle] titleHeight]);
    
}
@end


@implementation MMTutorialPageImageTextTitle

-(id) initPageWithBg:(NSString*)background withfixBg4s:(NSString*)bgfix withTitle:(NSString*)title withDesc:(NSString*)desc
{
    if(self = [super initPageWithBg:background withfixBg4s:bgfix withTitle:title withDesc:desc ]){
        self.titleLabel = [[RTLabel alloc] init];
        [self.titleLabel setText:title];
        [self addSubview:self.titleLabel];
        [self.titleLabel setBackgroundColor:[[MMStyle sharedStyle] titleBgColor]];
        [self.titleLabel setTextAlignment:RTTextAlignmentCenter];
        
        if(desc){
            self.descLabel = [[RTLabel alloc] init];
            [self.descLabel setText:desc];
            [self.descLabel setBackgroundColor:[[MMStyle sharedStyle] descBgColor]];
            [self addSubview:self.descLabel];
        }
    }
    return self;
}

-(void)updateFrame:(CGRect)frame
{
    [super updateFrame:frame];
    
    NSInteger offsetTitleX = (SCREEN_WIDTH - [[MMStyle sharedStyle] titleWidth])/2.0f;
    NSInteger offsetDescX = (SCREEN_WIDTH - [[MMStyle sharedStyle] descWidth])/2.0f;
    
    self.titleLabel.frame = CGRectMake(self.titleLabel.frame.origin.x+offsetTitleX, self.titleLabel.frame.origin.y + [[MMStyle sharedStyle] getTitleOriginY], [[MMStyle sharedStyle] titleWidth], [[MMStyle sharedStyle] titleHeight]);
    
    self.descLabel.frame = CGRectMake(self.descLabel.frame.origin.x+offsetDescX, self.descLabel.frame.origin.y + [[MMStyle sharedStyle] getDescOriginY], [[MMStyle sharedStyle] descWidth], [[MMStyle sharedStyle] descHeight]);

    
}

@end
