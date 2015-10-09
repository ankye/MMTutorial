//
//  MMPageFactory.h
//  Pods
//
//  Created by ankye on 15/10/8.
//
//

#import <Foundation/Foundation.h>
#import "MMTutorialPage.h"
#import "MMCommon.h"

@interface MMPageFactory : NSObject

+(MMTutorialPage*)createPageWithType:(NSString*)type withBg:(NSString*)bg withfixBg4s:(NSString*)bgfix withTitle:(NSString*)title withDesc:(NSString*)desc ;

@end
