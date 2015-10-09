//
//  MMStyle.m
//  Pods
//
//  Created by ankye on 15/10/9.
//
//

#import "MMStyle.h"
#import "MMCommon.h"
#import "MMTutorialPage.h"

@implementation MMStyle

-(id)init
{
    if(self = [super init]){
        self.titleOriginY = 64;
        self.title4sOffsetY = 44;
        self.titleWidth = SCREEN_WIDTH - 10;
        self.titleHeight = 64;
        self.titleBgColor = [UIColor clearColor];
        
        self.descOriginY = 244;
        self.desc4sOffsetY = 204;
        self.descWidth = SCREEN_WIDTH - 10;
        self.descHeight = 150;
        self.descBgColor = [UIColor clearColor];
        
        self.isLastPageScrollEnter = NO;
        
        self.isAutoScrolling = NO;
        self.scrollTimeSecond = 3;
        
        self.currentPageIndicatorTintColor = [UIColor whiteColor];
        self.pageIndicatorTintColor = [UIColor grayColor];
        
        self.pageClassPool = [[NSMutableDictionary alloc] initWithCapacity:3];
        
        [self registerNewPageClass:TYPE_IMAGE className:@"MMTutorialPageImage"];
        [self registerNewPageClass:TYPE_IMAGE_IMGTITLE className:@"MMTutorialPageImageImgTitle"];
        [self registerNewPageClass:TYPE_IMAGE_TEXTTITLE className:@"MMTutorialPageImageTextTitle"];
        
        
    }
    return self;
}

-(NSInteger)getTitleOriginY
{
    return (SCREEN_HEIGHT==IPHONE_4S_HEIGHT?self.title4sOffsetY :self.titleOriginY);
}

-(NSInteger)getDescOriginY
{
    return (SCREEN_HEIGHT==IPHONE_4S_HEIGHT?self.desc4sOffsetY :self.descOriginY);
}

-(void)registerNewPageClass:(NSString*)type className:(NSString*)className;
{
    
    [self.pageClassPool setValue:className forKey:type];
}

-(Class)getTutorialPage:(NSString*)type
{
    NSString* className = [self.pageClassPool objectForKey:type];
    Class aClass = NSClassFromString(className);
    if( [aClass isSubclassOfClass:[MMTutorialPage class]]){
        return aClass;
    }
    return nil;
    
}
+ (instancetype)sharedStyle {
    
    static MMStyle *_sharedStyle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedStyle = [[MMStyle alloc] init];
        
    });
    
    return _sharedStyle;
}



@end
