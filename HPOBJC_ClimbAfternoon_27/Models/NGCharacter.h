//
//  NGCharacter.h
//  HPOBJC_ClimbAfternoon_27
//
//  Created by Nic Gibson on 7/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NGCharacter : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *wand;
@property (nonatomic, copy, readonly) NSString *house;
@property (nonatomic, copy, readonly) NSString *bloodStatus;
@property (nonatomic, readonly) bool deathEater;

- (instancetype)initWithName:(NSString *)name
                        wand:(NSString *)wand
                       house:(NSString *)house
                 bloodStatus:(NSString *)bloodstatus
                  deathEater:(bool)deatheater;

@end

@interface NGCharacter (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
