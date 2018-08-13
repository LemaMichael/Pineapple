
@interface SBFUserAuthenticationController : NSObject
+(BOOL)_isInGracePeriodState;
+(BOOL)_isInBioUnlockState;
+(long long)_extendedKeybagState;
-(void)dealloc;
-(NSString *)description;
-(void)_clearBlockedState;
-(void)keybagDidUnlockForTheFirstTime:(id)arg1 ;
-(id)publicDescription;
-(void)keybag:(id)arg1 extendedStateDidChange:(id)arg2 ;
-(BOOL)hasPasscodeSet;
-(id)initWithAssertionManager:(id)arg1 policy:(id)arg2 keybag:(id)arg3 model:(id)arg4 ;
-(void)_initializeAuthenticationStateAndDateForLockState:(long long)arg1 ;
-(void)_establishAuthenticationStateForInit:(long long)arg1 ;
-(void)_setupPolicy:(id)arg1 ;
-(void)_setHasBeenAuthenticatedOnceSinceBoot:(BOOL)arg1 ;
-(void)_clearUnblockTimer;
-(void)_addAsFirstResponder:(id)arg1 ;
-(void)_removeAuthResponder:(id)arg1 ;
-(BOOL)_processAuthenticationRequest:(id)arg1 responder:(id)arg2 ;
-(long long)_evaluateAuthenticationAttempt:(id)arg1 outError:(id*)arg2 ;
-(void)_notifyClientsOfAuthenticationResult:(long long)arg1 forRequest:(id)arg2 error:(id)arg3 withResponder:(id)arg4 ;
-(BOOL)_boolForAuthenticationResult:(long long)arg1 ;
-(void)_handleSuccessfulAuthentication:(id)arg1 responder:(id)arg2 ;
-(void)_handleFailedAuthentication:(id)arg1 error:(id)arg2 responder:(id)arg3 ;
-(void)_handleInvalidAuthentication:(id)arg1 responder:(id)arg2 ;
-(void)_scheduleUnblockTimer;
-(void)_setAuthState:(long long)arg1 ;
-(void)_updateAuthenticationStateImmediately:(BOOL)arg1 forPublicReason:(id)arg2 ;
-(long long)_authenticationState;
-(BOOL)_performNilPasscodeCheck;
-(void)_uncachePasscodeIfNecessary;
-(void)_setSecureMode:(BOOL)arg1 postNotification:(BOOL)arg2 ;
-(BOOL)_isUserAuthenticated;
-(void)_revokeAuthenticationImmediately:(BOOL)arg1 forPublicReason:(id)arg2 ;
-(BOOL)_authenticateIfInGracePeriod;
-(void)_updateAuthenticationStateForPublicReason:(id)arg1 ;
-(BOOL)isAssertionValid:(id)arg1 ;
-(void)notePasscodeEntryBegan;
-(void)notePasscodeEntryCancelled;
-(void)_notifyAboutTemporaryBlockStatusChanged;
-(BOOL)_isTemporarilyBlocked;
-(BOOL)_isPermanentlyBlocked;
-(void)_refreshModelCacheIfNeeded;
-(long long)_evaluatePasscodeAttempt:(id)arg1 outError:(id*)arg2 ;
-(long long)_evaluateMesaAttempt:(id)arg1 ;
-(BOOL)_authenticateWithPasscodeData:(id)arg1 outError:(id*)arg2 ;
-(void)_setup_runLoopObserverIfNecessary;
-(void)_invalidateCachedPasscodeLockState;
-(void)_updateSecureModeIfNecessaryForNewAuthState;
-(void)_setOkToSendNotifications:(BOOL)arg1 ;
-(void)_updateHasPasscodeSetForLockState:(long long)arg1 ;
-(BOOL)_shouldRevokeAuthenticationNow;
-(void)_unblockTimerFired;
-(void)_updateAuthenticationStateAndFirstAuthenticationForLockState:(long long)arg1 ;
-(void)_updateAuthenticationStateAndDateForLockState:(id)arg1 ;
-(void)deviceLockModelRequestsDeviceWipe:(id)arg1 ;
-(void)deviceLockStateMayHaveChangedForModel:(id)arg1 ;
-(BOOL)hasAuthenticatedAtLeastOnceSinceBoot;
-(BOOL)isAuthenticatedCached;
-(void)revokeAuthenticationImmediatelyForPublicReason:(id)arg1 ;
-(void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)arg1 ;
-(void)revokeAuthenticationIfNecessaryForPublicReason:(id)arg1 ;
-(id)initWithAssertionManager:(id)arg1 policy:(id)arg2 ;
-(void)addAsFirstResponder:(id)arg1 ;
-(void)removeResponder:(id)arg1 ;
-(void)processAuthenticationRequest:(id)arg1 responder:(id)arg2 ;
-(void)processAuthenticationRequest:(id)arg1 ;
-(void)addAuthenticationAssertion:(id)arg1 ;
-(void)removeAuthenticationAssertion:(id)arg1 ;
-(double)_timeUntilUnblockedSinceReferenceDate;
-(void)_notifyOfAuthenticationSuccess;
-(void)_addPrivateAuthenticationObserver:(id)arg1 ;
-(void)_removePrivateAuthenticationObserver:(id)arg1 ;
-(void)_setObservers:(id)arg1 ;
-(NSDate *)lastRevokedAuthenticationDate;
-(void)setHasPasscodeSet:(BOOL)arg1 ;
-(id)_policy;
-(void)_setPolicy:(id)arg1 ;
-(id)_lastIncorrectPasscodeAttempt;
-(void)_setLastIncorrectPasscodeAttempt:(id)arg1 ;
-(id)_assertionManager;
-(void)_setAssertionManager:(id)arg1 ;
-(id)_transientAuthCheckingAssertion;
-(void)_setTransietAuthCheckingAssertion:(id)arg1 ;
-(id)_responders;
-(void)_setResponders:(id)arg1 ;
//-(CFRunLoopObserverRef)_runLoopObserver;
//-(void)_setRunLoopObserver:(CFRunLoopObserverRef)arg1 ;
-(id)_unblockTimer;
-(void)_setUnblockTimer:(id)arg1 ;
-(void)_setAuthenticationState:(long long)arg1 ;
-(BOOL)_lastAuthStateWasAuthenticated;
-(void)_setLastAuthStateWasAuthenticated:(BOOL)arg1 ;
-(BOOL)_shouldFetchAuthenticationState;
-(void)_setShouldFetchAuthenticationState:(BOOL)arg1 ;
-(BOOL)_isInSecureMode;
-(void)_setInSecureMode:(BOOL)arg1 ;
-(BOOL)_okToSendNotifications;
-(BOOL)_hasBeenAuthenticatedOnceSinceBoot;
-(BOOL)isAuthenticated;
-(id)_observers;
-(void)_setModel:(id)arg1 ;
-(id)descriptionWithMultilinePrefix:(id)arg1 ;
-(id)succinctDescription;
-(id)succinctDescriptionBuilder;
-(id)descriptionBuilderWithMultilinePrefix:(id)arg1 ;
-(id)_model;
@end
%hook SBFUserAuthenticationController

+(BOOL)_isInGracePeriodState{
	BOOL val = %orig;
	HBLogDebug(@"_isInGracePeriodState %d", val);
	return val;
}
//: Called user uses finger as passcode
+(BOOL)_isInBioUnlockState{
	BOOL val = %orig;
	HBLogDebug(@"_isInBioUnlockState %d", val);
	return val;
}
+(long long)_extendedKeybagState {
	long long val = %orig;
	HBLogDebug(@"_extendedKeybagState %lld", val);
	return val;
}
-(void)dealloc {
	HBLogDebug(@"This class is being deallocated");
	%orig;
}
//: Prints out SBFUserAuthenticationController: 0x1744e1580; authState: Revoked; passcodeSet: YES
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
	HBLogDebug(@"keybagDidUnlockForTheFirstTime, arg1: %@", val);
	%orig;
}
//: Prints out SBFUserAuthenticationController: 0x1744e1580; authState: Revoked; hasPasscodeSet: YES; revokedAuthDate: 2018-08-12 16:59:23 -0400
-(id)publicDescription {
	id val = %orig;
	HBLogDebug(@"publicDescription, return val: %@", val);
	return val;
}
-(void)keybag:(id)arg1 extendedStateDidChange:(id)arg2 {
	id val = arg1;
	id val2 = arg2;
	HBLogDebug(@"keybag called, arg1: %@ (arg2) value: %@", val, val2);
	%orig;
}
//: Tells us whether there is a passcode set 
-(BOOL)hasPasscodeSet {
	BOOL val = %orig;
	HBLogDebug(@"hasPasscodeSet %d", val);
	return val;
}
-(id)initWithAssertionManager:(id)arg1 policy:(id)arg2 keybag:(id)arg3 model:(id)arg4 {
	id val = arg1; 
	id val2 = arg2; 
	id val3 = arg3; 
	id val4 = arg4; 
	id finalValue = %orig;
	HBLogDebug(@"initWithAssertionManager, arg values: %@ %@ %@ %@ return val: %@", val, val2, val3, val4, finalValue);
	return %orig;
}
-(void)_initializeAuthenticationStateAndDateForLockState:(long long)arg1 {
	long long val = arg1;
	HBLogDebug(@"_initializeAuthenticationStateAndDateForLockState %lld", val); 
	%orig;
}

-(void)_establishAuthenticationStateForInit:(long long)arg1 {
	long long val = arg1;
	HBLogDebug(@"_establishAuthenticationStateForInit, arg1: %lld", val);
	//%log;
	%orig;
}
-(void)_setupPolicy:(id)arg1 {
	id val = arg1;
	HBLogDebug(@"_setupPolicy arg1: %@", val);
	%orig;
}
-(void)_setHasBeenAuthenticatedOnceSinceBoot:(BOOL)arg1 {
	BOOL val = arg1;
	HBLogDebug(@"_setHasBeenAuthenticatedOnceSinceBoot, arg1: %d", val);
	%orig;
}
//
-(void)_clearUnblockTimer {
	HBLogDebug(@"_clearUnblockTimer");
	//%log;
	%orig;
}

-(void)_addAsFirstResponder:(id)arg1 {
	id val = arg1;
	HBLogDebug(@"_addAsFirstResponder, arg1: %@", val);
	//%log;
	%orig;
}
-(void)_removeAuthResponder:(id)arg1 {
	id val = arg1;
	HBLogDebug(@"_removeAuthResponder, arg1: %@", val);
	//%log;
	%orig;
}
-(BOOL)_processAuthenticationRequest:(id)arg1 responder:(id)arg2 {
	BOOL val = %orig;
	HBLogDebug(@"_processAuthenticationRequest, arg1: %@ responder %@", arg1, arg2);
	//%log;
	return val;
}
-(long long)_evaluateAuthenticationAttempt:(id)arg1 outError:(id*)arg2 {
	long long val = %orig;
	HBLogDebug(@"_evaluateAuthenticationAttempt, arg1: %@ arg2: %@", arg1, *arg2);
	//%log;
	return val;
}

-(void)_notifyClientsOfAuthenticationResult:(long long)arg1 forRequest:(id)arg2 error:(id)arg3 withResponder:(id)arg4 {
	HBLogDebug(@"_notifyClientsOfAuthenticationResult, arg1: %lld, arg2: %@, arg3: %@, responder: %@", arg1, arg2, arg3, arg4);
	//%log;
	%orig;
}
// arg1 a 1 if failed passcode attempt is 2 if success
//Dont change this
-(BOOL)_boolForAuthenticationResult:(long long)arg1 {
	BOOL val = %orig;
	HBLogDebug(@"_boolForAuthenticationResult arg1: %lld, return val: %d", arg1, val);
	//%log;
	//[self _clearBlockedState];
	return val;
}
//: called when pass is correct
-(void)_handleSuccessfulAuthentication:(id)arg1 responder:(id)arg2  {
	HBLogDebug(@"_handleSuccessfulAuthentication, arg1: %@, responder: %@", arg1, arg2);
	//%log;
	%orig;
}

-(void)_handleFailedAuthentication:(id)arg1 error:(id)arg2 responder:(id)arg3 {
	HBLogDebug(@"_handleFailedAuthentication, arg1: %@, arg2: %@, responder: %@", arg1, arg2, arg3);
	//%log;
	%orig;
	//[self _clearBlockedState];
}
-(void)_handleInvalidAuthentication:(id)arg1 responder:(id)arg2 {
	HBLogDebug(@"_handleInvalidAuthentication, arg1: %@, responder: %@", arg1, arg2);
	//%log;
	%orig;
}
//: This triggers the timer
-(void)_scheduleUnblockTimer {
	HBLogDebug(@"_scheduleUnblockTimer");
	//%log;
	//%orig;
	//[self _unblockTimerFired];
	%orig;
}
-(void)_setAuthState:(long long)arg1  {
	HBLogDebug(@"_setAuthState, arg1 %lld", arg1);
	//%log;
	%orig;
}
-(void)_updateAuthenticationStateImmediately:(BOOL)arg1 forPublicReason:(id)arg2 {
	HBLogDebug(@"_updateAuthenticationStateImmediately, arg1 %d, reason: %@", arg1, arg2);
	%orig;
}
-(long long)_authenticationState {
	long long val = %orig;
	HBLogDebug(@"_authenticationState, return val: %lld", val);
	//%log;
	return val;
}
//: Called when user uses finger as passcode
-(BOOL)_performNilPasscodeCheck{
	BOOL val = %orig;
	HBLogDebug(@"_performNilPasscodeCheck return val: %d", val);
	return val;
}

-(void)_uncachePasscodeIfNecessary{
	HBLogDebug(@"_uncachePasscodeIfNecessary");
	//%log;
	%orig;
}
//: arg2 is 1 or true when locked and 0 when unlocked
-(void)_setSecureMode:(BOOL)arg1 postNotification:(BOOL)arg2 {
	HBLogDebug(@"_setSecureMode, arg1: %d, notification: %d", arg1, arg2);
	//%log;
	%orig;
}

-(BOOL)_isUserAuthenticated{
	BOOL val = %orig;
	HBLogDebug(@"_isUserAuthenticated %d", val);
	return val;
}

-(void)_revokeAuthenticationImmediately:(BOOL)arg1 forPublicReason:(id)arg2 {
	BOOL val = arg1;
	HBLogDebug(@"_revokeAuthenticationImmediately, arg1: %d, reason %@", val, arg2);
	%orig;
}

-(BOOL)_authenticateIfInGracePeriod {
	BOOL val = %orig;
	HBLogDebug(@"_authenticateIfInGracePeriod, %d", val);
	//%log;
	return val;
}
-(void)_updateAuthenticationStateForPublicReason:(id)arg1 {
	HBLogDebug(@"_updateAuthenticationStateForPublicReason, arg1: %@", arg1);
	//%log;
	 %orig;
}
//: THIS PUTS OUR PHONE IN A LOOP NOT SURE WHY
// -(BOOL)isAssertionValid:(id)arg1 {
// 	//%orig;
// 	HBLogDebug(@"isAssertionValid, arg1: %@", arg1);
// 	return YES;
// }

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
	HBLogDebug(@"_notifyAboutTemporaryBlockStatusChanged");
	//%log;
	 %orig;
}
-(BOOL)_isTemporarilyBlocked {
	BOOL val = %orig;
	HBLogDebug(@"_isTemporarilyBlocked, return val %d", val);
	return NO;
}
-(BOOL)_isPermanentlyBlocked {
	 BOOL val = %orig;
	HBLogDebug(@"_isPermanentlyBlocked, return val %d", val);
	return NO;
}
-(void)_refreshModelCacheIfNeeded{
	HBLogDebug(@"_refreshModelCacheIfNeeded");
	//%log;
	%orig;
}
//: hmmm
-(long long)_evaluatePasscodeAttempt:(id)arg1 outError:(id*)arg2 {
	long long val = %orig;
	HBLogDebug(@"_evaluatePasscodeAttempt, arg1: %@, error: %@, returnVal: val: %lld", arg1, *arg2, val);
	//%log;
	return val;
}
-(long long)_evaluateMesaAttempt:(id)arg1 {
	long long val = %orig;
	HBLogDebug(@"_evaluateMesaAttempt, arg1: %@, returnVal: %lld", arg1, val);
	//%log;
	return val;
}
//: IMPORTANT
-(BOOL)_authenticateWithPasscodeData:(id)arg1 outError:(id*)arg2 {
	BOOL val = %orig;
	HBLogDebug(@"_authenticateWithPasscodeData called with -> arg1: %@, outError: %@, returnVal: %d", arg1, *arg2, val);
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
	return val;
}
-(void)_setup_runLoopObserverIfNecessary{
	//%log;
	HBLogDebug(@"_setup_runLoopObserverIfNecessary");
	%orig;
}
-(void)_invalidateCachedPasscodeLockState {
	//%log;
	HBLogDebug(@"_invalidateCachedPasscodeLockState");
	%orig;
}
-(void)_updateSecureModeIfNecessaryForNewAuthState {
	//%log;
	HBLogDebug(@"_updateSecureModeIfNecessaryForNewAuthState");
	%orig;
}
//arg1 is 1 or true when bootup
-(void)_setOkToSendNotifications:(BOOL)arg1  {
	//%log;
	HBLogDebug(@"_setOkToSendNotifications, arg1: %d", arg1);
	%orig;
}
//: i do have passcode
-(void)_updateHasPasscodeSetForLockState:(long long)arg1 {
	//%log;
	HBLogDebug(@"_updateHasPasscodeSetForLockState, arg1: %lld", arg1);
	%orig;
}
-(BOOL)_shouldRevokeAuthenticationNow{
	BOOL val = %orig;
	HBLogDebug(@"_shouldRevokeAuthenticationNow %d", val);
	return val;
}
//: yum this is called when timer is up and user can enter next input
-(void)_unblockTimerFired {
	//%log;
	HBLogDebug(@"_unblockTimerFired");
	%orig;
}
-(void)_updateAuthenticationStateAndFirstAuthenticationForLockState:(long long)arg1 {
	//%log;
	HBLogDebug(@"_updateAuthenticationStateAndFirstAuthenticationForLockState, arg1: %lld", arg1);
	%orig;
}
-(void)_updateAuthenticationStateAndDateForLockState:(id)arg1 {
	//%log;
	HBLogDebug(@"_updateAuthenticationStateAndDateForLockState, arg1: %@", arg1);
	%orig;
}
-(void)deviceLockModelRequestsDeviceWipe:(id)arg1 {
	//%log;
	HBLogDebug(@"deviceLockModelRequestsDeviceWipe, arg1: %@", arg1);
	%orig;
}
-(void)deviceLockStateMayHaveChangedForModel:(id)arg1 {
	//%log;
	HBLogDebug(@"deviceLockStateMayHaveChangedForModel, arg1: %@", arg1);
	%orig;
}
//: Does what it says
-(BOOL)hasAuthenticatedAtLeastOnceSinceBoot {
	BOOL val = %orig;
	//%log;
	HBLogDebug(@"hasAuthenticatedAtLeastOnceSinceBoot, returnVal: %d", val);
	return val;
}
-(BOOL)isAuthenticatedCached {
	BOOL val = %orig;
	//%log;
	HBLogDebug(@"isAuthenticatedCached, returnVal: %d", val);
	return val;
}
-(void)revokeAuthenticationImmediatelyForPublicReason:(id)arg1 {
	//%log;
	HBLogDebug(@"revokeAuthenticationImmediatelyForPublicReason, arg1: %@", arg1);
	%orig;
}
-(void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)arg1 {
	//%log;
	HBLogDebug(@"revokeAuthenticationImmediatelyIfNecessaryForPublicReason, arg1: %@", arg1);
	%orig;
}
-(void)revokeAuthenticationIfNecessaryForPublicReason:(id)arg1 {
	//%log;
	HBLogDebug(@"revokeAuthenticationIfNecessaryForPublicReason, arg1: %@", arg1);
	%orig;
}
-(id)initWithAssertionManager:(id)arg1 policy:(id)arg2  {
	id val = %orig;
	//%log;
	HBLogDebug(@"initWithAssertionManager, arg1: %@, arg2: %@", arg1, arg2);
	return val;
}
-(void)addAsFirstResponder:(id)arg1 {
	//%log;
	HBLogDebug(@"addAsFirstResponder, arg1: %@", arg1);
	%orig;
}
-(void)removeResponder:(id)arg1 {
	//%log;
	HBLogDebug(@"removeResponder, arg1: %@", arg1);
	%orig;
}

-(void)processAuthenticationRequest:(id)arg1 responder:(id)arg2 {
	//%log;
	HBLogDebug(@"processAuthenticationRequest, arg1: %@, arg2: %@", arg1, arg2);
	%orig;
}
-(void)processAuthenticationRequest:(id)arg1 {
	//%log;
	HBLogDebug(@"processAuthenticationRequest, arg1: %@", arg1);
	%orig;
}
-(void)addAuthenticationAssertion:(id)arg1 {
	//%log;
	HBLogDebug(@"addAuthenticationAssertion, arg1: %@", arg1);
	%orig;
}
-(void)removeAuthenticationAssertion:(id)arg1 {
	//%log;
	HBLogDebug(@"removeAuthenticationAssertion, arg1: %@", arg1);
	%orig;
}
-(double)_timeUntilUnblockedSinceReferenceDate{
	double val = %orig;
	//%log;
	HBLogDebug(@"_timeUntilUnblockedSinceReferenceDate, returnVal: %f", val);
	return val;
}
-(void)_notifyOfAuthenticationSuccess {
	//%log;
	HBLogDebug(@"_notifyOfAuthenticationSuccess");
	%orig;
}
-(void)_addPrivateAuthenticationObserver:(id)arg1 {
	HBLogDebug(@"_addPrivateAuthenticationObserver, arg1: %@", arg1);
	%orig;
}
-(void)_removePrivateAuthenticationObserver:(id)arg1 {
	HBLogDebug(@"_removePrivateAuthenticationObserver, arg1: %@", arg1);
	%orig;
}
-(void)_setObservers:(id)arg1 {
	HBLogDebug(@"_setObservers, arg1: %@", arg1);
	%orig;
}
//: Prints when the last valid password entered was
-(NSDate *)lastRevokedAuthenticationDate {
	NSDate *val = %orig;
	HBLogDebug(@"lastRevokedAuthenticationDate, value  %@", val);
	return val;
}
-(void)setHasPasscodeSet:(BOOL)arg1  {
	HBLogDebug(@"setHasPasscodeSet, arg1: %d", arg1);
	%orig;
}
-(id)_policy {
	id val = %orig;
	HBLogDebug(@"_policy, returnVal: %@", val);
	return val;
}
-(void)_setPolicy:(id)arg1 {
	HBLogDebug(@"_setPolicy, arg1: %@", arg1);
	%orig;
}

-(id)_lastIncorrectPasscodeAttempt {
	id val = %orig;
	HBLogDebug(@"_lastIncorrectPasscodeAttempt, returnVal: %@", val);
	return val;
}
-(void)_setLastIncorrectPasscodeAttempt:(id)arg1 {
	id val = arg1;
	HBLogDebug(@"_setLastIncorrectPasscodeAttempt, arg1: %@", val);
	%orig;
}

-(id)_assertionManager {
	id val = %orig;
	HBLogDebug(@"_assertionManager, returnVal: %@", val);
	return val;
}
-(void)_setAssertionManager:(id)arg1  {
	HBLogDebug(@"_setAssertionManager, arg1: %@", arg1);
	%orig;
}
-(id)_transientAuthCheckingAssertion {
	id val = %orig;
	HBLogDebug(@"_transientAuthCheckingAssertion, returnVal: %@", val);
	return val;
}
-(void)_setTransietAuthCheckingAssertion:(id)arg1 {
	HBLogDebug(@"_setTransietAuthCheckingAssertion, arg1: %@", arg1);
	%orig;
}
-(id)_responders {
	id val = %orig;
	HBLogDebug(@"_responders, returnVal: %@", val);
	return val;
}
-(void)_setResponders:(id)arg1 {
	HBLogDebug(@"_setResponders, arg1: %@", arg1);
	%orig;
}

-(id)_unblockTimer {
	id val = %orig;
	HBLogDebug(@"_unblockTimer, returnVal: %@", val);
	return val;
}

-(void)_setUnblockTimer:(id)arg1  {
	HBLogDebug(@"_setUnblockTimer, arg1 %@", arg1);
	%orig;
}

-(void)_setAuthenticationState:(long long)arg1  {
	HBLogDebug(@"_setAuthenticationState, arg1 %lld", arg1);
	%orig;

}
-(BOOL)_lastAuthStateWasAuthenticated {
	BOOL val = %orig;
	HBLogDebug(@"_lastAuthStateWasAuthenticated, returnVal: %d", val);
	return val;
}
-(void)_setLastAuthStateWasAuthenticated:(BOOL)arg1 {
	HBLogDebug(@"_setLastAuthStateWasAuthenticated, arg1 %d", arg1);
	%orig;
}
-(BOOL)_shouldFetchAuthenticationState {
	BOOL val = %orig;
	HBLogDebug(@"_shouldFetchAuthenticationState, returnVal: %d", val);
	return val;
}
-(void)_setShouldFetchAuthenticationState:(BOOL)arg1  {
	HBLogDebug(@"_setShouldFetchAuthenticationState, arg1 %d", arg1);
	%orig;
}
-(BOOL)_isInSecureMode {
	BOOL val = %orig;
	HBLogDebug(@"_isInSecureMode, returnVal: %d", val);
	return val;
}
-(void)_setInSecureMode:(BOOL)arg1  {
	HBLogDebug(@"_setInSecureMode, arg1 %d", arg1);
	%orig;
}
-(BOOL)_okToSendNotifications {
	BOOL val = %orig;
	HBLogDebug(@"_okToSendNotifications, returnVal: %d", val);
	return val;
}
-(BOOL)_hasBeenAuthenticatedOnceSinceBoot {
	BOOL val = %orig;
	HBLogDebug(@"_hasBeenAuthenticatedOnceSinceBoot, returnVal: %d", val);
	return val;
}
-(BOOL)isAuthenticated {
	BOOL val = %orig;
	HBLogDebug(@"isAuthenticated, returnVal: %d", val);
	return val;
}
-(id)_observers {
	id val = %orig;
	HBLogDebug(@"_observers, returnVal: %@", val);
	return val;
}
-(void)_setModel:(id)arg1 {
	HBLogDebug(@"_setModel, arg1 %@", arg1);
	%orig;
}
-(id)descriptionWithMultilinePrefix:(id)arg1 {
	id val = %orig;
	HBLogDebug(@"descriptionWithMultilinePrefix, returnVal: %@", val);
	return val;
}
-(id)succinctDescription {
	id val = %orig;
	HBLogDebug(@"succinctDescription, returnVal: %@", val);
	return val;
}
-(id)succinctDescriptionBuilder {
	id val = %orig;
	HBLogDebug(@"succinctDescriptionBuilder, returnVal: %@", val);
	return val;
}
-(id)descriptionBuilderWithMultilinePrefix:(id)arg1 {
	id val = %orig;
	HBLogDebug(@"descriptionBuilderWithMultilinePrefix, returnVal: %@", val);
	return val;
}
-(id)_model {
	id val = %orig;
	HBLogDebug(@"_model, returnVal: %@", val);
	return val;
}

%end

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)arg1 {
	%orig;
	HBLogDebug(@"applicationDidFinishLaunching");
}
%end