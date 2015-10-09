//
//  MMStyle.h
//  Pods
//
//  Created by ankye on 15/10/9.
//
//

#import <Foundation/Foundation.h>

@class  MMTutorialPage;

@interface MMStyle : NSObject

//all title (image and text)

//TOP OFFSET Y
@property (nonatomic, assign) NSInteger titleOriginY;
@property (nonatomic,assign) NSInteger  title4sOffsetY;

@property (nonatomic, assign) NSInteger titleWidth;
@property (nonatomic, assign) NSInteger titleHeight;
@property (nonatomic,strong) UIColor*   titleBgColor;

@property (nonatomic, assign) NSInteger descOriginY;
@property (nonatomic,assign) NSInteger  desc4sOffsetY;

@property (nonatomic, assign) NSInteger descWidth;
@property (nonatomic, assign) NSInteger descHeight;
@property (nonatomic,strong) UIColor*   descBgColor;

@property (nonatomic,assign) BOOL       isLastPageScrollEnter;

@property (nonatomic,assign) NSInteger  scrollTimeSecond;
@property (nonatomic,assign) BOOL       isAutoScrolling;

@property (nonatomic,strong) UIColor* currentPageIndicatorTintColor ;
@property (nonatomic,strong) UIColor* pageIndicatorTintColor ;

@property (nonatomic,strong) NSMutableDictionary* pageClassPool;



-(NSInteger)getTitleOriginY;

-(NSInteger)getDescOriginY;

+ (instancetype)sharedStyle;


-(void)registerNewPageClass:(NSString*)type className:(NSString*)className;

-(Class)getTutorialPage:(NSString*)type;



@end
