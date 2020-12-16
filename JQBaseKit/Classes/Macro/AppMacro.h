//
//  AppMacro.h
//  FastCreateProjectTools
//
//  Created by xiejuqiang on 2019/11/8.
//  Copyright © 2019 juqiangxie. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

/**< log */
#ifdef DEBUG
#define NSLog(...)  printf("\n\n--------------------\n%s Line:%d]\n[\n%s\n]\n\n",__FUNCTION__,__LINE__,[[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define NSLog(...) {}
#endif


#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif


#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

/*device type*/
#define iPhone4         ([[UIScreen mainScreen] bounds].size.height==480)
#define iPhone5         ([[UIScreen mainScreen] bounds].size.height==568)
#define iPhone6         ([[UIScreen mainScreen] bounds].size.height==667)
#define iPhone6plus     ([[UIScreen mainScreen] bounds].size.height==736)
#define iPhoneX         ([[UIScreen mainScreen] bounds].size.height==812 || [[UIScreen mainScreen] bounds].size.height==896)

#define PN_StatusBarHeight ((iPhoneX)?44:20) //状态栏高度
#define NAVIBAR_HEIGHT (PN_StatusBarHeight + 44)
#define TABBAR_HEIGHT ((iPhoneX)?83:49)

#define ScreenWidth         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight        [[UIScreen mainScreen] bounds].size.height

#endif /* AppMacro_h */
