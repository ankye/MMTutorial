//
//  MMPageFactory.m
//  Pods
//
//  Created by ankye on 15/10/8.
//
//

#import "MMPageFactory.h"
#import "MMStyle.h"

@implementation MMPageFactory

+(MMTutorialPage*)createPageWithType:(NSString*)type withBg:(NSString*)background withfixBg4s:(NSString*)bgfix withTitle:(NSString*)title withDesc:(NSString*)desc
{
    Class aClass = [[MMStyle sharedStyle] getTutorialPage:type];
    NSAssert(aClass != nil, @"Page Class %@ not exist !",type);
    
    
    return [[aClass alloc] initPageWithBg:background withfixBg4s:bgfix withTitle:title withDesc:desc];
    
}

@end

