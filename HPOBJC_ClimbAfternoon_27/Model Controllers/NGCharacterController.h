//
//  NGCharacterController.h
//  HPOBJC_ClimbAfternoon_27
//
//  Created by Nic Gibson on 7/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NGCharacter.h"

@interface NGCharacterController : NSObject

// Shared Instance
+(instancetype) sharedInstance;

// Fetch character function
-(void)fetchCharacters:(void(^)(NSArray<NGCharacter *> *characters))completion;

@end

