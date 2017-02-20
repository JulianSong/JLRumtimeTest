//
//  JLRuntimeProxyObject+AddProperty.m
//  JLRuntimeTest
//
//  Created by Julian Song on 17/2/17.
//  Copyright © 2017年 Julian Song. All rights reserved.
//

#import "JLRuntimeProxyObject+AddProperty.h"
#import <objc/objc-runtime.h>

static  NSString * const JLRuntimeProxyObject_name = @"JLRuntimeProxyObject_name";

@implementation JLRuntimeProxyObject (AddProperty)

+ (void)initialize
{
    IMP to = class_getMethodImplementation([self class], @selector(proxySomething3_repleace));
    class_replaceMethod([self class], @selector(proxySomething3), to,"v@:");
}
- (void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, (__bridge const void *)(JLRuntimeProxyObject_name), name, OBJC_ASSOCIATION_COPY);
}
- (NSString *)name
{
    return objc_getAssociatedObject(self,(__bridge const void *)(JLRuntimeProxyObject_name));
}

- (void)proxySomething3_repleace
{
    
    NSLog(@"dddddd");
}
@end
