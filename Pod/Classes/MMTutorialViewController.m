//
//  MMTutorialViewController.m
//  Pods
//
//  Created by ankye on 15/10/8.
//
//

#import "MMTutorialViewController.h"
#import "MMTutorialPage.h"
#import "MMStyle.h"


@implementation MMTutorialViewController

-(id) initWithPages:(NSArray*)pages
{
    return [self initWithPages:pages withButtons:nil];
}

-(id)initWithPages:(NSArray *)pages withButtons:(NSArray*)buttons
{
    if(self = [super init]){
        
        self.pages = pages;
        
        
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        self.scrollView.delegate = self;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        
        [self.view addSubview:self.scrollView];
     
        self.pageControl = [[UIPageControl alloc] initWithFrame:[self frameOfPageControl]];

        self.pageControl.currentPageIndicatorTintColor = [[MMStyle sharedStyle] currentPageIndicatorTintColor];
        self.pageControl.pageIndicatorTintColor = [[MMStyle sharedStyle] pageIndicatorTintColor];
        
        [self.view addSubview:self.pageControl];
        
        if(buttons){
            self.buttons = buttons;
        }else{
            
            UIButton* button = [UIButton new];
            [button setTitle:NSLocalizedString(@"Enter", nil) forState:UIControlStateNormal];
            button.layer.cornerRadius = 4;
            button.layer.masksToBounds = YES;
            button.layer.borderWidth = 1;
            button.layer.borderColor = [[UIColor colorWithRed:65/255.0f green:33/255.0f blue:15/255.0f alpha:1.0f] CGColor];
            [button setTitleColor:[UIColor colorWithRed:65/255.0f green:33/255.0f blue:15/255.0f alpha:1.0f] forState:UIControlStateNormal];
            
            self.buttons = [[NSArray alloc] initWithObjects:button,nil];
         
        }
        
        self.didSelectedEnters = [[NSMutableArray alloc] initWithCapacity:self.buttons.count];
        
        [self.buttons enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
            btn.tag = idx;
            [btn addTarget:self action:@selector(enter:) forControlEvents:UIControlEventTouchUpInside];
            btn.frame = [self frameOfEnterButton:idx];
            btn.alpha = 0;
            [self.view addSubview:btn];
            
        }];
         

        
        
        
        [self reloadPages];

      
        
    }
    return self;
}

-(void)updateSingleButtonName:(NSString*)name
{
    UIButton* button = self.buttons[0];
    [button setTitle:NSLocalizedString(name, nil) forState:UIControlStateNormal];
}
-(void)startScrolling
{
    [MMStyle sharedStyle].isAutoScrolling = YES;
    [self autoScrollToNextPage];
    
}

- (void) reloadPages {
    CGRect frame = self.view.bounds;
    
    self.pageControl.numberOfPages = [[self pages] count];
    self.scrollView.contentSize = [self contentSizeOfScrollView];
    
    __block CGFloat x = 0;
    
    [[self pages] enumerateObjectsUsingBlock:^(MMTutorialPage *obj, NSUInteger idx, BOOL *stop) {
        [obj updateFrame:frame];
        obj.frame = CGRectOffset(obj.frame, x, 0);
        [self.scrollView addSubview:obj];
        
        x += obj.frame.size.width;
    }];
    
#pragma mark only one page
    if (self.pageControl.numberOfPages == 1) {
    
        [self.buttons enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
            btn.alpha = 1;
        }];
        self.pageControl.alpha = 0;
    }

    if (self.scrollView.contentSize.width == self.scrollView.frame.size.width) {
        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width + 1, self.scrollView.contentSize.height);
    }
}

- (CGRect) frameOfPageControl
{
    return CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40);
}

- (CGRect) frameOfEnterButton:(int)index
{
    UIButton* btn = self.buttons[0];
    
    CGSize size = btn.bounds.size;
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = CGSizeMake(self.view.frame.size.width * 0.6/self.buttons.count, 39);
    }
    int x = [self getButtonOffsetX:index width:size.width total:self.buttons.count padding:20];
    
    return CGRectMake(x, self.pageControl.frame.origin.y - size.height - (SCREEN_HEIGHT==IPHONE_4S_HEIGHT?30:60), size.width, size.height);
}

-(int)getButtonOffsetX:(int)index width:(int)width total:(int)total padding:(int)padding
{
    CGSize size = self.view.frame.size;
    int center = size.width/2 ;
    
    int startx = center - (total*width)/2.0 - ((total-1)*padding)/2.0;
    
    int x = startx;
    
    return x = x + (padding + width)* index;
   
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / self.view.frame.size.width;
    CGFloat alpha = 1 - ((scrollView.contentOffset.x - index * self.view.frame.size.width) / self.view.frame.size.width);
    if(alpha< 0.3f){
        alpha = 0.3f;
    }
    if ([self.pages count] > index) {
        UIView *v = [self.pages objectAtIndex:index];
        if (v) {
            [v setAlpha:alpha];
        }
    }
    
    self.pageControl.currentPage = scrollView.contentOffset.x / (scrollView.contentSize.width / [self numberOfPagesInPagingScrollView]);
    
    [self pagingScrollViewDidChangePages:scrollView];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView.panGestureRecognizer translationInView:scrollView.superview].x < 0) {
        if (![self hasNext:self.pageControl]) {
           if([[MMStyle sharedStyle] isLastPageScrollEnter])
           {
               [self enter:nil];
           }
        }
    }
}

#pragma mark - UIScrollView & UIPageControl DataSource

- (BOOL)hasNext:(UIPageControl*)pageControl
{
    return pageControl.numberOfPages > pageControl.currentPage + 1;
}

- (BOOL)isLast:(UIPageControl*)pageControl
{
    return pageControl.numberOfPages == pageControl.currentPage + 1;
}

- (NSInteger)numberOfPagesInPagingScrollView
{
    return [[self pages] count];
}

- (void)pagingScrollViewDidChangePages:(UIScrollView *)scrollView
{
    if ([self isLast:self.pageControl]) {
        [MMStyle sharedStyle].isAutoScrolling = NO;
        if (self.pageControl.alpha == 1) {
          //  self.enterButton.alpha = 0;
            [self.buttons enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
                btn.alpha = 0;
            }];
            [UIView animateWithDuration:0.4 animations:^{
          //      self.enterButton.alpha = 1;
                [self.buttons enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
                    btn.alpha =1;
                }];
                self.pageControl.alpha = 0;
            }];
        }
    } else {
        if (self.pageControl.alpha == 0) {
            [UIView animateWithDuration:0.4 animations:^{
           //     self.enterButton.alpha = 0;
                [self.buttons enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
                    btn.alpha = 0;
                }];
                self.pageControl.alpha = 1;
            }];
        }
    }
}



- (CGSize) contentSizeOfScrollView
{
    CGRect frame = self.view.bounds;
    return CGSizeMake(frame.size.width * self.pages.count, frame.size.height);
}

#pragma mark - Action
- (void)enter:(id)object{
    int index = 0;
    if(object){
        index = [(UIButton*)object tag];
    }

    DidSelectedEnter didSelectedEnter = self.didSelectedEnters[index];
    didSelectedEnter();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Animations
- (void)animateScrolling {
    
    NSInteger nextPage = self.pageControl.currentPage + 1;
    
    if (nextPage == self.pages.count ) {
        [MMStyle sharedStyle].isAutoScrolling = NO;
        return;
    }     

    [self scrollToNextPageIndex:nextPage];
    [self autoScrollToNextPage];
}

- (void)autoScrollToNextPage {
    if([[MMStyle sharedStyle] isAutoScrolling]){
        [self performSelector:@selector(animateScrolling)
                   withObject:nil
                   afterDelay:[[MMStyle sharedStyle] scrollTimeSecond]];
    }
}

- (void)scrollToNextPageIndex:(NSUInteger)nextPageIndex {

  
    
    [self.scrollView setContentOffset:CGPointMake(nextPageIndex * self.view.frame.size.width,0)
                             animated:YES];
    
    [self.pageControl setCurrentPage:nextPageIndex];
}

@end
