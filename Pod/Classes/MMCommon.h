//
//  MMCommon.h
//  Pods
//
//  Created by ankye on 15/10/8.
//
//

#ifndef MMCommon_h
#define MMCommon_h

#define IPHONE_4S_HEIGHT 480

#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#endif

#ifndef SCREEN_WIDTH
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#endif



#define  TYPE_IMAGE             @"type_image"               //ONLY image background
#define  TYPE_IMAGE_IMGTITLE    @"type_image_imgtitle"               //image background and image title
#define  TYPE_IMAGE_TEXTTITLE   @"type_image_texttitle"               //image background and text title and text desc


#endif /* MMCommon_h */
