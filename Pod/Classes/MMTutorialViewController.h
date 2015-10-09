//
//  MMTutorialViewController.h
//  Pods
//
//  Created by ankye on 15/10/8.
//
//

#import <UIKit/UIKit.h>

#import "MMCommon.h"


typedef void (^DidSelectedEnter)();

@interface MMTutorialViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic,strong) NSArray* pages;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic,strong) NSArray* buttons;
@property (nonatomic,strong) NSMutableArray* didSelectedEnters;


//@property (nonatomic, strong) UIButton *enterButton;
//@property (nonatomic, copy) DidSelectedEnter didSelectedEnter;

-(id) initWithPages:(NSArray*)pages ;

-(id) initWithPages:(NSArray*)pages withButtons:(NSArray*)buttons;
-(void) startScrolling;

-(void)updateSingleButtonName:(NSString*)name;

@end
